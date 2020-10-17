require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "太郎", first_name: "山田", last_kana: "タロウ", first_kana: "ヤマダ", birthday: "1999-03-07")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "yama", email: "", password: "00000000", password_confirmation: "00000000", last_name: "太郎", first_name: "山田", last_kana: "タロウ", first_kana: "ヤマダ", birthday: "1999-03-07")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "yama", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", last_name: "太郎", first_name: "山田", last_kana: "タロウ", first_kana: "ヤマダ", birthday: "1999-03-07")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank"),("Password confirmation doesn't match Password")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "yama", email: "kkk@gmail.com", password: "00000000", password_confirmation: "", last_name: "太郎", first_name: "山田", last_kana: "タロウ", first_kana: "ヤマダ", birthday: "1999-03-07")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空では登録できない" do
      user = User.new(nickname: "yama", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "", first_name: "山田", last_kana: "タロウ", first_kana: "ヤマダ", birthday: "1999-03-07")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "yama", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "太郎", first_name: "", last_kana: "タロウ", first_kana: "ヤマダ", birthday: "1999-03-07")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_kanaが空では登録できない" do
      user = User.new(nickname: "yama", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "太朗", first_name: "山田", last_kana: "", first_kana: "ヤマダ", birthday: "1999-03-07")
      user.valid?
      expect(user.errors.full_messages).to include("Last kana can't be blank")
    end
    it "first_kanaが空では登録できない" do
      user = User.new(nickname: "yama", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "太朗", first_name: "山田", last_kana: "タロウ", first_kana: "", birthday: "1999-03-07")
      user.valid?
      expect(user.errors.full_messages).to include("First kana can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nickname: "yama", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "太郎", first_name: "山田", last_kana: "タロウ", first_kana: "ヤマダ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
