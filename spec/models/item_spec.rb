require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "name,text,price,image,category_id,status_id,charge_id,prefecture_id,day_idが存在すれば商品は保存される" do
        expect(@item).to be_valid
      end
    end
    
    context "商品が保存できない場合" do
      it "nameが空だと保存できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end     
      it "textが空だと保存できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "category_idが空だと保存できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空だと保存できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "charge_idが空だと保存できない" do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it "prefecture_idが空だと保存できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "day_idが空だと保存できない" do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "priceに半角数字以外が入力された際、保存できない" do
        @item.price = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceに300以下の値が入力された際、保存できない" do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceに9999999以上の値が入力された際、保存できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
