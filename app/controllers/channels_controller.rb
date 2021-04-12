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

    if (object_type) 
      @channels = Channel.where(object_type_filter)
        .group_by(&:object_type)
      @votes = Vote.includes(:user, item:[:channel]).where(channels: object_type_filter)
    else
      @channels = Channel.limit(50)
        .group_by(&:object_type)
      @votes = Vote
        .includes(:user, item: [:channel])
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

    @channels = Channel.where(object_type: @channel.object_type).where.not(id: @channel.id).limit(50)
    # .items.sort_by {|obj| -obj[:votes_count]}

    @votes = Vote.includes(item:[:channel]).where(items:{channel_id: params[:id]})
        .limit(50)
  end

end
