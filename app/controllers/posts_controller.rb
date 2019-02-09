class PostsController < ApplicationController

  def index
  	@posts = Post.all.order(created_at: :desc)
  	@post = Post.new
  end

  def create
  	post = Post.new(post_params)
  	if  post.save
  	    flash[:create] = 'Book was successfully created.'
  	    redirect_to post_path(post)
    else
    	render action: :new
    end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
  	if 	post.update(post_params)
  		flash[:update] = 'Book was successfully updated.'
  		redirect_to post_path(post)
	  else
    	render action: :new
    end
  end

  def destroy
  	post = Post.find(params[:id])
  	if  post.destroy
  	    flash[:destroy] = 'Book was successfully destroyed.'
  	    redirect_to posts_path
  	else
  		render action: :new
  	end
  end

  private
  def post_params
  	params.require(:post).permit(:title, :body) # require はPOSTで受け取る値のキーを設定、permit は許可するカラムを設定
  end
end
