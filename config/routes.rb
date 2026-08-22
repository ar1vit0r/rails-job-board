Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  resources :companies, only: %i[index show]
  resources :jobs, only: %i[index show] do
    resources :job_applications, only: %i[create]
  end

  namespace :admin do
    get "dashboard", to: "dashboard#index"
    resources :companies
    resources :jobs
  end
end
