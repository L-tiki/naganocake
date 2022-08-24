class Item < ApplicationRecord
  has_many :cart_items,dependent: :destroy
  has_many :order_details,dependent: :destroy
  belongs_to :genre
  has_one_attached :image











  #消費税を加えた商品価格
  def add_tax_price
    (self.price * 1.10).round
  end
end