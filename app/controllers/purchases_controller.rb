class PurchasesController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!

  def index
    @cart_items = current_cart.cart_items
    @total = []
    @cart_items.each do |item|
      @subtotal = item.product.price * item.quantity
      @total << @subtotal
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: params[:amount],
      card: params['payjpToken'],
      currency: 'jpy',
    )
    purchase = Purchase.new(purchase_params)
    @cart_items = current_cart.cart_items
    @customer = Customer.find_by(id: purchase.customer_id)
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
