Rails.application.routes.draw do
  
  # 顧客用画面（トップページ）
  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"
  
  # 顧客用画面（Itemsコントローラ）
  get "/items" => "public/items#index"
  get "/items/:id" => "public/items#show"

  # 顧客用画面（Customersコントローラ)
  get "customers/my_page" => "public/customers#show"
  get "customers/information/edit" => "public/customers#edit"
  patch "/end_users/information" => "public/customers#update"
  get "customers/unsubscribe" => "public/customers#unsubscribe"
  patch "customers/unsubscribe" => "public/customers#update_unsubscribe"

  # 顧客用画面（Cart_itemsコントローラ）
  get "/cart_items" => "public/cart_items#index"
  patch "cart_items/:id" => "public/cart_items#update"
  delete "cart_items/:id" => "public/cart_items#destroy"
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all"
  post "cart_items" => "public/cart_items#create"

  # 顧客用画面（Ordersスコントローラ）
  get "orders/new" => "public/orders#new"
  post "orders/confirm" => "public/orders#confirm"
  get "orders/complete" => "public/orders#complete"
  post "/orders" => "public/orders#create"
  get "/orders" => "public/orders#index"
  get "/orders/:id" => "public/orders#show"
  
  # 顧客用画面（Addressesコントローラ）
  get "/addresses" => "public/addresses#index"
  get "/addresses/:id/edit" => "public/addresses#edit"
  post "/addresses" => "public/addresses#create"
  patch "/addresses/:id" => "public/addresses#update"
  delete "/addresses/:id" => "public/addresses#destroy"
  
  # 顧客用画面（ログイン、新規登録）
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  
  # 管理者用画面（ログイン）
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  } 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
