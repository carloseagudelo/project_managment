class ApplicationMailer < ActionMailer::Base
  default from: 'carloskikea@gmail.com'
  layout 'mailer'

  def registration(email)
    mail(to: email, subject: 'REGISTRO EN PLATAFORMA')
  end

  def notification_time(job_id)
    @job = Job.find(job_id)
    @team = Team.find(@job.team_id)
    @user = User.find(@job.user_id)
    mail(to: @user.email, subject: 'REVISAT TAREAS')
  end

end
