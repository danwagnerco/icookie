Icookie::Application.routes.draw do
  root "static_pages#home"
  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/contact"
  resources :users
  resources :locations
end
