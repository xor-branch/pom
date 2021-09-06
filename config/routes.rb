Rails.application.routes.draw do
  root "homes#index"

  #root "tasks#index"
  get 'sessions/new'
  resources :tasks
  resources :users
  resources :sources
  resources :sessions, only: [:new, :create, :destroy]
  get 'step/:id', to: "tasks#step", as: :step
  get 'mentor/:id', to: "users#mentor", as: :mentor
  get 'tasks/:id/sourcing', to:"sources#index", as: :sourcing
  post 'tasks/sourcing/:id', to:"tasks#source", as: :my_route
  delete 'tasks/sourcing/:id', to:"tasks#destroy_source", as: :my_route2
  #post "/tasks/:id/:ph_id" => "tasks#source", as: :my_route, id: /\d{7}/, ph_id: /\d{7}/
end
