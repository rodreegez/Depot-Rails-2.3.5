class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create(:title => 'Product 1',
                   :description => %{<p>'This is Product 1'},
                   :image_url => '/images/adam_mint.jpg',
                   :price => '0.01')
   Product.create(:title => 'Product 2',
                  :description => %{<p>'This is Product 2'},
                  :image_url => '/images/adam_mint.jpg',
                  :price => '0.02')
   Product.create(:title => 'Product 3',
                  :description => %{<p>'This is Product 3'},
                  :image_url => '/images/adam_mint.jpg',
                  :price => '0.03')
  end

  def self.down
    Product.delete_all
  end
end
