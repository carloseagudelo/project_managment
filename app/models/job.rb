class Job < ApplicationRecord

  include JobValidations

  has_one :customer
  has_one :team
  has_one :user
  has_many :taks_jobs
  has_many :taks, through: :taks_jobs

  validates_presence_of :name, :description, :customer_id, :message => 'DEBE INGRESAR LA INFORMACIÓN SOLICITADA'
  validate :validate_size_name, :validate_size_description

end
