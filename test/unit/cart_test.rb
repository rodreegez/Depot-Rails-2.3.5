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
end
