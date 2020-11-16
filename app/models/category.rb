class Category < ApplicationRecord
  has_many :ideas
  has_many :idea_category
end