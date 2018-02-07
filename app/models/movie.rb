class Movie < ApplicationRecord
  has_many :castings
  has_many :actors, through: :castings

  validates :title, presence: true, length: { maximum: 100 }
  validates :synopsis, presence: true, length: { maximum: 1000 }
end
