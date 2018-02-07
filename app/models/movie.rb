class Movie < ApplicationRecord
  has_many :castings
  has_many :actors, through: :castings
end
