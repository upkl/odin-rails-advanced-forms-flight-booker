# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:id])

    @num_tickets = params[:num_tickets].to_i

    @flight = @booking.flight

    @passengers = []
    # @num_tickets.times { @passengers << Passenger.new }
  end
end
