# frozen_string_literal: true

Rails.application.routes.draw do
  resources :flights, only: :index
  resources :bookings, only: %i[new create show]

  root 'flights#index'
end
