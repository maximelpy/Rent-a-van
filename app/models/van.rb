class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_one_attached :photo
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 24 }
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
