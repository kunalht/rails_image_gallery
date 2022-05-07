class Gallery < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :photos, inverse_of: :gallery
  has_many :gallery_tags, dependent: :destroy
  has_many :galleries, through: :gallery_tags
  accepts_nested_attributes_for :photos

end
