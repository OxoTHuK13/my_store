class UsersController < ApplicationController

	def index
		@users = User.paginate(per_page: 10, page: params[:page])
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user])
		if @user.errors.empty?
			redirect_to @user
		else
			render "new"
		end
	end

	def edit
		@user = User.find(params[:id])		
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		if @user.errors.empty?
			redirect_to @user
		else
			render "edit"
		end
	end

	def destroy
		
	end

end
