# frozen_string_literal: true
Rails.application.routes.draw do
  root 'rooms#show'

  resources :messages

  mount ActionCable.server => '/cable'
end
