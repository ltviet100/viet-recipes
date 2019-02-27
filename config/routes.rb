Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home', to: 'pages#home'
  resources :recipes
  resources :chefs, except: [:new]
  get 'signup', to:'chefs#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
