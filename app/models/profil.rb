class Profil < ApplicationRecord
  belongs_to :account
  belongs_to :country
  belongs_to :state

  validates :name, presence: true
  validates :speciality, presence: true
  validates :bio, presence: true
  validates :telephone, presence: true
  validates :state_id, presence: true
  validates :country_id, presence: true

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end

  has_one :personal, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :academics, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_many :hobbies, dependent: :destroy
end
