class StoreController < ApplicationController
  def index
    @products = Product.find_all_products_for_sale
  end

end
