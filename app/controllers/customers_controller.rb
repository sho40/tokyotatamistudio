class CustomersController < ApplicationController
  
  def edit
  end

  def update
    if current_customer.update(customer_params)
      redirect_to purchases_path
    else
      render :edit
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
