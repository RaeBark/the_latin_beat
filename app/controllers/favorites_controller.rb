class FavoritesController < ApplicationController
    def index
        @favorite_songs = current_user.favorite_songs
    end

    def destroy
        # p '*' * 100
        # p params
        song = Song.find(params[:song_id])
        current_user.favorite_songs.delete(song)
        redirect_to user_favorites_path(current_user.id)
    end


end