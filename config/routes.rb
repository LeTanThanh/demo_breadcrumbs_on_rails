Rails.application.routes.draw do
  root "artists#index"

  resources :artists, only: :show
  resources :albums, only: %i(index show)
  resources :songs, only: %i(index show)
end
