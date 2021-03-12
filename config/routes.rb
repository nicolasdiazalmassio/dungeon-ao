Rails.application.routes.draw do
  devise_for :usuarios
  root 'pages#home'
  resources :personajes
  get "etapa1", to: "campanias#etapa1"
  get "etapa2", to: "campanias#etapa2"
end
