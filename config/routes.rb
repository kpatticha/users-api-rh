Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		resources :users,  defaults: { format: :json } do
		  	get 'users', to: 'users#index'
		  end
  	end
	end

end
