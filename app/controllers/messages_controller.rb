# frozen_string_literal: true
class MessagesController < ApplicationController
  def edit; end

  def show; end

  def update
    if message.update(message_params)
      redirect_to root_path

      ActionCable.server.broadcast 'room_channel',
        action: 'update',
        id: message.id,
        message: render_message(message)
    end
  end

  private

  def message
    @message ||= Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end

  helper_method :message
end
