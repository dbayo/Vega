Vega::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  
  resources :explores
  get '/educators/plan' => 'educators#plan'
  get '/educators/teach' => 'educators#teach'

  post '/getBooksSearchResults' => 'books#getSearchResults'
  resources :books

  get '/contact' => 'home#contact'
  get '/setLanguage' => 'home#setLanguage'
  get '/history' => 'home#history'

  get '/admin' => 'admin#index'
  # Educators/plan
  get '/admin/educators/plan' => 'admin#editEducatorsPlan'
  post '/admin/educators/plan/addNews' => 'admin#addNews'
  delete '/admin/educators/plan/removeNews/:id' => 'admin#removeNews'
  post '/admin/educators/plan/addTeacherComment' => 'admin#addTeacherComment'
  delete '/admin/educators/plan/removeTeacherComment/:id' => 'admin#removeTeacherComment'
  # END - Educators/plan

  get '/admin/educators/teach' => 'admin#editEducatorsTeach'
  post '/admin/educators/teach/editEducationalOutcome' => 'admin#editEducationalOutcome'
  post '/admin/educators/teach/addResource' => 'admin#addResource'
  delete '/admin/educators/teach/removeResource/:id' => 'admin#removeResource'
  

  scope '/admin' do
    resources :cards do
      member do
        post 'uploadAttachment'
        delete 'removeAttachment'
        post 'addQuizz'
        delete 'removeQuizz'
        post 'addFunFact'
        delete 'removeFunFact'
        post 'addComment'
      end
    end
  end
  get '/cards/:id/openInfoModal' => 'cards#openInfoModal'
  
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
