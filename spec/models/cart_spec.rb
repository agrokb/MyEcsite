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
  end
  
  context "追加機能" do
  end
end
