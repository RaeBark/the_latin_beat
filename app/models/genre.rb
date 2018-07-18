class Genre < ApplicationRecord
    has_many :regions, through: :genre_regions
    has_many :songs, dependent: :destroy
end


