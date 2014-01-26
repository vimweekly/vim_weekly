VimWeekly::Application.routes.draw do
  
  resources :admin
  resources :issues
  resources :sessions, only: [:new, :create, :destroy]

  root to: "issues#home"

  get "about", to: "issues#about"
  get "new_entry", to: "issues#new_entry"

  get "tawtaw", to: "sessions#new"
  get "signout", to: "sessions#destroy"

end
