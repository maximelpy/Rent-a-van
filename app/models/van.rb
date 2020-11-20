class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :users, through: :bookings
  has_one_attached :photo
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 24 }
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_stars
    array_stars = self.ratings
    unless array_stars.length > 0
      return " No stars for the moment"
    else
      sum = 0
      array_stars.each do |element|
        sum += element.stars
      end
      return (sum.to_f / array_stars.length.to_f).round(2)
    end
  end
end
