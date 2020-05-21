require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "nameがない場合は登録できないこと" do
    customer = Customer.new(name: "",tel: "09012345676",email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", postcode: "1900013", prefecture_code: "東京都", address_city: "立川市", address_street: "一番町345-11")
    customer.valid?
    expect(customer.errors[:name]).to include("を入力してください")
  end
end
