class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates :recipient, :tel, :address,presence: true

  before_create :generate_order_num
  private
  def generate_order_num
    self.num = SecureRandom(4)
  end
end
