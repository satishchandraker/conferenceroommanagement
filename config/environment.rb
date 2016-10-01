# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

my_date_formats = { :default => '%d/%m/%Y' } 
Time::DATE_FORMATS.merge!(my_date_formats) 
Date::DATE_FORMATS.merge!(my_date_formats)


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :domain               => 'smtp.gmail.com',
  :port                 => 25,
  :user_name            => 'satishchandrakar333@gmail.com',
  :password             => 'satish14789632',
#  :enable_starttls_auto => false
  :authentication       => "plain" 
}  