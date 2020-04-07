# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def send_confirm_to_customer
    customer = Customer.find_by(id: 8)
    NotificationMailer.send_confirm_to_customer(customer)
  end
end
