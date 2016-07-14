class Answer < ActiveRecord::Base
  belongs_to :question
  # AM: +1 validations. I would organize so that associations and validations are grouped into their own section. Helps readability.
  validates :question, presence: :true
  validates :body, presence: :true
  belongs_to :user
  validates :user, presence: :true
  belongs_to :subjects
end
