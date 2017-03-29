$ ->
  App.room = App.cable.subscriptions.create {
    channel: "RoomChannel", roomId: $('#messages').data('room-id') },

    received: (data) ->
      appendMessage(data)
      destroyMessage(data)
      updateMessage(data)

    speak: (content) ->
      @perform 'speak', content: content

    destroy: (id) ->
      @perform 'destroy', id: id

$(document).on 'keypress', '#message_content', (event) ->
  if event.keyCode is 13
    message_form = $(@).parents('form')

    if message_form.hasClass('new_message')
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
    else
      message_form.submit()

$(document).on 'click', '.destroy_message', ->
  App.room.destroy $(@).parents('.message').data('message-id')

appendMessage = (data) ->
  if data['action'] == 'create'
    $('#messages').append data['message']

destroyMessage = (data) ->
  if data['action'] == 'destroy'
    message = $("*[data-message-id=#{data['id']}]")
    message.remove();

updateMessage = (data) ->
  if data['action'] == 'update'
    message = $("*[data-message-id=#{data['id']}]")
    message.html(data['message'])
