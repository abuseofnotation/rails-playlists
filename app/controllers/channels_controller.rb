class ChannelsController < ApplicationController
  helper_method :object_type
  def object_type
    params[:object_type]
  end

  def index
    puts object_type
    @channels = object_type ? Channel.where({object_type: object_type}) : Channel.all
    @channel = Channel.new
  end


  def create
    puts params
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_back fallback_location: '/', notice: "Channel was successfully created." }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @Channel.errors, status: :unprocessable_entity }
      end
    end
  end
  def channel_params
    params.require(:channel).permit(:name, :description, :object_type)
  end
end
