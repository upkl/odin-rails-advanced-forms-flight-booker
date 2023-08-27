# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end
end
