if Rails.env.production?

  mail = ENV["OWNER_ADDRESS"]
  pass = ENV["OWNER_ADDRESS_PASSWORD"]

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: "smtp.yahoo.co.jp",
    domain: "yahoo.co.jp",
    port: 587,
    user_name: mail,
    password: pass,
    authentication: 'plain',
    enable_starttls_auto: true
  }
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener
else
  ActionMailer::Base.delivery_method = :test
end
