class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product, current_item)
    # current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price(product)
    current_item = line_items.find_by(product_id: product.id)
    current_item = add_product(product, current_item)
    if current_item.product.special_price && (current_item.quantity > current_item.product.special_qty)
      
      offer_qty = current_item.quantity / current_item.product.special_qty
      offer_total_price = offer_qty * current_item.product.special_price

      piece_qty = current_item.quantity % current_item.product.special_qty
      piece_total_price =  piece_qty * current_item.product.unit_price

      total_price = offer_total_price + piece_total_price
    else
      total_price = current_item.quantity * current_item.product.unit_price
    end
    total_price
  end

  # def promo(product)
  #   byebug
  #   current_item = line_items.find_by(product_id: product_id)
  #   current_item.special_price ? true : false
  # end

end
