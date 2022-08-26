class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum making_status: {making_not: 0,making_wait: 1,making_now: 2,making_comp: 3}
end
