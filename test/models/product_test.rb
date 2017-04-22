require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:name].any?
    assert product.errors[:unit_price].any?
  end

  test "product unit price must be positive" do 
    product = Product.new(name: "Anime")
    
    product.unit_price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:unit_price]

    product.unit_price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:unit_price]

    product.unit_price = 1
    assert product.valid?
  end

end