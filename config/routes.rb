Rails.application.routes.draw do


  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  
  resources :users, only: [:index, :show, :edit, :update] do
# ——————————————— ここから ———————————————
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
# ——————————— ここまでネストさせる ———————————
end
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end