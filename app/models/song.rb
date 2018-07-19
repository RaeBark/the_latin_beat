class Song < ApplicationRecord
  belongs_to :user
  belongs_to :region
  belongs_to :genre
  has_many :favorites
  has_one_attached :album_cover
end
