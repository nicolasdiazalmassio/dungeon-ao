Rails.application.routes.draw do
  devise_for :usuarios
  root 'pages#home'
end
