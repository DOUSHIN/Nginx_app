Rails.application.routes.draw do
  root 'blogs#new'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
