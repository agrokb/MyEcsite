class Product < ApplicationRecord
  include CodeGenerator
  
  has_rich_text :description
  has_one_attached :cover_image

  validates :name, presence: true
  validates :list_price, :sell_price,presence: true,numericality: { greater_than: 0,allow_nil: true}
  validates :code, uniqueness: true
  belongs_to :category, optional: true
  belongs_to :vendor
  has_many :skus
  accepts_nested_attributes_for :skus,reject_if: :all_blank,allow_destroy: true
end
