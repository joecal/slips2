class Question < ActiveRecord::Base
  serialize :question_text
  belongs_to :subject
  has_many :answers, dependent: :destroy
  validates :question_text, presence: :true
  belongs_to :user
  validates :user, presence: :true

end
