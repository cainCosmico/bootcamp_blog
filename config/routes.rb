Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "articles#index"
  
  # resources :follows
  devise_for :users
  
  resources :articles do 
    resources :comments
  end

  # get '/users/:id', to: 'user#show'
  resources :user

  post '/user/:id/follow', to: "user#follow", as: "follow_user"
  post '/user/:id/unfollow', to: "user#unfollow", as: "unfollow_user"

  get 'user/followers', to: 'user#followers'
  get 'user/following', to: 'user#following'
end
