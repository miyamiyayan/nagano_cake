class Order < ApplicationRecord

  def full_name
    self.last_name + " " + self.first_name
  end

  belongs_to :customer
  has_many :order_details, dependent: :destroy

end
