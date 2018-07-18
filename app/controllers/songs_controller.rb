class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
        if params[:region_id] != ""
            @songs = Song.where(region_id: params[:region_id])
        elsif params[:genre_id] != ""
            @songs = Song.where(genre_id: params[:genre_id])
        else
            @songs = Song.all
        end
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        @song.user_id = current_user.id
        if @song.save
            redirect_to songs_path, notice: 'You added a new song! ¡Gracias!'
        else 
            render new, notice: 'Uh oh, something went wrong! Try again!'
        end
    end

    def my_songs
        @songs = current_user.songs
    end 

    def edit

    end

    def destroy
    end

    private
    def set_song
        @song = Song.find(params[:id])
      end

    def song_params
        params.require(:song).permit(:title, :artist, :album, :genre_id, :region_id)
    end
end