FactoryBot.define do

  factory :customer do
    name {"武"}
    tel {"09012345676"}
    email {"kkk@gmail.com"}
    password {"00000000"}
    password_confirmation {"00000000"}
    postcode {"1900013"}
    prefecture_code {"東京都"}
    address_city {"立川市"}
    address_street {"一番町345-11"}
  end
end