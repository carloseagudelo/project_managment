class JobsController < ApplicationController

  before_action :authenticate_user!


  def index

  end

  # Renderiza la vista para crear un nuevo job
  def new
  	@job = Job.new
    @users = User.select(:id, :name).where('role != ?', 'ADMIN')
    @customers = Customer.all
  end

  # Crea el job
  def create
    if params[:ids].present?
      if params[:ids].split(',').count == 1
        @job = Job.new(job_params)
        @job.team_id = params[:job][:team_id]
        @job.user_id = params[:ids].to_i
        if @job.validate
          if @job.save
            flash[:notice] = "TRABAJO CREADO"
            redirect_to team_path(params[:job][:team_id])
          else
            initialice_variables
            redirect_to new_job_path(@job.team_id)
          end
        else
          initialice_variables
          redirect_to new_job_path(@job.team_id)
        end
      else
        initialice_variables
        flash[:error] = 'SOLO DEBE SELECCIONAR UN RESPONSABLE'
        redirect_to new_job_path(params[:job][:team_id])
      end
    else
      initialice_variables
      flash[:error] = 'DEBE SELECCIONAR UN RESPONSABLE'
      redirect_to new_job_path(params[:job][:team_id])
    end  	
  end

  # Visualiza la información del job
  def show
    @job = Job.find(params[:id])
    @tasks = TaksJob.select(:id, :task_id).where(job_id: params[:id]).includes(:task)
  end

  # Renderiza la vista para actualizar el job
  def edit
    @job = Job.find(params[:id])
    @users = User.select(:id, :name).where('role != ?', 'ADMIN')
    @customers = Customer.all
  end

  # Actualiza la información del job
  def update
    @job = Job.find(params[:id])
    if params[:ids].present?
      if params[:ids].split(',').count == 1        
        @job.user_id = params[:ids].to_i
        if @job.update(job_params)
          flash[:notice] = "TRABAJO ACTUALIZADO"
          redirect_to team_path(params[:job][:team_id])
        else
          initialice_variables 
          flash[:error] = @job.errors.full_messages                   
          redirect_to edit_job_path(@job.id, @job.team_id)
        end
      else
        initialice_variables
        flash[:error] = 'SOLO DEBE SELECCIONAR UN RESPONSABLE'
        redirect_to edit_job_path(@job.id, params[:job][:team_id])
      end
    else
      initialice_variables
      flash[:error] = 'DEBE SELECCIONAR UN RESPONSABLE'
      redirect_to edit_job_path(@job.id, params[:job][:team_id])
    end  
  end

  # Metodo que envia notificación de tareas no realizadas
  def send_notification
    if params[:id].present?
      ApplicationMailer.notification_time(params[:id]).deliver
      flash[:notice] = 'NOTFICACIÓN ENVIADA'
      redirect_to root_path
    else
      flash[:notice] = 'LA NOTFICACIÓN NO FUE ENVIADA'
      redirect_to root_path
    end
  end

  def initialice_variables
    @users = User.select(:id, :name).where('role != ?', 'ADMIN')
    @customers = Customer.all
  end

 private
  def job_params
    params.require(:job).permit(:name, :description, :customer_id)
  end

end
