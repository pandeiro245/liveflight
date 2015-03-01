Rails.application.routes.draw do
  resources :places

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :welcome
  root 'welcome#index'
end
