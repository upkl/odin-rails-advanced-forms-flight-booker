# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:id])

    @num_tickets = params[:num_tickets].to_i

    @flight = @booking.flight

    @num_tickets.times { @booking.passengers << Passenger.new }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).registration_email.deliver_later
      end
      redirect_to @booking
    else
      @num_tickets = booking_params[:passengers_attributes].keys.length
      @flight = Flight.find(booking_params[:flight_id])
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
