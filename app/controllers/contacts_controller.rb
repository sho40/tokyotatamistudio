class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      NotificationMailer.contact_mail(@contact).deliver
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :title, :message)
  end
end
