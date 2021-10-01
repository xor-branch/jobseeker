class Post < ApplicationRecord
  belongs_to :account
  belongs_to :state
  has_many :applies, dependent: :destroy
  has_many :apply_accounts, through: :applies, source: :account

  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :jobtype, presence: true
  validates :deadline, presence: true
  validates :min_salary, presence: true
  validates :frequence, presence: true
  validates :state_id, presence: true
  validates :terms_use, presence: true


  def jobType
    case self.jobtype
    when 1
      return "Full-time"
    when 2
      return "Part-time"
    when 3
      return "Remote"
    when 4
      return "Intership"
    when 5
      return "Freelance"
    else
      return "Contract"
    end
  end

  def jobFrequence
    case self.frequence
    when 1
      return "Per month"
    when 2
      return "Per week"
    when 3
      return "Per bi-week"
    when 4
      return "Per day"
    else 5
      return "Per hours"
    end
  end

end
