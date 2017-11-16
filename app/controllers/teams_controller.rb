class TeamsController < ApplicationController

  before_action :authenticate_user!

  # Metodo que lista los equipos registrados
  def index
  	if current_user.role == 'ADMIN'
  	  @teams = Team.includes(:users_teams)
  	else
  	  @teams = UsersTeam.select(:id, :team_id, :lead).where(user_id: current_user.id).includes(:team)
  	end
  end

  # Renderiza el view dw nuevo team
  def new
    @team = Team.new
    @users = User.select(:id, :name).where('id != ? and role != ?', current_user.id, 'ADMIN')
  end

  # Crea un registro de team
  def create
    if params[:ids].present?
      @team = Team.new(team_params)
      if @team.validate
        if @team.save
          UsersTeam.create(user_id: current_user.id, team_id: @team.id, lead: true)
          save_users_from_team(params[:ids], 'create')
          flash[:notice] = "EQUIPO CREADO"
          redirect_to teams_path
        else
          @users = User.select(:id, :name).where('id != ? and role != ?', current_user.id, 'ADMIN')
          render :new
        end
      else
        @users = User.select(:id, :name).where('id != ? and role != ?', current_user.id, 'ADMIN')
        render :new
      end
    else
      @team = Team.new(team_params)
      @users = User.select(:id, :name).where('id != ? and role != ?', current_user.id, 'ADMIN')
      flash[:error] = "DEBE SELECCIONAR AL MENOS UN INTEGRANTE DEL EQUIPO"
      render :new
    end
  end

  # Visualiza la información del team
  def show
	  @team = Team.find(params[:id])
    @lead = UsersTeam.select(:user_id).where(team_id: @team.id, lead: true).first.user_id
	  @jobs = Job.where(team_id: params[:id])
    @members = UsersTeam.where(team_id: @team.id).includes(:user)
  end

  # Remderiza la vista para editar la información del team
  def edit 
    @team = Team.find(params[:id])
    @users = User.select(:id, :name).where('id != ? and role != ?', current_user.id, 'ADMIN')
  end

  # Actualiza el registro
  def update
    @team = Team.find(params[:id])
    if params[:ids].present?
      if @team.update(team_params)
        save_users_from_team(params[:ids], 'update')
        flash[:notice] = "EQUIPO ACTUALIZADO"
        redirect_to root_path
      else
        @users = User.select(:id, :name).where('id != ? and role != ?', current_user.id, 'ADMIN')
        render :edit
      end
    else
      @users = User.select(:id, :name).where('id != ? and role != ?', current_user.id, 'ADMIN')
      flash[:error] = "DEBE SELECCIONAR AL MENOS UN INTEGRANTE DEL EQUIPO"
      render :edit
    end
  end

  def save_users_from_team(ids, type)
    if type == 'create'
      ids.split(',').each do |id|
        UsersTeam.create(user_id: id.to_i, team_id: @team.id)
      end
    else
      ids_to_save = ids.split(',')
      ids_saved = UsersTeam.select(:user_id).where('team_id == ? and lead != ?', @team.id, true)
      ids_saved.each do |id|
        if !ids_to_save.include?(id.to_s)
          UsersTeam.where(user_id: id.user_id.to_i, team_id: @team.id).first.delete
        end
      end

      ids_to_save.each do |id|
        if UsersTeam.where(user_id: id.to_i, team_id: @team.id).first.nil?          
          UsersTeam.create(user_id: id.to_i, team_id: @team.id)
        end
      end
    end
  end

 private
  def team_params
    params.require(:team).permit(:name, :description)
  end

end
