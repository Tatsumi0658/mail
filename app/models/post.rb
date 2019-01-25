class Post < ApplicationRecord
  validates :content, presence:true
  validates :image, presence:true
  mount_uploader :image, ImageUploader
  belongs_to :profile, optional:true
end
