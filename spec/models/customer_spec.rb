require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe '#create' do

    #name
    it "nameがない場合は登録できないこと" do
      customer = build(:customer, name: "")
      customer.valid?
      expect(customer.errors[:name]).to include("を入力してください")
    end
    
    #tel
    it "telがない場合は登録できないこと" do
      customer = build(:customer, tel: "")      
      customer.valid?
      expect(customer.errors[:tel]).to include("を入力してください")
    end

    it "telが11桁以上の場合は登録できない" do
      customer = build(:customer, tel: "090123412341")      
      customer.valid?
      expect(customer.errors[:tel]).to include("は不正な値です")
    end
    
    it "telの始まりが000は登録できない" do
      customer = build(:customer, tel: "00012341234")      
      customer.valid?
      expect(customer.errors[:tel]).to include("は不正な値です")
    end

    #email
    it "emailがない場合は登録できないこと" do
      customer = build(:customer, email: "")      
      customer.valid?
      expect(customer.errors[:email]).to include("を入力してください")
    end

    it "@マークのあとのドメイン" do
      customer = build(:customer, email: "example@eee")
      customer.valid?
      expect(customer.errors[:email]).to include("は不正な値です")
    end

    #password
    it "passwordがない場合は登録できないこと" do
      customer = build(:customer, password: "")
      customer.valid?
      expect(customer.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationがない場合は登録できないこと" do
      customer = build(:customer, password_confirmation: "")
      customer.valid?
      expect(customer.errors[:password_confirmation]).to include("を入力してください")
    end

    #住所
    it "postcodeがない場合は登録できないこと" do
      customer = build(:customer, postcode: "")
      customer.valid?
      expect(customer.errors[:postcode]).to include("を入力してください")
    end

    it "prefecture_codeがない場合は登録できないこと" do
      customer = build(:customer, prefecture_code: "")
      customer.valid?
      expect(customer.errors[:prefecture_code]).to include("を入力してください")
    end

    it "address_cityがない場合は登録できないこと" do
      customer = build(:customer, address_city: "")
      customer.valid?
      expect(customer.errors[:address_city]).to include("を入力してください")
    end

    it "address_streetがない場合は登録できないこと" do
      customer = build(:customer, address_street: "")
      customer.valid?
      expect(customer.errors[:address_street]).to include("を入力してください")
    end
    
  end
end
