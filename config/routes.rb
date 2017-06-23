Rails.application.routes.draw do
  get "pages/:page", to: "pages#show", as: "page"
  root "pages#show", page: "home"

  resources :stories, only: [:new, :create, :edit, :update]
end
