class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  # def add_product(product, current_item)
  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item.total_price = total_price(product, current_item)
    current_item
  end

  def total_price(product, current_item)
    if current_item.product.special_price && (current_item.quantity >= current_item.product.special_qty)
      total_price = offer_total_price(current_item, product) + piece_total_price(current_item, product)
    else
      total_price = current_item.quantity * current_item.product.unit_price
    end
  end

  def offer_total_price(item, product)
    offer_qty = item.quantity / item.product.special_qty
    total = offer_qty * item.product.special_price
  end

  def piece_total_price(item, product)
    piece_qty = item.quantity % item.product.special_qty
    if piece_qty
      piece_total_price =  piece_qty * item.product.unit_price
    else
      piece_total_price = 0
    end
  end

  def grand_total
    line_items.to_a.sum { |item| item.total_price }
  end

end
