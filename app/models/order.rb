class Order < ApplicationRecord

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_address
    '〒' + mailing_address_postal_code + ' ' + mailing_address + ' ' + mailing_address_name
  end
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }

end
