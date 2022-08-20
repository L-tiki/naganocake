class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, format: /\A[0-9]+\z/ #郵便番号数字のみ
end
