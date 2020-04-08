class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    end
    render :new
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :title, :message)
  end
end
