Rails.application.routes.draw do
  root 'home#index'
  resources :menu_items
  resources :events
  resources :providers
  get '/find_user', to: 'find_user#index'
  get '/random_provider', to: 'providers#show'
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  
 
end

