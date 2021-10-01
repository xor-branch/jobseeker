class Personal < ApplicationRecord
  belongs_to :profil

  validates :gender, presence: true
  validates :children, presence: true
  validates :marital_statut, presence: true
  validates :language, presence: true
  validates :birth_day, presence: true


  def genderType
    case self.gender
    when 1
      return "Male"
    when 2
      return "Female"
    else
      return "other"
    end
  end

  def marital
    case self.marital_statut
    when 1
      return "Single"
    else
      return "Married"
    end
  end
end
