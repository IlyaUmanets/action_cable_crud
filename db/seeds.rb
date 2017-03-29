Room.create(name: 'first room')
Room.create(name: 'second room')

Message.create(content: 'first message', room: Room.first)
Message.create(content: 'second message', room: Room.second)
