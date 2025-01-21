class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # A user has many articles
  has_many :articles, dependent: :destroy
end
