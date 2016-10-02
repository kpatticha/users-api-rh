module API
	module V1
		class UsersController < ActionController::API
			# include MimeRespondes in order to use 'respond_to' method
			include ActionController::MimeResponds

			def index
				@users = User.all
				if @users
					respond(@users)
				else
					# handle 404
				end

			end

			def show
				@user = User.find(params[:id]) 

				if @user
					respond(@user)
				else
					# handle 404
				end

			end

			def destroy
				@user = User.destroy(params[:id])

				unless @user.nil?
					location = Location.where(:user_id => @user.id).destroy_all
					picture = Picture.where(:user_id => @user.id).destroy_all
					render json: {:status => 200, :message => "User with ID:#{@user.id} deleted successfully"}
				else
					render json: {:status => 404, :error => "User with ID:#{params[:id]} does not exist "}
				end
			end

			def create
				# grap params and create new user
				@user = User.new(:title => params["title"], :first_name => params['first_name'], :last_name => params['last'], :registered => params['registered'])
				
				# only if the validation that are set in the user model pass will save the object 
				if @user.save
					# if street or city are set as params, then create a location associated to the user
					if params['street'] || params['city']

						street = params['street']? params['street'] : nil
						city = params['city']? params['city'] : nil

						location = Location.new(:street => street, :city => city, :user_id => @user.id )
						location.save
					end
					render json: {:status => 200, :message => "User with ID:#{@user.id} created successfully"}
				else
					render json: {:status => 400, :error => @user.errors}
				end
			end

			def update
				@user = User.find(params[:id])
					# render json: {:status => 400, :error => params['last_name']}
					last_name = params['last_name']? params['last_name'] : @user.last_name
					email = params['email']? params['email'] : @user.email

					if @user.update_attributes(:last_name => "#{last_name}", :email => "#{email}")
						render json: {:status => 200, :message => "User with ID:#{@user.id} updated successfully"}
					else
						render json: {:status => 400, :error => @user.errors}
					end

			end

			def respond(data)
				respond_to  do |format|
					format.json { render json: data}
				end
			end

		end
	end
end
