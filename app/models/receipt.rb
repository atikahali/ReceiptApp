class Receipt < ApplicationRecord
  validates :user, presence: true
  validates :quantity, presence: true
  validates :product, presence: true
  validates :price, presence: true
  validates :total, presence: true
end
