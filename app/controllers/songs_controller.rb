class SongsController < ApplicationController
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
        if params[:region_id] 
            @songs = Song.where(region_id: params[:region_id])
        else params[:genre_id]
            @songs = Song.where(genre_id: params[:genre_id])
        end
    end

    def create
    end

    def destroy
    end
end