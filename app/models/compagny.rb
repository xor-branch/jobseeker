class Compagny < ApplicationRecord
  belongs_to :account
  validates :name, presence: true
  validates :description, presence: true
  validates :country_id, presence: true

  belongs_to :country
  belongs_to :state

  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end

end
