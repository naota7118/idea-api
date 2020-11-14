class Intermediate < ApplicationRecord
  belongs_to :idea
  belongs_to :category
  validates_uniqueness_of :idea_id, scope: :category_id
end