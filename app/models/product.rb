class Product < ApplicationRecord
  validates :name, :unit_price, presence:true
  validates :unit_price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items Present')
      throw :abort
  end

end

