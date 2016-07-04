class Subject < ActiveRecord::Base
  serialize :name
  has_many :questions, dependent: :destroy
  validates :name, presence: :true
  belongs_to :user
  validates :user, presence: :true
end
