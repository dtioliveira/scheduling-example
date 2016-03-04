Rails.application.routes.draw do
  match '/', to: 'pages#index', via: [:get, :post]
  
  root 'pages#index'
end
