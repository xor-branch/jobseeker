class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :compagny, dependent: :destroy
  has_one :profil, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :applies, dependent: :destroy
end
