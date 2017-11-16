class TasksController < ApplicationController

  before_action :authenticate_user!

  # Lista todas las tareas por usuario o global por admin
  def index
    if current_user.role == 'ADMIN'
      @users = User.includes(:jobs).all
    else
      #@user = User.eager_load(jobs: {taks_jobs: :task}, users_teams: {team: :users_teams}).find(current_user)
      @user = User.includes(:jobs).find(current_user.id)
    end
  end

  def new
  	@task = Task.new
  end

  def create 

    @task = Task.new(task_params)
    if @task.validate
      if @task.save
        TaksJob.create(task_id: @task.id, job_id: params[:task][:job_id])
        flash[:notice] = "TAREA CREADA"
        redirect_to job_path(params[:task][:job_id])
      else
        flash[:error] = @task.errors.full_messages
        redirect_to new_task_path(params[:task][:job_id])
      end
    else
      flash[:error] = @task.errors.full_messages
      redirect_to new_task_path(params[:task][:job_id].to_i)
    end	
  end

  def update_checked
    if params[:checked].present? && params[:id].present?
      task = Task.find(params[:id])
      value = params[:checked] == '1' || params[:checked] == 'true' ? true : false
      if task.update(checked: value)
        render json: {data: 'TAREA CHECKEADA', status: 200}
      else
        render json: {data: 'LA TAREA NO FUE CHECKEADA', status: 422}
      end
    else
      render json: {data: 'LA TAREA NO FUE CHECKEADA ERROR', status: 422}
    end
  end

 private
  def task_params
    params.require(:task).permit(:name, :description)
  end

end
