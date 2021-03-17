Rails.application.routes.draw do
  devise_for :usuarios
  root 'pages#home'
  resources :personajes
  get "etapa1", to: "campanias#etapa1"
  get "etapa2", to: "campanias#etapa2"
  get "etapa3", to: "campanias#etapa3"
  get "combate", to: "personajes#combate"
  get "crear_obj", to: "inventarios#create"
  post "crear_obj", to: "inventarios#create"
  post "personajes/ataque"
  delete "inventarios/usar"
end
