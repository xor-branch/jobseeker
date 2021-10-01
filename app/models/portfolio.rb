class Portfolio < ApplicationRecord
  belongs_to :profil

  validates :name, presence: true
  validates :description, presence: true
end
