Rails.application.routes.draw do
  root 'language#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'users/show' => 'users#show', as: 'profile'

  get 'users/history' => 'users#history', as: 'history'
  # 退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  resources :languages, only: %i[index create show update destroy] do
    resources :records, only: %i[new create show update destroy], module: :languages
  end
end
