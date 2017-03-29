# frozen_string_literal: true
class MessagesController < ApplicationController
  def edit; end

  def show; end

  def update
    if message.update(message_params)
      redirect_to room_path(message.room)

      channel_update_message
    end
  end

  private

  def message
    @message ||= Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def channel_update_message
    ActionCable.server.broadcast(
      "room_channel_#{message.room_id}",
      action: 'update',
      id: message.id,
      message: render_message(message)
    )
  end

  def render_message(message)
    ApplicationController.renderer.render(
      partial: 'messages/message',
      locals: { message: message }
    )
  end

  helper_method :message
end
