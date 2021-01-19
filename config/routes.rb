Rails.application.routes.draw do
  namespace :api do
    post '/login', to: 'users#login'

    resources :house_types, only: [:index]
    resources :favourites, only: [:index]
    resources :houses, only: [:index, :show] do
      post 'favourite', to: 'houses#favourite'
      post 'unfavourite', to: 'houses#unfavourite'
    end
  end

  root 'static#index'
  get '*path', to: 'static#index'
end
