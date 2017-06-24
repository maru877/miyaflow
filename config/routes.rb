Rails.application.routes.draw do
  resources :answers
  resources :questions do
    patch :resolution, on: :member
  end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root 'questions#index'
end
