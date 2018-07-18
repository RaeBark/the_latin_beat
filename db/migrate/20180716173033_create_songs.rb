class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.references :user, foreign_key: true
      t.references :region, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
