# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings

  def start_date_readable
    format('%<y>04d-%<m>02d-%<d>02d', y: start.year, m: start.month, d: start.day)
  end

  def start_date_8d
    format('%<y>04d%<m>02d%<d>02d', y: start.year, m: start.month, d: start.day)
  end
end
