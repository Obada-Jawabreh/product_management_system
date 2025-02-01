class Product < ApplicationRecord
    belongs_to :user
    has_many_attached :images

    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :currency, presence: true
    validates :stock_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end
  