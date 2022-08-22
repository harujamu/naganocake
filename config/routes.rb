Rails.application.routes.draw do

  # 顧客用画面（トップページ）
  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"

  # 顧客用画面（ログイン、新規登録）
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 顧客用画面（Itemsコントローラ）
  get "/items" => "public/items#index"
  get "/items/:id" => "public/items#show", as: "show_items"
  # 顧客用画面（ジャンル検索）
  get "/genre/items/:id" => "public/items#genre", as: "by_genre_items"

  # 顧客用画面（Customersコントローラ)
  get "/customers/my_page" => "public/customers#show"
  get "/customers/information/edit" => "public/customers#edit"
  patch "/end_users/information" => "public/customers#update"
  get "/customers/unsubscribe" => "public/customers#unsubscribe"
  patch "/customers/unsubscribe" => "public/customers#update_unsubscribe", as: "update_unsubscribe"

  # 顧客用画面（Cart_itemsコントローラ）
  get "/cart_items" => "public/cart_items#index"
  patch "/cart_items/:id" => "public/cart_items#update", as: "update_cart_items"
  delete "/cart_items/destroy_all" => "public/cart_items#destroy_all", as: "destroy_all_cart_items"
  delete "/cart_items/:id" => "public/cart_items#destroy", as: "destory_cart_items"
  post "/cart_items" => "public/cart_items#create", as: "add_cart_items"

  # 顧客用画面（Ordersスコントローラ）
  get "/orders/new" => "public/orders#new"
  post "/orders/confirm" => "public/orders#confirm"
  get "/orders/complete" => "public/orders#complete"
  post "/orders" => "public/orders#create"
  get "/orders" => "public/orders#index", as: "orders_index"
  get "/orders/:id" => "public/orders#show", as: "show_orders"

  # 顧客用画面（Addressesコントローラ）
  get "/addresses" => "public/addresses#index"
  get "/addresses/:id/edit" => "public/addresses#edit", as: "edit_addresses"
  post "/addresses" => "public/addresses#create", as: "add_addresses"
  patch "/addresses/:id" => "public/addresses#update", as: "update_addresses"
  delete "/addresses/:id" => "public/addresses#destroy", as: "destroy_addresses"


  # 管理者用画面（トップページ）
  get "/admin" => "admin/homes#top"

  # 管理者用画面（ログイン）
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 管理者用画面（Itemsコントローラ）
  get "/admin/items" => "admin/items#index"
  get "/admin/items/new" => "admin/items#new"
  post "/admin/items" => "admin/items#create", as: "admin_add_items"
  get "/admin/items/:id" => "admin/items#show", as: "admin_show_items"
  get "/admin/items/:id/edit" => "admin/items#edit", as: "admin_edit_items"
  patch "/admin/items/:id" => "admin/items#update", as: "admin_update_items"

  # 管理者用画面（Genresコントローラ）
  get "/admin/genres" => "admin/genres#index"
  post "/admin/genres" => "admin/genres#create", as: "admin_create_genres"
  get "/admin/genres/:id/edit" => "admin/genres#edit", as: "admin_edit_genres"
  patch "/admin/genres/:id" => "admin/genres#update", as: "admin_update_genres"

  # 管理者用画面（Customersコントローラ）
  get "/admin/customers" => "admin/customers#index"
  get "/admin/customers/:id" => "admin/customers#show", as: "admin_show_customers"
  get "/admin/customers/:id/edit" => "admin/customers#edit", as: "admin_edit_customers"
  patch "/admin/customers/:id" => "admin/customers#update", as: "admin_update_customers"

  # 管理者用画面（Ordersコントローラ）
  get "/admin/orders/:id" => "admin/orders#show", as: "admin_show_orders"
  patch "/admin/orders/:id" => "admin/orders#update", as: "admin_update_orders"
  # 顧客別注文一覧
  get "/admin/by_customer_orders/:id" => "admin/orders#index", as: "admin_by_customer_orders"

  # 管理者用画面（Order_detailsコントローラ）
  patch "/admin/order_details/:id" => "admin/order_details#update", as: "admin_update_order_details"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
