Rails.application.routes.draw do

  namespace :admin do
    root controller: :dash, action: :index
  end

end
