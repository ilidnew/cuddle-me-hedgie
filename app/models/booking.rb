class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hedgie
  has_many :reviews
  # validates :status, inclusion: { in: %w(pending accpeted declined)}
  validates :user_id, presence: true
  validates :hedgie_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
