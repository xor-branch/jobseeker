class Academic < ApplicationRecord
  belongs_to :profil

  validates :name, presence: true
  validates :description, presence: true
  validates :obtention_year, presence: true
  validates :school, presence: true
end
