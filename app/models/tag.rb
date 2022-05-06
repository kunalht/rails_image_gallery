class Tag < ApplicationRecord
  belongs_to :gallery, optional: true
  belongs_to :photo, optional: true
end
