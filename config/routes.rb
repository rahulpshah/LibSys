Rails.application.routes.draw do
  

  resources :subscribers
  resources :suggestions
  resources :admins
  

  root "welcome#index"
  get    'signup'   => 'members#signup', as:'signup'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  get    'checkout/:id' => 'book_transactions#checkout' , as: "checkout"
  post   'checkout' => 'book_transactions#create1'
  
  get    'checkin/:id' => 'book_transactions#checkin' , as: "checkin"
  post   'checkin' => 'book_transactions#create2'
  
  get    'history/:id' => 'books#history' , as: "history"
  get    'member_history/:id' => 'members#member_history' , as: "member_history"
  
  get 'approve/:id' => 'suggestions#approve', as:'approve'
  post 'approve' => 'suggestions#create1'

  get 'notify/:id' => 'subscribers#notify' , as: 'notify'
  post 'notify' => 'subscribers#create'

  resources :books
  resources :members
  resources :book_transactions

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
