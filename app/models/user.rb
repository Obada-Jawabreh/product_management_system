class User < ApplicationRecord
  has_many :products, dependent: :destroy 
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :name, presence: true
  validates :role, inclusion: { in: [true, false] }
end
