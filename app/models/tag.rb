class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :photo_tags, dependent: :destroy
  has_many :photos, through: :photo_tags

  has_many :gallery_tags, dependent: :destroy
  has_many :galleries, through: :gallery_tags
end
