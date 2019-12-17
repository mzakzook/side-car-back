Rails.application.routes.draw do
  root 'home#index'
  resources :menu_items
  resources :events
  resources :providers
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  
 
end

