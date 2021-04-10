class VotesController < ApplicationController
  def create
    @item = Item.find(item_params[:item_id])
    if (Vote.where(item_id: @item.id, user_id: current_user.id).empty?) 
      @vote = Vote.new(item_params)
      @vote.new_item = false
      @vote.user_id = current_user.id
      @item.votes_count = @item.votes_count + 1

      respond_to do |format|
        if @vote.save && @item.save
          format.html { redirect_back fallback_location: '/', notice: "Vote was successfully cast." }
          format.json { render :show, status: :created, location: @vote }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @vote.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        error = "You already voted for this #{@item.channel.object_type}"
        format.html { redirect_back fallback_location: '/', notice: error }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end
  def item_params
    params.require(:vote).permit(:item_id)
  end 
end
