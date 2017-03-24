# frozen_string_literal: true
class RoomsController < ApplicationController
  def show; end

  private

  def messages
    @messages ||= Message.all
  end

  def message
    @message ||= Message.new
  end

  helper_method :messages, :message
end
