require 'rails_helper'


RSpec.describe Cart, type: :model do
  context "基本機能" do
    it "カゴに商品を入れる" do
      cart = Cart.new
      cart.add_item(2) 
      expect(cart.empty?).to be false
    end
    it "同じ種類の商品カゴに入れて、購入項目増加さず、商品の数は変更できる" do
      cart = Cart.new
      3.times{ cart.add_item(1)}
      2.times{ cart.add_item(2)} 
      
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end
    it "入れた商品、取り消できる" do
     cart = Cart.new
     p1 = FactoryBot.create(:product)
     cart.add_item(p1.id)

     expect(cart.items.first.product).to be_a Product
    end

    it "可以計算整台購物車的總消費金額"
    cart = Cart.new
    p1 = FactoryBot.create(:product, sell_price: 5)
    p2 = FactoryBot.create(:product, sell_price: 10)

    3.times{ cart.add_item(p1.id)}
    2.times{ cart.add_item(p2.id)}

    expect(cart.total_price).to eq 35
    end
  end
  
  context "追加機能" do
  end
end
