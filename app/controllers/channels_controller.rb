class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
    @channel = Channel.new
  end


  def create
    puts params
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to '/', notice: "Channel was successfully created." }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @Channel.errors, status: :unprocessable_entity }
      end
    end
  end
  def channel_params
    params.require(:channel).permit(:name, :description)
  end
end
