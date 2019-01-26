class Profile < ApplicationRecord
  validates :username, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
