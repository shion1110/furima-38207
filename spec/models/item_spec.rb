require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる時' do
      it 'すべての商品を入力すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない時' do
      it '商品名が空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '画像を一枚つけなかったら出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.item_version = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item version can't be blank")
      end
      it 'カテゴリーを選択しないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態を選択しないと出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it '配送料の負担の情報を選択しないと出品できない' do
        @item.delivary_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivary charge must be other than 1')
      end
      it '発送元の地域を選択しないと出品できない' do
        @item.consignor_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Consignor area must be other than 1')
      end
      it '発送までの日数を選択しないと出品できない' do
        @item.days_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days ship must be other than 1')
      end
      it '価格を入力しないと出品できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.cost = '1あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is not a number')
      end
      it '価格が300円未満では出品できない' do
        @item.cost = 277
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be greater than or equal to 300')
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.cost = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be less than or equal to 9999999')
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
