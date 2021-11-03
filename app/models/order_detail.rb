class OrderDetail < ApplicationRecord


  def subtotal
    item.with_tax_price.to_i * amount.to_i
  end

  belongs_to :item
  belongs_to :order

  enum make_status: { huka: 0, mati: 1, seisaku: 2, seisakuok: 3 }

end
