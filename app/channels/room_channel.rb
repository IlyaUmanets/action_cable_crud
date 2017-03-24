# frozen_string_literal: true
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    content = data['message']
    message = Message.new content: content

    message.save!

    ActionCable.server.broadcast 'room_channel', action: 'create', message: render_message(message)
  end

  def update(_data)
    content
  end

  def destroy(data)
    message = Message.find(data['id'])

    message.destroy!

    ActionCable.server.broadcast 'room_channel', action: 'destroy', id: data['id']
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
