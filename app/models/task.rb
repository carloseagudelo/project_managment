class Task < ApplicationRecord

  include TaskValidations

  has_many :taks_jobs
  has_many :jobs, through: :taks_jobs

  validates_presence_of :name, :description, :message => 'DEBE INGRESAR LA INFORMACIÓN SOLICITADA'
  validate :validate_size_name, :validate_size_description

  def self.calculate_porcent(job_id)
  	tasks = TaksJob.includes(:task).where(job_id: job_id)  	
  	if tasks.count > 0
  	  total = tasks.count
  	  finished = 0
  	  tasks.each do |task|
  	    if task.task.checked
  	      finished = finished + 1
  	    end
  	  end
  	  (finished * 100) / total
  	else
 	  0
  	end
  end

end
