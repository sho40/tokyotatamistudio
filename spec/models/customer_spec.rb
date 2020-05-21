require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe '#create' do
    it "nameがない場合は登録できないこと" do
      customer = Customer.new(name: "",tel: "09012345676",email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", postcode: "1900013", prefecture_code: "東京都", address_city: "立川市", address_street: "一番町345-11")
      customer.valid?
      expect(customer.errors[:name]).to include("を入力してください")
    end

    it "telがない場合は登録できないこと" do
      customer = Customer.new(name: "武",tel: "",email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", postcode: "1900013", prefecture_code: "東京都", address_city: "立川市", address_street: "一番町345-11")
      customer.valid?
      expect(customer.errors[:tel]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      customer = Customer.new(name: "武",tel: "09012345676",email: "", password: "00000000", password_confirmation: "00000000", postcode: "1900013", prefecture_code: "東京都", address_city: "立川市", address_street: "一番町345-11")
      customer.valid?
      expect(customer.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      customer = Customer.new(name: "武",tel: "09012345676",email: "kkk@gmail.com", password: "", password_confirmation: "00000000", postcode: "1900013", prefecture_code: "東京都", address_city: "立川市", address_street: "一番町345-11")
      customer.valid?
      expect(customer.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationがない場合は登録できないこと" do
      customer = Customer.new(name: "武",tel: "09012345676",email: "kkk@gmail.com", password: "00000000", password_confirmation: "", postcode: "1900013", prefecture_code: "東京都", address_city: "立川市", address_street: "一番町345-11")
      customer.valid?
      expect(customer.errors[:password_confirmation]).to include("を入力してください")
    end

    it "postcodeがない場合は登録できないこと" do
      customer = Customer.new(name: "武",tel: "09012345676",email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", postcode: "", prefecture_code: "東京都", address_city: "立川市", address_street: "一番町345-11")
      customer.valid?
      expect(customer.errors[:postcode]).to include("を入力してください")
    end

    it "prefecture_codeがない場合は登録できないこと" do
      customer = Customer.new(name: "武",tel: "09012345676",email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", postcode: "1900013", prefecture_code: "", address_city: "立川市", address_street: "一番町345-11")
      customer.valid?
      expect(customer.errors[:prefecture_code]).to include("を入力してください")
    end

    it "address_cityがない場合は登録できないこと" do
      customer = Customer.new(name: "武",tel: "09012345676",email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", postcode: "1900013", prefecture_code: "東京都", address_city: "", address_street: "一番町345-11")
      customer.valid?
      expect(customer.errors[:address_city]).to include("を入力してください")
    end

    it "address_streetがない場合は登録できないこと" do
      customer = Customer.new(name: "武",tel: "09012345676",email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", postcode: "1900013", prefecture_code: "東京都", address_city: "立川市", address_street: "")
      customer.valid?
      expect(customer.errors[:address_street]).to include("を入力してください")
    end
    
  end
end
