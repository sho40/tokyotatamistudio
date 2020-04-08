class NotificationMailer < ApplicationMailer
  layout 'mailer'

  def send_confirm_to_customer(customer)
    default from:     '東京畳工房',
            reply_to: 'andotatsuhiro5@gmail.com'
    @customer = customer
    email_with_name = %("#{@customer.name} 様" <#{@customer.email}> )

    mail(
      subject: "ご注文内容確認 / 東京畳工房",
      to: email_with_name
    ) do |format|
      format.text
    end
  end
  
  def contact_mail(contact)
    default from:     '東京畳工房',
            reply_to: 'andotatsuhiro5@gmail.com'
    @contact = contact
    mail to: ENV['OWNER_ADDRESS'], subject: 'お客様からのお問い合わせ'
    
  end
end
