Rails.application.routes.draw do
  devise_for :users, module: 'users'
  get 'home/index'
  root to: 'home#index'
  get '*page' => 'pages#index'
end
