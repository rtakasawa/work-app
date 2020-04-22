class User < ApplicationRecord
  has_secure_password
  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :blog
end
