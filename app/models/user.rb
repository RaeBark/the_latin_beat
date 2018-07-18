class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true

    has_many :songs
    has_many :favorites
    has_many :favorite_songs, through: :favorites, source: :song
end
