class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build
    @comment.post = @post
  end

  # private # I thought I needed to permit :body, but this kept throwing an error

  # def comment_params
  #   params.require(:comment).permit(:body)
  # end
end
