Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/lists/new', to: 'lists#new'
  # get '/lists/create', to: 'lists#create'
  root to: 'lists#index'
  resources :lists, only: [ :new, :create, :index, :show, :destroy ] do
    resources :bookmarks, only: [ :new, :create ]
  end
end
