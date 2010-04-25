class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url
end
