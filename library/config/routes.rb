Library::Application.routes.draw do

get 'users' => 'users#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'search' => "searches#search", as: 'search'


  get "admin/index"
  get "sessions/create"
  get "sessions/destroy"
  resources :users

 get '/reservations/overdue' => "reservations#overdue", as: 'overdue_reservations'
 resources :reservations

 # get '/reservations/overdue' => "reservations#overdue", as: 'overdue_reservations'
 # controller :overdue do
 #   get 'reservations' => :overdue
 # end



  resources :books do
    resources :reservations
    get 'page/:page', :action => :index, :on => :collection
  end
  root 'books#index'

  #delete "/reservations/:id" => "reservations#destroy"

  get "/authors" => "authors#index", as: 'authors'
  get "/authors/new" => "authors#new", as: 'new_author'
  get "/authors/:id" => "authors#show", as: 'author'
  post "/authors" => "authors#create"


  #get "sessions/new"
  #get "/users" => "users#index", as: 'users'
  #get "/users/new" => "users#new", as: 'new_user'
  #get "/users/:id" => "users#show", as: 'user'
  #post "/users" => "users#create"

 # get "/books" => "books#index", as: 'books'
 # get "/books/new" => "books#new", as: 'new_book'
 # get "/books/:id" => "books#show", as: 'book'
 # post "/books" => "books#create"
 # get "/books/:id/edit" => "books#edit", as: 'edit_book'
 # patch "/books/:id" => "books#update"
 # delete "/books/:id" => "books#destroy"

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
