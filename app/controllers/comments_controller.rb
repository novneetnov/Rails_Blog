class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params.require(:comment).permit(:name, :body))
		if @comment.save
			redirect_to @post
		else
			render @post
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to @post
	end
end
