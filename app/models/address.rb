class Address < ApplicationRecord

  belongs_to :customer
  validates :name, :postal_code, :address, presence: true


  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end