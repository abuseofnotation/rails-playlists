class ChannelsController < ApplicationController
  helper_method :object_type

  def object_type
    params[:object_type]
  end

  def object_type_filter
    object_type ? {object_type: object_type} : nil
  end 

  def channel_params
    params.require(:channel).permit(:name, :description, :object_type, :user_id)
  end

  def index
    @channels = Channel.includes(:items).where(object_type_filter) 

    if (object_type) 
    @votes = Vote.joins(item:[:channel]).where(channels: object_type_filter).
        includes(:user, item: [:channel])
    puts @votes
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

  def show
    @channel = Channel.find(params[:id])

    @channels = Channel.includes(:items).where(object_type: @channel.object_type).where.not(id: @channel.id).limit(5)

    @votes = Vote.joins(item:[:channel]).where(items:{channel_id: params[:id]}).
        includes(:user, item: [:channel]).limit(50)
  end

end
