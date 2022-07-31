Rails.application.routes.draw do
  root 'pages#index'
  pages = %w(about)
  pages.each do |page|
    get "#{page}", to: "pages##{page}"
  end
  resources :parts, only: [:edit, :update]
  resources :contact_forms, only: [:new, :create]  
  post 'tinymce_assets', to: 'tinymce_assets#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
