class Category < ApplicationRecord
  has_many :idea
  has_many :idea_category
end