class PurchasesController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!

  def index
    @cart_items = current_cart.cart_items
    @cart_items = current_cart.cart_items
    @total = []
    @cart_items.each do |item|
      @subtotal = item.product.price * item.quantity
      @total << @subtotal
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    binding.pry
    Payjp::Charge.create(
      amount: params[:amount],
      card: params['payjp-token'],
      currency: 'jpy'
    )
    purchase = Purchase.create(purchase_params)
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
