Rails.application.routes.draw do

  root to: 'home#homepage'

  resources :compagnies
  resources :posts

  resources :profils
  resources :personals
  resources :skills
  resources :experiences
  resources :academics
  resources :portfolios
  resources :hobbies
  resources :applies, only: [:create, :destroy]

  devise_for :accounts, controllers: {
      'registrations': 'registrations',
      'sessions':      'sessions',
      'passwords':     'passwords'
  }


  get "browse/job", to: 'home#browse', as: "browse"
  get "approuval", to: 'home#approuval', as: "approuval"
  get "mails", to: 'home#mail', as: "mails"




  get 'pages/dashboard'
  get 'pages/icons'
  get 'pages/profile'
  get 'pages/tables'
  get 'pages/login'
  get 'pages/register'
  get 'pages/upgrade'


end
