class Actor < ApplicationRecord
  enum gender: [:male, :female]
  has_many :castings
  has_many :movies, through: :castings
end
