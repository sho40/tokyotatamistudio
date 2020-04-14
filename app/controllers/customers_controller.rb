class CustomersController < ApplicationController
  
  def edit
  end

  def update
    if current_customer.update(customer_params)
      redirect_to purchases_path
    else
      @customer = current_customer
      session[:customer] = @customer.attributes.slice(*customer_params.keys)
      flash[:denger] = @customer.errors.full_messages
      redirect_to edit_customer_path(:id)
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :name, :tel, :email, :postcode, :prefecture_code, :address_city,
      :address_street, :address_building, :password, :password_confirmation,
      :encrypted_password,
      :reset_password_token, :reset_password_sent_at 
    )
  end

end
