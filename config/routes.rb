Rails.application.routes.draw do
  #get 'prototypes/index'

  #devise 未導入のため、コメントアウトとする
  #devise_for :users
  root to: 'prototypes#index'
  
end