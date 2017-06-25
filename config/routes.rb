Rails.application.routes.draw do
  resources :answers do
    member do
      patch :'good', to: 'evaluations#good'
      patch :'bad', to: 'evaluations#bad'
      patch :'cancel', to: 'evaluations#cancel'
      get :'good_users', to: 'answers#good'
      get :'bad_users', to: 'answers#bad'
    end
  end
  resources :questions do
    patch :resolution, on: :member
  end
  resource :users, only: [:show]
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root 'questions#index'
end
