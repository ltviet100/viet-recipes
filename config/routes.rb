Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home', to: 'pages#home'
  resources :recipes
  resources :chefs, except: [:new]
  get 'signup', to:'chefs#new'
end
