VimWeekly::Application.routes.draw do
  root to: "articles#index"
  get "articles/index"
  get "articles/about"
  get "articles/issues"
end
