class Rating < ApplicationRecord
  belongs_to :user
  validates :stars, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end
