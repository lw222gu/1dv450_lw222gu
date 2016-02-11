Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#index'
  # resources :users
  
  get 'users' => 'users#index', as: :users
  post 'users' => 'users#create'
  get 'new' => 'users#new', as: :new_user
  
  get 'clients' => 'clients#new', as: :new_client
  post 'clients' => 'clients#create'
  get 'delete_client' => 'clients#delete', as: :delete_client
  get 'apikeys' => 'apikeys#show', as: :apikey
  post 'login' => 'sessions#login', as: :login
  get 'logout' => 'sessions#logout', as: :logout
  
  get 'admin' => 'admins#show', as: :admin
  # get 'admin_delete_client' => 'clients#admin_delete', as: :admin_delete_client
  get 'revoke_client' => 'clients#revoke', as: :revoke_client
  get 'reactivate_client' => 'clients#reactivate', as: :reactivate_client
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
