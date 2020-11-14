class RenameNameColumnToIdeas < ActiveRecord::Migration[6.0]
  def change
    rename_column :ideas, :name, :body
  end
end
