require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_ship = FactoryBot.build(:order_ship, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '購入できる時' do
      it 'すべての情報を入力すれば購入できる' do
        expect(@order_ship).to be_valid
      end
      it '建物名を入力しなくても購入できる' do
        @order_ship.build_name = ''
        expect(@order_ship).to be_valid
      end
    end
    context '購入できない時' do
      it 'post_codeが空だと購入できない' do
        @order_ship.post_code = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it 'consignor_areaが空だと購入できない' do
        @order_ship.consignor_area_id = 1
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Consignor area must be other than 1")
      end
      it 'shikuchosonが空だと購入できない' do
        @order_ship.shikuchoson = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Shikuchoson can't be blank")
      end
      it 'banchiが空だと購入できない' do
        @order_ship.banchi = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Banchi can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_ship.phone_number = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number can't be blank", "Phone number PhoneNumber must be 10or11 digit Half-width numbers")
      end
      it 'tokenが空だと購入できない' do
        @order_ship.token = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが3桁ハイフン4桁半角文字列じゃないと購入できない' do
        @order_ship.post_code = '１２３ー１２３'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
     
      it 'Phone numberが9桁以下では購入できない' do
        @order_ship.phone_number = '123456'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Phone number PhoneNumber must be 10or11 digit Half-width numbers')
      end
      it 'Phone numberが12桁以上では購入できない' do
        @order_ship.phone_number = '1234566666666'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Phone number PhoneNumber must be 10or11 digit Half-width numbers')
      end
      it 'Phone numberに半角数字以外が含まれている場合は購入できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @order_ship.phone_number = '1234２3４'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('Phone number PhoneNumber must be 10or11 digit Half-width numbers')
      end
      it 'userが紐付いていなければ購入できない' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end

