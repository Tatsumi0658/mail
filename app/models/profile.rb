class Profile < ApplicationRecord
  validates :username, presence: true
  mount_uploader :image, ImageUploader
  has_many :posts, dependent: :destroy
end
