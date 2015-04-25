class PostsController < ApplicationController
 before_action :authorized?, only: [:edit, :update]
	
  	def index
		@posts = Post.all
	end

	def earned
		@post = Post.find(params[:id])
    @post.earned = true
    @post.save
    redirect_to posts_path
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@user = current_user
		@post = @user.posts.new

	end

	def create
		@user = current_user
		@post = @user.posts.new(post_params)
			if @post.save
				redirect_to posts_path
			else
				render :new
			end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(post_params)
			redirect_to posts_path
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :image_url, :description, :earned, :user)
	end

  def authorized?
    unless current_user = Post.find(params[:id])
      flash[:error] = "You are not authorized to access that page."
      redirect_to posts_path 
    end
  end

end
