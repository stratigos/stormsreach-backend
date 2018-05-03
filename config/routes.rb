Rails.application.routes.draw do

  namespace :admin do

    resources :avatars do
      resources :vendors, only: [:new, :create, :edit, :update, :show]
    end

    resources :vendors, only: [:index, :destroy]

    root controller: :dash, action: :index
  end

  scope module: :api do
    namespace :v1 do
      resources :avatars, only: [:index]
    end
  end

end
