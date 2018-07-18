Rails.application.routes.draw do

root 'pages#home'

get '/pages/browse', to: 'pages#browse'

resources :users, only: [:new, :create]

resources :sessions, only: [:new, :create, :destroy]

resources :regions 

resources :genres

resources :songs do
    resources :favorites, shallow: true
end

get '/login', to: 'sessions#new'

get '/logout', to: 'sessions#destroy'

end
