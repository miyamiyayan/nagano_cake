class Item < ApplicationRecord

    attachment :image
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :genre

    validates :name, :introduction, :price, :image, presence: true



    def with_tax_price
      (price.to_i * 1.1).floor
    end

    def self.search(keyword)
      where(["name like?", "%#{keyword}%"])
    end

end
