class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: (t "mails.user_mail.activate")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
