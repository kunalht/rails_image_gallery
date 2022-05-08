class Photo < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true, uniqueness: true
  belongs_to :gallery
  has_many :comments, inverse_of: :photo, dependent: :destroy
  has_many :photo_tags, dependent: :destroy
  has_many :photos, through: :photo_tags, dependent: :destroy
  accepts_nested_attributes_for :comments

  # def image_on_disk
  #   ActiveStorage::Blob.service.path_for(image.key)
  # end
  # validates :photo_path,
  #           content_type: { in: /\Aimage\/.*\z/, message: 'must be an image' },
  #           size: { less_than: 4.megabytes , message: 'must be less than 4 MB' }
end
