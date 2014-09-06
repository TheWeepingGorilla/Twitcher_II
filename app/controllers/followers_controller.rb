class FollowersController < ApplicationController

  before_filter :authenticate_user!

  def new
    @follower = Follower.new
    @user = current_user
    @users = User.all
  end

  def create
    @follower = Follower.new(follower_params)
    if @follower.save
      respond_to do |format|
        format.html { redirect_to twitches_path }
        format.js
      end
    else
      render 'new'
    end
  end

def destroy
    @follower = Follower.find(params[:id])
    @follower.destroy
    redirect_to twitches_path
  end

private
  def follower_params
    params.require(:follower).permit(:user_id, :follower_id)
  end

end
