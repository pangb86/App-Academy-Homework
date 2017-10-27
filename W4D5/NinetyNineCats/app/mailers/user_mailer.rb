class UserMailer < ApplicationMailer
  default from: "master_chief@99cats.biz"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/session/new'
    mail(to: user.username, subject: 'Welcome to 99 Cats')
  end
end
