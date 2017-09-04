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
    mail.delivery_method.settings.merge!(get_smtp_settings(options))
  end

  def get_smtp_settings(options)
    smtp = options[:smtp].downcase
    Rails.application.secrets.email_smtps[smtp.to_sym]
  end
end
