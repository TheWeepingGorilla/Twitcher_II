class FollowersController < ApplicationController

  before_filter :authenticate_user!

  def new
    @follower = Follower.new
    @user = current_user
  end

  def create
    @follower = Follower.new(follower_params)
    if @follower.save
      flash[:notice] = "Sycophantic relationship with #{params[:user_id]} created."
      respond_to do |format|
        format.html { redirect_to twitches_path }
        format.js
      end
    else
      render 'new'
    end
  end

private
  def follower_params
    params.require(:follower).permit(:user_id, :follower_id)
  end

end
