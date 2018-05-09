class Review < ApplicationRecord
  belongs_to :restaurant
  validates :restaurant_id, :content, :rating, presence: true
  validates :rating, inclusion: { in: (0..5).to_a }
  validates :rating, numericality: true
end
