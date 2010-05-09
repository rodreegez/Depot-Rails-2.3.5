require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'invalid if attrs are empty' do
    product = Product.new
    assert !product.valid?
    assert product.errors.invalid?(:title)
    assert product.errors.invalid?(:description)
    assert product.errors.invalid?(:price)
    assert product.errors.invalid?(:image_url)
  end
end
