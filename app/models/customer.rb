class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + full_name
  end

  has_many :orders, dependent: :destroy
  # has_many :address
  has_many :cart_items, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
  validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  validates :postal_code, format: { with: /\A\d{7}\z/ }

end
