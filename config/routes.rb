Rails.application.routes.draw do
  # get 'customers/index'
  # get 'customers/show'
  get "customers",     to: "customers#index", as: "customers" # customers_path
  get "customers/:id", to: "customers#show",  as: "customer"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
