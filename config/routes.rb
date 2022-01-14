Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i(show) do
        resource :plans, only: %i(show create update)
      end
    end
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }
  end
end
