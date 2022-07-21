Rails.application.routes.draw do
  
  # 顧客用画面（トップページ）
  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"
  
  # 顧客用画面（Itemsコントローラ）
  get "/items" => "public/items#index"
  get "/items/:id" => "public/items#show"

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
