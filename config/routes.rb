Icookie::Application.routes.draw do
  root "static_pages#home"
  resources :users
  get "signup" => "users#new"
  resources :locations

  # create friendlier URLs, like
  # "icookie.com/about" rather than "icookie.com/static_pages/about"
  StaticPagesController.action_methods.each do |action|
    get "/#{action}", :to => "static_pages##{action}", :as => "#{action}"
  end

end
