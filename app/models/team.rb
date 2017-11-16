class Team < ApplicationRecord

  include TeamValidations

  has_many :users_teams
  has_many :users, :through => :users_teams
  has_many :jobs

  validates_presence_of :name, :description, :message => 'DEBE INGRESAR LA INFORMACIÓN SOLICITADA'
  validate :validate_size_name, :validate_size_description

end
