class Order < ActiveRecord::Base
  has_many :line_items

  PAYMENT_TYPES = [
      ["Check", "check"],
      ["Credit Card", "cc"],
      ["Purchace Order", "po"]
    ]

    validates_presence_of :name, :address, :email, :pay_type
    validates_inclusion_of :pay_type, :in =>
                            PAYMENT_TYPES.map {|disp, value| value}

    def add_line_items_from_cart(cart)
      cart.items.each do |i|
        li = LineItem.from_cart_item(i)
        line_items << li
      end
    end

end
