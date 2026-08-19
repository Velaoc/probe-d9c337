class Message < ApplicationRecord
  validates :body, presence: true, length: { maximum: 500 }
  validates :author_name, length: { maximum: 60 }, allow_blank: true

  scope :wall, -> { order(created_at: :desc).limit(100) }
end
