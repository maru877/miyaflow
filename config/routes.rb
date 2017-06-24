Rails.application.routes.draw do
  resources :questions
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root 'pages#index'
end
