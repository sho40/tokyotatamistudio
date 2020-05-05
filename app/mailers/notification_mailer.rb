class NotificationMailer < ApplicationMailer
  layout 'mailer'

  def send_confirm_to_customer(customer, cart_items, amount)
    @customer = customer
    email_with_name = %("#{@customer.name} 様" <#{@customer.email}> )
    @cart_items = cart_items
    @amount = amount

    mail(
      subject: "購入内容確認のお知らせ / 東京畳工房",
      to: email_with_name,
      bcc: ENV['OWNER_ADDRESS']
    ) do |format|
      format.text
    end
  end
  
  def send_cache_confirm_to_customer(customer, cart_items, amount)
    @customer = customer
    email_with_name = %("#{@customer.name} 様" <#{@customer.email}> )
    @cart_items = cart_items
    @amount = amount

    mail(
      subject: "購入内容確認のお知らせ/ 東京畳工房",
      to: email_with_name,
      bcc: ENV['OWNER_ADDRESS']
    ) do |format|
      format.text
    end
  end

  def contact_mail(contact)
    @contact = contact
    mail to: ENV['OWNER_ADDRESS'], subject: 'お客様からのお問い合わせ'
    
  end
end
