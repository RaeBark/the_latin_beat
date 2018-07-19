class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
        if !params[:genre_id] && !params[:region_id]
            @songs = Song.all
            return
        end 


        if (params[:region_id] != "" && params[:genre_id] != "")
            @songs = Song.where(region_id: params[:region_id], genre_id: params[:genre_id]) #&& (genre_id: params[:genre_id])
        elsif params[:region_id] != ""
            @songs = Song.where(region_id: params[:region_id])
        elsif params[:genre_id] != "" 
            @songs = Song.where(genre_id: params[:genre_id])
        elsif !params[:genre_id] && !params[:region_id]
            p '$' * 100
            @songs = Song.all
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

        if params[:song][:album_cover]
            @song.album_cover.attach(params[:song][:album_cover])
        end

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
        puts @song
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            redirect_to @song, notice: 'Song updated, ¡Felicidades!'
        else 
            render :edit
        end
    end

    def show
        @song = Song.find(params[:id])
    end

    def destroy
    end

    private
    def set_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :artist, :album, :genre_id, :region_id, :album_cover)
    end
end