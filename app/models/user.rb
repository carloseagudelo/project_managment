class User < ApplicationRecord
  
  has_many :users_teams
  has_many :teams, :through => :users_teams
  has_many :jobs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
