class Order < ApplicationRecord

  def full_name
    self.last_name + " " + self.first_name
  end

  belongs_to :customers

end
