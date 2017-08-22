class Hedgie < ApplicationRecord
  belongs_to :user
  has_attachments :photos, maximum: 5
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
