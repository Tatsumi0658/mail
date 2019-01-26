class Post < ApplicationRecord
  validates :content, presence:true
  validates :image, presence:true
  mount_uploader :image, ImageUploader
  belongs_to :profile, optional:true
  has_many :favorites, dependent: :destroy
  has_many :favorite_profiles, through: :favorites, source: :profile 
end
