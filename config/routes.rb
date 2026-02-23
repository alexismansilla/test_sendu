Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shipments, only: [:create, :index]
      get "/shipments/pending", to: "shipments#pending"
    end
  end
end
