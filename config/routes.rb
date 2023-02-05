Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          get :login
        end
      end
      resource :session, only: [:create, :destory]
    end
  end
end