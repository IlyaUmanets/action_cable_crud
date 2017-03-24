App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data['action'] == 'create'
      $('#messages').append data['message']
    else if data['action'] == 'destroy'
      message = $("*[data-message-id=#{data['id']}]")
      message.remove();
    else if data['action'] == 'update'
      message = $("*[data-message-id=#{data['id']}]")
      message.html(data['message'])

  speak: (message) ->
    @perform 'speak', message: message

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
