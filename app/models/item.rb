class Item < ApplicationRecord
  belongs_to :channel
  has_many :votes
  # TODO, this is weird default_scope { order(votes: :desc, created_at: :desc ) }
  default_scope { order(votes: :desc) }
end
