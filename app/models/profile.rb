class Profile < ApplicationRecord
  validates :username, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  has_many :posts
end
