# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Flight.destroy_all
Airport.destroy_all

Airport.create!(code: 'DMM', place: 'Dammam')
Airport.create!(code: 'DEN', place: 'Denver')
Airport.create!(code: 'DFW', place: 'Dallas')
Airport.create!(code: 'IAD', place: 'Washington')
Airport.create!(code: 'MCO', place: 'Orlando')
Airport.create!(code: 'PKX', place: 'Beijng')
Airport.create!(code: 'IAH', place: 'Houston')
Airport.create!(code: 'PVG', place: 'Shanghai')
Airport.create!(code: 'CAI', place: 'Cairo')
Airport.create!(code: 'BKK', place: 'Bangkok')
Airport.create!(code: 'ATL', place: 'Atlanta')
Airport.create!(code: 'PEK', place: 'Beijing')
Airport.create!(code: 'LAX', place: 'Los Angeles')
Airport.create!(code: 'DXB', place: 'Dubai')
Airport.create!(code: 'HND', place: 'Tokyo')
Airport.create!(code: 'ORD', place: 'Chicago')
Airport.create!(code: 'LHR', place: 'London')
Airport.create!(code: 'CDG', place: 'Paris')

800.times do
  Flight.create(
    code: format("#{('A'..'Z').to_a.sample}#{('A'..'Z').to_a.sample}%03d", rand(1..999)),
    departure_airport: Airport.all.sample,
    arrival_airport: Airport.all.sample,
    start: (rand(1000).days + rand(1440).minutes).from_now,
    duration: format('%<h>02d:%<m>02d', h: rand(13), m: rand(60))
  )
end

400.times do
  Flight.create(
    code: format("#{('A'..'Z').to_a.sample}#{('A'..'Z').to_a.sample}%03d", rand(1..999)),
    departure_airport: Airport.all.sample,
    arrival_airport: Airport.all.sample,
    start: (28.days + rand(1440).minutes).from_now,
    duration: format('%<h>02d:%<m>02d', h: rand(13), m: rand(60))
  )
end
