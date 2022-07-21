require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123'
        @user.password_confirmation = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '11111'
        @user.password_confirmation = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end 
      it 'family_kanjiが空では登録できない' do
        @user.family_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kanji can't be blank", "Family kanji is invalid")
      end
      it 'first_kanjiが空では登録できない' do
        @user.first_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kanji can't be blank", "First kanji is invalid")
      end
      it 'family_kanaが空では登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank", "Family kana is invalid")
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank", "First kana is invalid")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it '名字と名前（全角）でないと登録できない' do
        @user.family_kanji = 'a'
        @user.first_kanji ='a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kanji is invalid", "First kanji is invalid")
      end
      it '漢字、ひらがな、カタカナでないと登録できない' do
        @user.family_kanji = 'a'
        @user.first_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kanji is invalid", "First kanji is invalid")
      end
      it '名字と名前（全角、カタカナ）でないと登録できない' do
        @user.family_kana = 'a'
        @user.first_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid", "First kana is invalid")
      end
      it 'カタカナ でないと登録できない' do
        @user.family_kana = 'a'
        @user.first_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid", "First kana is invalid")
      end
    end
  end
end