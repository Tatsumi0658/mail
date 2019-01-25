class Profile < ApplicationRecord
  validates :username, presence: true
  validates :image, presence: true 
  mount_uploader :image, ImageUploader
  belongs_to :users
  has_many :posts
end
