# SMTP settings for gmail
ActionMailer::Base.smtp_settings = {
 :address              => "smtp.gmail.com",
 :port                 => 587,
 :user_name            => '',
 :password             => '',
 :authentication       => "plain",
:enable_starttls_auto => true
}

ActionMailer::Base.default :charset => "utf-8"
ActionMailer::Base.delivery_method = :smtp