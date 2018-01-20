Rails.application.routes.draw do

  resources :values
  resources :themes
  resources :images
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root 'main#index'
  #root 'work#index'

  match 'index',    to: 'main#index',           via: 'get'
  match 'about',    to: 'main#about',           via: 'get'
  match 'help',     to: 'main#help',            via: 'get'
  match 'contacts', to: 'main#contacts',        via: 'get'

  match 'results_list',     to: 'work#results_list', via: :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'work',             to: 'work#index',             via: 'get'
  match 'choose_image',     to: 'work#choose_image',      via: :get
  match 'choose_theme',     to: 'work#choose_theme',      via: :get
  match 'display_theme',    to: 'work#display_theme',     via: :post

  match 'signup',   to: 'users#new',            via: 'get'
  match 'signin',   to: 'sessions#new',         via: 'get'
  match 'signout',  to: 'sessions#destroy',     via: 'delete'

  # Api definition
  namespace :api, defaults: { format: :json } do
    # We are going to list our resources here
    #   resources :users

    match 'next_image',       to: 'api#next_image',   via: 'get'
    match 'prev_image',       to: 'api#prev_image',   via: 'get'
    match 'save_value',       to: 'api#save_value',   via: :get

  end

end