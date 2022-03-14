class Book < ApplicationRecord
  has_one_attached

  validates :title, presence: true
  validates :body, presence: true
end
