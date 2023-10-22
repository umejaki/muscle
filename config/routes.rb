Rails.application.routes.draw do
  get 'homes/top'
  root to: "homes#top"
  # ユーザー用
# URL /customers/sign_in ...
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
  
  scope module: :public do
   get '/users/unsubscribe' => 'users#unsubscribe'
   patch '/users/withdraw' => 'users#withdraw'
   patch '/user/edit' => 'users#update'
   get '/user/edit' => 'users#edit'
   get '/user' => 'users#show'
   resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
   
  end
  
end
