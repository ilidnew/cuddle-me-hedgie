class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :rating, presence: true, numericality: true
  # validates :rating, inclusion: { in: [1,2,3,4,5]}
  validates :rating, inclusion: { in: [1,2,3,4,5]}
  validates :content, presence: true
end
