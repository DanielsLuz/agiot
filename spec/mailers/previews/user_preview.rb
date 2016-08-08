# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/send_verification_mail
  def send_verification_mail
    UserMailer.send_verification_mail
  end

end
