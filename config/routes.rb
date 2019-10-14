Rails.application.routes.draw do
  get 'scan_lists/search'
  get 'scan_lists/find'
  resources :scan_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'scan_lists#search'
end
