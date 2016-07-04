class Answer < ActiveRecord::Base
  belongs_to :question
  validates :question, presence: :true
  validates :body, presence: :true
  belongs_to :user
  validates :user, presence: :true
end
