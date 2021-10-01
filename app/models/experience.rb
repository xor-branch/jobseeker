class Experience < ApplicationRecord
  belongs_to :profil

  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true
end
