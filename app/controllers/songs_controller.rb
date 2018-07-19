class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]
    before_action :authorize

    def index

        @songs = Song.all 
        @header = ''

        if params[:sort_by]
            p '#' * 100
            if params[:sort_by] == 'Artist'
                @songs = @songs.order('artist ASC')
            elsif params[:sort_by] == 'Title'
                @songs = @songs.order('title ASC')
            elsif params[:sort_by] == 'Album'
                @songs = @songs.order('album ASC')
            end
        end 

        if !params[:region_id].blank? && !params[:genre_id].blank?
            p '!' * 100
            @songs = @songs.where(region_id: params[:region_id], genre_id: params[:genre_id])
            @heading = ' ~ ' + Region.find(params[:region_id]).name + ' ~  &  ~ ' + Genre.find(params[:genre_id]).name + ' ~ ' 
            @list_countries = Region.find(params[:region_id]).countries 
        end 

        if !params[:region_id].blank? && params[:genre_id].blank?
            p '@' * 100
            @songs = @songs.where(region_id: params[:region_id])
            @heading = ' ~ ' + Region.find(params[:region_id]).name + ' ~ ' 
            @list_countries = Region.find(params[:region_id]).countries
        end

        if !params[:genre_id].blank? && params[:region_id].blank?
            p '$' * 100
            @songs = @songs.where(genre_id: params[:genre_id])
            @heading = ' ~ ' + Genre.find(params[:genre_id]).name + ' ~ '
        end

        if params[:genre_id].blank? && params[:region_id].blank?
            p '%' * 100
            @songs = @songs
        end

        if !params[:region_id].blank? && !params[:genre_id].blank? && !params[:sort_by].blank?
            p '*' * 100
            _attr = params[:sort_by].downcase
            @songs = @songs.where(region_id: params[:region_id], genre_id: params[:genre_id]).order("#{_attr} ASC")
        end

        if params[:sort_by].blank? && params[:genre_id].blank? && params[:region_id].blank?
            p '&' * 100
            @songs = @songs
        end


        # if !params[:genre_id] && !params[:region_id] && !params[:sort_by]
        #     @songs = Song.all
        #     # return
        # end 


        # if (params[:region_id] != "" && params[:genre_id] != "")
        #     @songs = Song.where(region_id: params[:region_id], genre_id: params[:genre_id]) #&& (genre_id: params[:genre_id])
        #     @heading = ' ~ ' + Region.find(params[:region_id]).name + ' ~  &  ~ ' + Genre.find(params[:genre_id]).name + ' ~ ' 
        #     @list_countries = Region.find(params[:region_id]).countries
        # elsif params[:region_id] != "" 
        #     @songs = Song.where(region_id: params[:region_id])
        #     @heading = ' ~ ' + Region.find(params[:region_id]).name + ' ~ ' 
        #     @list_countries = Region.find(params[:region_id]).countries
        # elsif params[:genre_id] != "" 
        #     @songs = Song.where(genre_id: params[:genre_id])
        #     @heading = ' ~ ' + Genre.find(params[:genre_id]).name + ' ~ '
        # elsif !params[:genre_id] && !params[:region_id]
        #     @songs = Song.all
        # elsif !params[:genre_id] && !params[:region_id] 
        #     @songs = Song.all
        #     # return 
        # elsif params[:sort_by] 
        #     @heading = ''
        # else
        #     @songs = Song.all
        # end

        # if params[:sort_by] 
        #     if params[:sort_by] == 'Artist'
        #         p '#' * 100
        #         @songs = @songs.order('artist ASC')
        #     elsif params[:sort_by] == 'Title'
        #         @songs = @songs.order('title ASC')
        #     elsif params[:sort_by] == 'Album'
        #         @songs = @songs.order('album ASC')
        #     end
        # end


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
        params.require(:song).permit(:title, :artist, :album, :genre_id, :region_id, :album_cover, :sort_by)
    end
end