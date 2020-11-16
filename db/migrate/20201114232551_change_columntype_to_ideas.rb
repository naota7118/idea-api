class ChangeColumntypeToIdeas < ActiveRecord::Migration[6.0]
  def change
    change_column :ideas, :body, :text
  end
end
