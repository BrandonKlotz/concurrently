class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ActionCable.server.broadcast "rooms:#{message.room.id}", {
      message: MessagesController.render(message),
      room_id: message.room.id
    }
  end
end
