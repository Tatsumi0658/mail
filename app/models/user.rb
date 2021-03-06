class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format:{ with: /\A[\w\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length:{ minimum:8 }
  has_one :profile, dependent: :destroy
end
