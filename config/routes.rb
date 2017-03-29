# frozen_string_literal: true
Rails.application.routes.draw do
  resources :rooms, only: :show

  resources :messages

  mount ActionCable.server => '/cable'
end
