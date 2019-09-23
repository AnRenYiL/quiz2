class LikesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      idea = Idea.find(params[:idea_id])
      like = Like.new(user: current_user, idea: idea)
      if !can?(:like, idea)
        redirect_to request.referrer, alert: "can't like your own idea"
      elsif like.save
        flash[:success] = "Idea Liked"
        redirect_to request.referrer
      else
        flash[:danger] = like.errors.full_messages.join(", ")
        redirect_to request.referrer
      end
    end
  
    def destroy
      like = current_user.likes.find(params[:id])
      if can? :destroy, like
        like.destroy
        flash[:success] = "Idea unliked"
        redirect_to request.referrer
      else
        flash[:danger] = "Can't delete like"
        redirect_to request.referrer
      end
    end
end
