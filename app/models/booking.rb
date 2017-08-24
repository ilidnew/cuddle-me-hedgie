class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hedgie
  has_many :reviews

  validates :user_id, presence: true
  validates :hedgie_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
