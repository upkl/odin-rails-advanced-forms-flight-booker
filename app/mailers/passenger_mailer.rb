class PassengerMailer < ApplicationMailer

  def registration_email
    @passenger = params[:passenger]
    @url = url_for @passenger.booking
    mail(to: @passenger.email, subject: 'Your flight was booked.')
  end
end
