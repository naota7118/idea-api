class CreateIdeaCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :idea_categories do |t|
      t.references :idea, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
