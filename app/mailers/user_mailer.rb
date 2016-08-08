class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_verification_mail.subject
  #
  def send_verification_mail
    @greeting = "Hi"

    mail to: "danielluz1995@gmail.com"
  end
end
