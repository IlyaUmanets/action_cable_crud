# frozen_string_literal: true
Rails.application.routes.draw do
  root 'rooms#index'

  resources :rooms, only: [:index, :show]

  resources :messages

  mount ActionCable.server => '/cable'
end
