Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # userに関するページのルーティング
  get '/signup', to: 'users#new'
  resources :users
  
  # 紹介ページへのルーティング（静的ページ）
  get '/home', to: 'profile_pages#home'
  get '/about', to: 'profile_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'profile_pages#home'
end
