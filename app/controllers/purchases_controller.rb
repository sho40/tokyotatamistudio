class PurchasesController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!

  def index
    @cart_items = current_cart.cart_items
    @total = []
    @cart_items.each do |item|
      @subtotal = item.product.price * item.quantity
      @total << @subtotal
      if @total.sum >= 7000
        @freight = 0
      else
        @freight = 200
      end
    end
  end

  def pay
    purchase = Purchase.new(purchase_params)
    @cart_items = current_cart.cart_items
    @customer = Customer.find_by(id: purchase.customer_id)
    if params[:cache] #現金決済
      if purchase.save
        @cart_items.each do |item|
          @stock = item.product.stock -= item.quantity
          item.product.update(stock: @stock)
        end
        session[:cart_id] = nil
        NotificationMailer.send_cache_confirm_to_customer(@customer).deliver
        redirect_to purchases_cache_path
      else
        render :index
      end
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #カード決済
      Payjp::Charge.create(
        amount: params[:amount],
        card: params['payjpToken'],
        currency: 'jpy',
      )
      if purchase.save
        @cart_items.each do |item|
          @stock = item.product.stock -= item.quantity
          item.product.update(stock: @stock)
        end
        session[:cart_id] = nil
        NotificationMailer.send_confirm_to_customer(@customer).deliver
      else
        render :index
      end
    end
  end

  def cache
  end



  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end

  def purchase_params
    params.permit(
      :amount, :cart_id, :customer_id
    )
  end


end
