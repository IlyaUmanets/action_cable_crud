# frozen_string_literal: true
class Room < ApplicationRecord
  has_many :messages, dependent: :delete_all
end
