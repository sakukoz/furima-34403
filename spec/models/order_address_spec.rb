require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'Address情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it 'postcodeが空だと保存できないこと' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postcode = 1_234_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'region_idが空では保存できないこと' do
        @order_address.region_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'region_idが1では保存できないこと' do
        @order_address.region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Region must be other than 1')
      end
      it 'cityが空では保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では保存できないこと' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは11桁の数値のみ保存可能なこと' do
        @order_address.phone = '234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is the wrong length (should be 11 characters)')
      end
      it 'phoneは英数混合では保存できないなこと' do
        @order_address.phone = '234AAAAAAAA'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is not a number')
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
