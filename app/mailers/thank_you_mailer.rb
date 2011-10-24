class ThankYouMailer < ActionMailer::Base
  default from: Settings.default_email_from

  def success(email)
    mail(:to => email, :subject => "Thank you for your sirihumor.me screenshot")
  end

  def failure(email, error_message)
    mail(:to => email, :subject => "sirihumor.me Attachment Error")
  end
end
