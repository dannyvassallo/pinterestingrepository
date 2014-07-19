class CommentsController < ApplicationController
	def create
		@pin = Pin.find(params[:pin_id])

		@comment = @pin.comments.create!(comment_params)

		if @comment.errors.any?
			render "posts/show"
		else
			redirect_to @pin
		end
	end


	private


	def comment_params
		@comment_params ||= params.require(:comment).permit(:body)
	end

end