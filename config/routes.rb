Rails.application.routes.draw do

root 'pages#home'

get '/pages/browse', to: 'pages#browse'

resources :users, only: [:new, :create] do
    put 'favorites', on: :member
    resources :favorites
end

# get '/favorites' => 'favorites#index'

resources :sessions, only: [:new, :create, :destroy]

resources :regions 

resources :genres

# resources :favorites, only: [:index, :destroy]
# get '/favorites' => 'favorites#index'

resources :songs do
    resources :favorites, shallow: true
end

get '/my_songs',  to: 'songs#my_songs', as: 'my_songs'

get '/login', to: 'sessions#new'

get '/logout', to: 'sessions#destroy'



end
