class UsersController < ApplicationController
  helper_method :object_type
  def object_type
    params[:object_type]
  end

  def object_type_filter
    object_type ? {object_type: object_type} : nil
  end 

  def index
    @channels = Channel.includes(:items).where({user_id: current_user.id}).where(object_type_filter)
    @channel = Channel.new
    @votes = Vote.where(user_id: current_user.id)
  end
end
