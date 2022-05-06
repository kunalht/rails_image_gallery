class Comment < ApplicationRecord
  belongs_to :photo
  validates :username, presence: true
  validates :comment, presence: true
end
