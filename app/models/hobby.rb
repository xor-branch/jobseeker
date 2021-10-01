class Hobby < ApplicationRecord
  belongs_to :profil

  validates :name, presence: true
end
