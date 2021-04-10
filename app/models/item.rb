class Item < ApplicationRecord
  belongs_to :channel
  has_many :votes
end
