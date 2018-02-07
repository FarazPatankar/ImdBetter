class Actor < ApplicationRecord
  enum gender: [:male, :female]
  has_many :castings
  has_many :movies, through: :castings

  validates :name, presence: true
  validates :gender, presence: true
end
