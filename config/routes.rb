Rails.application.routes.draw do
  resources :answers
  resources :questions
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root 'questions#index'
end
