class Idea < ApplicationRecord
  belongs_to :category
  has_many :idea_category
  validates :body, presence: true
end