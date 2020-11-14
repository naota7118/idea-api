class AddColumnCategoryIds < ActiveRecord::Migration[6.0]
  def change
    add_reference :ideas, :category, null: false, foreign_key: true
  end
end