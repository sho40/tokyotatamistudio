class NotificationMailer < ApplicationMailer
  default from: "東京畳工房"
  layout 'mailer'

  def send_confirm_to_customer(customer)
    @customer = customer
    email_with_name = %("#{@customer.name} 様" <#{@customer.email}> )

    mail(
      subject: "ご注文内容確認 / 東京畳工房",
      to: email_with_name
    ) do |format|
      format.text
    end
  end
end
