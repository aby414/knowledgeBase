Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #  Creating a route to the index page
  root 'articles#index', as: 'home'

  resources :articles
  resources :questions
end
