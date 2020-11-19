class User < ApplicationRecord
  has_many :vans
  has_many :bookings
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  # validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  # validates :driving_licence_year, numericality: { only_integer: true }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :trackable

end
