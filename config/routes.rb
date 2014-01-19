VimWeekly::Application.routes.draw do
  root to: "articles#index"
  get "about", to: "articles#about"
  get "articles/issues"
end
