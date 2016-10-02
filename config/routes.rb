Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
		  # get	 'users/search' => 'users#search', defaults: { format: :json }

  		resources :users,  defaults: { format: :json } do
		  	get 'users', to: 'users#index'
		  	get 'users/:id', to: 'users#index'
		  	collection do
    			get :search
  			end
		  end


  	end
	end

end
