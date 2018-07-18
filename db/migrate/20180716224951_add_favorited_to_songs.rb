class AddFavoritedToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :favorited, :boolean
  end
end
