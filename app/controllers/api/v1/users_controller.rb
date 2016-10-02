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
				@user = User.delete(params[:id])

				if @user == 1 
					render json: {:status => 200, :message => "User with ID:#{params[:id]} deleted successfully"}
				else
					render json: {:status => 404, :error => "User with ID:#{params[:id]} does not exist "}
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
