class Subject < ActiveRecord::Base
  # serialize :name
  has_many :questions, dependent: :destroy
  validates :name, presence: :true
  has_many :answers, through: :questions
  belongs_to :user
end
