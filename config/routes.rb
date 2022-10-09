Rails.application.routes.draw do
  root "learning_records#index"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  get "users/show" => "users#show", as: "profile"
  #退会確認画面
  get "/users/:id/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
  #論理削除のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  
  resources :learning_records, only: %i[index create show update destroy]
end
