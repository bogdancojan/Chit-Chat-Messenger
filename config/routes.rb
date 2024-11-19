Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    unauthenticated :user do
      root to: redirect('/users/sign_in')
    end
  end

  authenticated :user do
    root to: redirect('/conversations'), as: :authenticated_root
  end

  resources :conversations, only: [:index, :create, :show] do
    resources :messages
  end
end
