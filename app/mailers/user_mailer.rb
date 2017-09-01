class UserMailer < ApplicationMailer
	def send_email(user, recipients, options={})
    @recipients = recipients
    @user = user
    @options = options
    mail(
      to: @recipients.join(','), 
      subject: options[:subject],
      body: options[:content]
      )
  end
end
