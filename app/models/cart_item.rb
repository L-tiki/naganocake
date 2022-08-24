class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  has_one_attached :image

  validates :item_id, :amount, presence: true
  validates :amount, numericality:{ only_integer: true }

  def sum_of_price
    item.taxin_price * amount
  end

  def subtotal
    item.with_tax_price * amount
  end

end
