Rails.application.routes.draw do
  root "tasks#index"
  get 'sessions/new'
  resources :tasks
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'step/:id', to: "tasks#step", as: :step
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
