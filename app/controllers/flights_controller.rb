# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    return nil unless params.include?(:flight)

    year = params[:flight][:date][...4].to_i
    month = params[:flight][:date][4...6].to_i
    day = params[:flight][:date][6..8].to_i

    return nil unless year.between?(2000, 2200) && month.between?(1, 12) && day.between?(1, 31)

    @flights = Flight.where(
      ['EXTRACT(year FROM "flights"."start") = ?', year]
    ).where(
      ['EXTRACT(month FROM "flights"."start") = ?', month]
    ).where(
      ['EXTRACT(day FROM "flights"."start") = ?', day]
    ).where(
      departure_airport_id: params[:flight][:departure_code],
      arrival_airport_id: params[:flight][:arrival_code]
    )

    @select_departure = params[:flight][:departure_code]
    @select_arrival = params[:flight][:arrival_code]
    @select_date = params[:flight][:date]
    @select_tickets = params[:flight][:num_tickets]
  end
end
