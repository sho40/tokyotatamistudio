class ApplicationMailer < ActionMailer::Base
  default from:     "'東京畳工房からのお知らせ'",
          reply_to: 'andotatsuhiro5@gmail.com'
end
