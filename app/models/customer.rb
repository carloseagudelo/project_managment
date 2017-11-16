class Customer < ApplicationRecord

  include CustomerValidations

  has_many :jobs

  validates_presence_of :name, :description, :message => 'DEBE INGRESAR LA INFORMACIÓN SOLICITADA'
  validate :validate_unique_customer, :validate_size_name, :validate_size_description

end
