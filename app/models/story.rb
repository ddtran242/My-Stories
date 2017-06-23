class Story < ApplicationRecord
  has_many :comments
  has_many :votes
  has_many :reports
  has_many :steps, dependent: :destroy, inverse_of: :story
  accepts_nested_attributes_for :steps, reject_if: :all_blank,
    allow_destroy: true

  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
end
