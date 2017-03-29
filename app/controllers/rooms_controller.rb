# frozen_string_literal: true
class RoomsController < ApplicationController
  def show; end

  private

  def room
    @room ||= Room.find(params[:id])
  end

  def messages
    @messages ||= room.messages.all
  end

  def message
    @message ||= Message.new
  end

  helper_method :messages, :message, :room
end
