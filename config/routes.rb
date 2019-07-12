Rails.application.routes.draw do
  get 'albums/index'
  root "artists#index"

  resources :artists, only: :show
  resources :albums, only: %i(index show)
end
