# frozen_string_literal: true
class Message < ApplicationRecord
  belongs_to :room, required: true
end
