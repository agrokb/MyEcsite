require 'rails_helper'


RSpec.describe Cart, type: :model do
  context "基本機能" do
    it "カゴに商品を入れる" do
      cart = Cart.new
      cart.add_item(2) 
      expect(cart.empty?).to be false
    end
  end

  context "追加機能" do
  end
end
