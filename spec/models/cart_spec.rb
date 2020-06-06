require 'rails_helper'


RSpec.describe Cart, type: :model do
  let(:cart){ Cart.new }
  context "基本機能" do
    it "カゴに商品を入れる" do
      cart.add_sku(2) 
      expect(cart).not_to be_empty

    end
    it "同じ種類の商品カゴに入れて、購入項目増加さず、商品の数は変更できる" do
      3.times{ cart.add_sku(1)}
      2.times{ cart.add_sku(2)} 
      
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end
    it "入れた商品、取り消できる" do
     p1 = FactoryBot.create(:product, :with_skus)
     cart.add_sku(p1.skus.first.id)

     expect(cart.items.first.product).to be_a Product
    end

    it "可以計算整台購物車的總消費金額" do
     p1 = FactoryBot.create(:product,:with_skus, sell_price: 5)
     p2 = FactoryBot.create(:product,:with_skus,sell_price: 10)

     3.times{ cart.add_sku(p1.skus.first.id)}
     2.times{ cart.add_sku(p2.skus.first.id)}

     expect(cart.total_price).to eq 35
    end
  end
  
  context "追加機能" do
    it "可以將購物車內容轉換成Hash並存到Session裡" do
      p1 = FactoryBot.create(:product, :with_skus)
      p2 = FactoryBot.create(:product, :with_skus)

      3.times{ cart.add_sku(p1.id)}
      2.times{ cart.add_sku(p2.id)}

      expect(cart.serialize).to eq cart_hash
   end

   it "也可以存放在 Session 的內容（Hash 格式），還原成購物車的內容" do
     cart = Cart.from_hash(cart_hash)

     expect(cart.items.first.quantity).to be 3
   end
   
   private

   def cart_hash
    {
      "items" => [
        {"sku_id" => 1,"quantity" => 3},
        {"sku_id" => 2,"quantity" => 2},
      ]
    }
   end


  end
end
