class State < ApplicationRecord
  belongs_to :country
  has_many :compagnies
  has_many :posts
  has_many :profils
end
