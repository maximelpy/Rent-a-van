class User < ApplicationRecord
  has_many :ratings
  has_many :vans
  has_many :bookings
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :age, inclusion: { greater_than_or_equal_to: 18 }, numericality: { only_integer: true }
  validates :driving_licence_year, inclusion: { less_than_or_equal_to: 2004 }, numericality: { only_integer: true }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :trackable

end
