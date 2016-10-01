class UserMailer < ApplicationMailer
default from: 'satishchandrakar333@gmail.com'
 
  def welcome_email(user)
    @user = user
    mail(to: @user, subject: 'Welcome to My Awesome Site') 
  end
end
