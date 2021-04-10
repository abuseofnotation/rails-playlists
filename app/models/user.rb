class User < ApplicationRecord
  include Clearance::User
  has_many :votes
  has_many :channels
end
