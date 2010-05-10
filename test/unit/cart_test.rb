require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products

  test "add unique products" do
    c = Cart.new
    ra = products(:rails_book)
    ru = products(:ruby_book)
    c.add_product ra
    c.add_product ru
    assert_equal 2, c.items.size
    assert_equal ra.price + ru.price, c.total_price
  end

  test "add duplicate product" do
    cart = Cart.new
    ra = products(:rails_book)
    cart.add_product ra
    cart.add_product ra
    assert_equal (2 * ra.price), cart.total_price
    assert_equal 1, cart.items.size
    assert_equal 2, cart.items[0].quantity
  end

end
