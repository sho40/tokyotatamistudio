class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery :expect => [:delete_item]

  helper_method :current_cart

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart
    end
  end

  private

  def basic_auth
    if Rails.env == "production"
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end
  end

end
