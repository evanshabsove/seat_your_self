class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reservatoin_confirm.subject
  #

  default from: "evan.shabsove@gmail.com"
  def reservation_confirm(user)
    @greeting = "Hi"
    @user = user

    #mail to: @user.email to email to user just testing with my email
    mail(to: @user.email, subject: "Reservation Confirmation")
  end
end
