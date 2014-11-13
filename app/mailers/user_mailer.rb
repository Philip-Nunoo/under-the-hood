class UserMailer < ActionMailer::Base
  default from: "philip.afful@meltwater.org"

  def send_mail(user, message)
    @user = user
    @message  = message
    mail(to: @user.email, subject: "Under the hood")
  end
end
