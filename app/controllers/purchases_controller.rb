class PurchasesController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!

  def index
    @cart_items = current_cart.cart_items
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: params[:amount],
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end


  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end


end
