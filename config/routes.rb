Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :mobfriends do
    resources :jobs, only: :create
  end

  resources :jobs, only: :destroy

  resources :events, except: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
