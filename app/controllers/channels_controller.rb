class ChannelsController < ApplicationController
  helper_method :object_type

  def object_type
    params[:object_type]
  end

  def object_type_filter
    object_type ? {object_type: object_type} : nil
  end 

  def index

    @channels = Channel.includes(:items).where(object_type_filter) 

    if current_user
      @my_channels = Channel.includes(:items).where({user_id: current_user.id}).where(object_type_filter)
    else 
      @my_channels = []
    end

    if (object_type) 
    @votes = Vote.joins(item:[:channel]).where("object_type = '#{object_type}'").references(:channel).
        includes(:user, item: [:channel])
    else
    @votes = Vote.all.
        includes(:user, item: [:channel])
    end

    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
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
