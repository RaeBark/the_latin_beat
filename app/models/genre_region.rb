class GenreRegion < ApplicationRecord
  belongs_to :genre
  belongs_to :region
end
