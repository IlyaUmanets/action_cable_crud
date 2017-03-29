# frozen_string_literal: true
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from room_channel
  end

  def speak(data)
    content = data['content']
    message = room.messages.build(content: content)

    message.save!

    ActionCable.server.broadcast(
      room_channel,
      action: 'create',
      message: render_message(message)
    )
  end

  def destroy(data)
    message = Message.find(data['id'])

    message.destroy!

    ActionCable.server.broadcast(
      room_channel,
      action: 'destroy',
      id: data['id']
    )
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(
      partial: 'messages/message',
      locals: { message: message }
    )
  end

  def room_channel
    "room_channel_#{params[:roomId]}"
  end

  def room
    @room ||= Room.find(params[:roomId])
  end
end
