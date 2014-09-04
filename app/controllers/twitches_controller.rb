class TwitchesController < ApplicationController

  before_filter :authenticate_user!, except: [:index]

  def index
    @twitches = Twitch.all
  end

  def new
    @twitch = Twitch.new
  end

  def create
    @twitch = Twitch.new(twitch_params)
    if @twitch.save
      flash[:notice] = "Twitch created."
      redirect_to twitches_path
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
