Rails.application.routes.draw do
  root 'language#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show] do
    member do
      get 'unsubscribe'
      patch 'withdrawal'
    end
    collection do
      get 'history'
      get 'statistic'
    end
  end

  resources :languages, only: %i[index create show update destroy] do
    resources :records, only: %i[new create show update destroy], module: :languages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
