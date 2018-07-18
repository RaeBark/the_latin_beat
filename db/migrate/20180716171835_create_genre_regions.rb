class CreateGenreRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_regions do |t|
      t.references :genre, foreign_key: true
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
