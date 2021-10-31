class CartItem < ApplicationRecord

def subtotal
    item.with_tax_price.to_i * amount.to_i
end

  belongs_to :customer
  belongs_to :item
end
