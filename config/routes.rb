Rails.application.routes.draw do
  resources :questions
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  # # root to: new_admin_session_path

  devise_scope :admin do
    authenticated :admin do
      root 'questions#index', as: :authenticated_root
      resources :questions
    end

    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
end
