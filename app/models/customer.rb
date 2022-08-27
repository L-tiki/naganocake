class Customer < ApplicationRecord
  has_many :cart_items,dependent: :destroy
  has_many :orders,dependent: :destroy
  has_many :addresses,dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :postal_code,length: { minimum: 1, maximum: 7 }
         validates :telephone_number,length: { minimum: 6, maximum: 11 }

  #会員フルネーム
  def full_name
    self.last_name + self.first_name
  end

  #会員フルネーム（カナ）
  def full_name_kana
    self.last_name_kana + self.first_name_kana
  end

end
