Rails.application.routes.draw do
  get 'homes/top'
  root to: "homes#top"
  # ユーザー用
# URL /users/sign_in ...
devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  
  scope module: :public do
   get '/users/unsubscribe' => 'users#unsubscribe'
   patch '/users/withdraw' => 'users#withdraw'
   patch '/user/edit' => 'users#update'
   get '/user/edit' => 'users#edit'
   get '/user' => 'users#show'
   resources :users do
    member do
     get :favorites
    end
   end
   resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
   
  end
  
end
