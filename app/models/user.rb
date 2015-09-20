class User < ActiveRecord::Base

  validates :user_name, :presence => true
  validates :user_team, :presence => true
  validates :user_team, :presence => true

end
