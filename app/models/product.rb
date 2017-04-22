class Product < ApplicationRecord
  validates :name, :unit_price, presence:true
  validates :unit_price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true
end
