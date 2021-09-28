Rails.application.routes.draw do
  root to: 'home#homepage'

  resources :compagnies
  #resources :jobs
  devise_for :accounts, controllers: {
      'registrations': 'registrations',
      'sessions':      'sessions',
      'passwords':     'passwords'
  }

  get "jobs", to: 'home#jobs', as: "jobs"
  get "approuval", to: 'home#approuval', as: "approuval"
  get "mails", to: 'home#mail', as: "mails"
  get "post/jobs", to: 'home#create_job', as: "create_job"
  get "show/job", to: 'home#show_job', as: "show_job"
  get "browse/job", to: 'home#browse', as: "browse"




  get 'pages/dashboard'
  get 'pages/icons'
  get 'pages/profile'
  get 'pages/tables'
  get 'pages/login'
  get 'pages/register'
  get 'pages/upgrade'


end
