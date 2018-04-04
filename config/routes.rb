Rails.application.routes.draw do

  namespace :admin do

    resources :avatars

    root controller: :dash, action: :index
  end

end
