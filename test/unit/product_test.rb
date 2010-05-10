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

  test "positive price" do
    product = Product.new(:title       => "My Book Title",
                          :description => "yyy",
                          :image_url   => "zzz.jpg")
    product.price = -1
    assert !product.valid?
    assert_equal "should be at least 0.01", product.errors.on(:price)

    product.price = 0
    assert !product.valid?
    assert_equal "should be at least 0.01", product.errors.on(:price)

    product.price = 1
    assert product.valid?
  end

  test "image url" do
    good = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
               http://a.b.com/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.blah fred.gif.not_a_gif }

    good.each do |i|
      p = Product.new(:title => "Product",
                      :description => "ABC",
                      :price => "1",
                      :image_url => i)
      assert p.valid?, p.errors.full_messages
    end

    bad.each do |i|
      p = Product.new(:title => "Product",
                      :description => "ABC",
                      :price => "1",
                      :image_url => i)
      assert !p.valid?, p.errors.full_messages
    end
  end

end
