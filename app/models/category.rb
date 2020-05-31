class Category < ApplicationRecord
  act_as_paranoid
  has_many :products

  validates :name,presence: true
end
