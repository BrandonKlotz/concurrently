class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "rooms:#{message.room.id}", {
      room_id: message.room.id,
      message: MessagesController.render(message),
      username: message.user.username,
      body: message.body,
      avatar: GravatarImageTag.gravatar_url(message.user.email),
    }
  end
end
