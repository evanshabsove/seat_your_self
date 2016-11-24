class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :url, presence: true

end
