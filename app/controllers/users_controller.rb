class UsersController < ApplicationController
  helper_method :object_type
  def object_type
    params[:object_type]
  end

  def object_type_filter
    object_type ? {object_type: object_type} : nil
  end 

  def show
    @user = params[:id] ? User.find(params[:id]) : current_user
    @channels = Channel.includes(:items).where({user_id: @user.id}).where(object_type_filter)
    puts @channels
    @channel = Channel.new
    @votes = Vote.where(user_id: @user.id)
  end
end
