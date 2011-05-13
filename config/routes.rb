Photon::Application.routes.draw do
  devise_for :users

  #resources :users
  resources :albums do
    resources :pictures
  end

  root :to => "albums#index"
end
