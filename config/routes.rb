Rails.application.routes.draw do

  get 'friends/index'

  devise_for :users

  authenticated :user do
    root 'users#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations do
    resources :messages
  end

  get "/friends/index/addfriend" => "friends#addfriend"
  get "/friends/index/deletefriend" => "friends#deletefriend"
  get "/friends/search"


end
