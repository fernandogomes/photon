Photon::Application.routes.draw do
  devise_for :users

  resources :albums do
    collection do
      put :update_attribute_on_the_spot
    end
    resources :pictures do
      collection do
        put :update_attribute_on_the_spot
      end
    end
  end

  root :to => "albums#index"
end
