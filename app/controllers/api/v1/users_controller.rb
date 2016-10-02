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

			def respond(data)
				respond_to  do |format|
					format.json { render json: data,  serializer: UserSerializer}
				end
			end

		end
	end
end
