class Channel < ApplicationRecord
  has_many :items
  belongs_to :user

  def self.default_scope 
    joins(:items).order('items.created_at desc')
  end
end
