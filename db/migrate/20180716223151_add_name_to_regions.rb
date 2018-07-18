class AddNameToRegions < ActiveRecord::Migration[5.2]
  def change
    add_column :regions, :name, :string
  end
end
