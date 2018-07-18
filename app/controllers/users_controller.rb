class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          flash[:notice] = "You have successfully signed up!"
          redirect_to pages_browse_path
        else
          render :new
        end
    end

    def favorites
      song = Song.find(params[:song_id]) 
      current_user.favorite_songs << song
      redirect_to songs_path(region_id: params[:region_id], genre_id: params[:genre_id])
      # p '#' * 100
      # p params
      # p '#' * 100
    end
    
    private
    
        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

end 