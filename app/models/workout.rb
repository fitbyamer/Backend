class Workout < ApplicationRecord

  mount_uploader :media, MediaUploader

  validates :title, :media, :category, presence: true
  integerize :content_type, :image, :video
end
