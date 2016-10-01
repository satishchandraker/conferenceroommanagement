class ApplicationMailer < ActionMailer::Base
   
  default from: "satishchandrakar333@gmail.com" 
  
  def welcome_email(email)
    mail(to: email, subject: "Notification for request generated!")
  end
  
  def iserve_support_mail()
    mail(to: "support@iserve.io", subject: "Notification for request generated!")
  end
  
  def create_user_request_mail(user_request)
    @user_request = user_request
    @mail_content = MailTemplate.find_by_content_type("new_request").content
    mail(to: @user_request.user.email, subject: "User request generated!")
  end
  
  def update_status_user_request_mail(user_request)
    @user_request = user_request
    @mail_content = MailTemplate.find_by_content_type("status").content
    mail(to: @user_request.user.email, subject: "User request status changed")
  end
end
