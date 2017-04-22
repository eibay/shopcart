require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products 

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

  test "product is not valid without a unique title" do 
    product = Product.new(name:   products(:one).name,
                          unit_price: 11,
                          special_qty: 3,
                          special_price: 28)
  end

end