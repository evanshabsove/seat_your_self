# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/reservatoin_confirm
  def reservatoin_confirm
    UserMailer.reservatoin_confirm
  end

end
