class Order < ActiveRecord::Base
  has_many :line_items

  PAYMENT_TYPES = [
      ["Check", "check"],
      ["Credit Card", "cc"],
      ["Purchace Order", "po"]
    ]
end
