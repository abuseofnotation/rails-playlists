class ChannelsController < ApplicationController
  helper_method :object_type
  def object_type
    params[:object_type]
  end

  def index
    puts object_type
    @channels = object_type ? Channel.where({object_type: object_type}) : Channel.all
    @my_channels = object_type ? Channel.where({user_id: current_user.id, object_type: object_type}) : Channel.where({user_id: current_user.id})
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    binding.pry
    @channel.user_id = current_user.id
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
    params.require(:channel).permit(:name, :description, :object_type, :user_id)
  end
end
