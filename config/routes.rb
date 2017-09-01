Rails.application.routes.draw do
  resources :email_notes
  resources :emails do
  	resources :email_notes
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :leads
	get 'show_leads', to: 'leads#show_leads', as: 'show_leads'
	
  put 'update_manager', to: 'users#update_manager', as: 'update_manager'

end
