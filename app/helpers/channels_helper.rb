module ChannelsHelper
  def get_items(channel, condensed_view) 
    items = channel.items.sort_by {|obj| -obj[:votes_count]}
    if condensed_view
      items.take(5)
    else
      items
    end
  end
end
