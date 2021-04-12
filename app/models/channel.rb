class Channel < ApplicationRecord
  has_many :items
  belongs_to :user

  def self.default_scope 
    includes(items: :votes).order('votes.created_at desc')
  end
end
