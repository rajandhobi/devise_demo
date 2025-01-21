class Article < ApplicationRecord
  belongs_to :user

  # Validations
  validates :title, presence: true
  validates :body, presence: true
end
