class VotesController < ApplicationController
  def create
    @item = Item.find(item_params[:item_id])

    if (!Vote.where(item_id: @item.id, user_id: current_user.id).empty?) 
      respond_to do |format|
        error = "You already voted for this #{@item.channel.object_type}"
        format.html { redirect_back fallback_location: '/', notice: error }
        format.json { render json: error, status: :unprocessable_entity }
      end

    else
      ActiveRecord::Base.transaction do
        @vote = Vote.new(item_params)
        @vote.new_item = false
        @vote.user_id = current_user.id
        @vote.save!

        @item.votes_count = @item.votes_count + 1
        @item.save!
      end

      respond_to do |format|
        format.html { redirect_back fallback_location: '/', notice: "Vote was successfully cast." }
        format.json { render :show, status: :created, location: @vote }
      end
    end

    rescue ActiveRecord::RecordInvalid
      respond_to do |format|
        format.html { redirect_back fallback_location: '/', notice: "Error while saving the item"}
        format.json { render status: :unprocessable_entity }
      end 
  end

  def item_params
    params.require(:vote).permit(:item_id)
  end 
end
