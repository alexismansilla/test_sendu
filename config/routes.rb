Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shipments, only: [:index, :create] do
        collection do
          get :pending
        end
      end
    end
  end

  namespace :web do
    get 'shipments/search', to: 'shipments#search'
  end
end
