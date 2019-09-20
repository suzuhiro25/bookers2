class UsersController < ApplicationController
	before_action :authenticate_user!
	def new
	end

	def index
		@books = Book.all
		@users = User.all
		@user = current_user
		@book = Book.new

	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = Book.where(user_id: @user.id)
		#@books = @user.books
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(params[:id])
        if @user.update(user_params)
        flash[:notice] = " User info was successfully updated"
        redirect_to user_path(@user.id)
        else
        flash[:notice] = "error"
        render :edit
        end
	end
	# def ensure_correct_user
 #    if current_user.id != User.find(params[:id])
 #      redirect_to("/users")
 #    end
 #  end

	private
	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
