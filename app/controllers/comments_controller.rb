class CommentsController < ApplicationController
    def create
        comment = Comment.create(comment_params)
        render json: comment, include: :user
    end

    private
    def comment_params
        params.require(:comment).permit(:text, :user_id, :room_id)
    end
end
