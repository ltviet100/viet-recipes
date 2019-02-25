class ChangeColumnInRecipes < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :desciption, :description
  end
end
