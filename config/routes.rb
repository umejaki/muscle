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
    get 'user/post_images' => 'users#index'
    resources :users do
      member do
        get :favorites
      end
    end

    get "post_images/search_tag/:id" => "post_images#search_tag"

    resources :post_images, only: [:new, :index, :show, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
   
  end
  
  namespace :admin do
    get '/' => 'homes#top'
    resources :post_images , only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end 
    resources :users, only: [:index, :show, :edit, :destroy, :update] do
      get '/post_images' => 'users#post_image', as: 'post_images'
    end
  end
  
end
