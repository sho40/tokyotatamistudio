require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "nameがない場合は登録できないこと" do
    contact = build(:contact, name: "")
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
  end

  it "emailがない場合は登録できないこと" do
    contact = build(:contact, email: "")      
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end

  it "@マークのあとのドメイン" do
    contact = build(:contact, email: "example@eee")
    contact.valid?
    expect(contact.errors[:email]).to include("は不正な値です")
  end

  it "titleがない場合は登録できないこと" do
    contact = build(:contact, title: "")      
    contact.valid?
    expect(contact.errors[:title]).to include("を入力してください")
  end

  it "messageがない場合は登録できないこと" do
    contact = build(:contact, message: "")      
    contact.valid?
    expect(contact.errors[:message]).to include("を入力してください")
  end
end
