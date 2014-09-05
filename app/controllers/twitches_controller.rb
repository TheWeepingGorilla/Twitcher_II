class TwitchesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = current_user
    @twitches = @user.twitches
    @mentions = @user.mentions
  end

  def new
    @twitch = Twitch.new
    @user = current_user
  end

  def create
    @twitch = Twitch.new(twitch_params)
    if @twitch.save
      flash[:notice] = "Twitch created."
      respond_to do |format|
        format.html { redirect_to twitches_path }
        format.js
      end
    else
      render 'new'
    end
  end

  def edit
    @twitch = Twitch.find(params[:id])
  end

  def update
    @twitch = Twitch.find(params[:id])
    if @twitch.update(twitch_params)
      flash[:notice] = "Twitch updated."
      redirect_to twitches_path
    else
      render 'edit'
    end
  end

  def destroy
    @twitch = Twitch.find(params[:id])
    @twitch.destroy
    flash[:notice] = "Twitch deleted."
    redirect_to twitches_path
  end

  private
  def twitch_params
    params.require(:twitch).permit(:content, :user_id)
  end
end
