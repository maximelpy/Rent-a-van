class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 24 }
  validates :address, presence: true
end
