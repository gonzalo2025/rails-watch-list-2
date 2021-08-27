Rails.application.routes.draw do
  resources :lists, except: [:edit, :update] do
  resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
end
