Rails.application.routes.draw do
  # get 'events/show'
  # get 'events/new'
  # get 'events/create'
  # get 'events/edit'
  # get 'events/update'
  # get 'events/destroy'
  devise_for :users

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  root to: 'pages#home'

  resources :jobs, only: :destroy

  resources :mobfriends do
    resources :jobs, only: :create
    get 'your-events', to: 'pages#your_events', as: 'your_events'
  end


  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
