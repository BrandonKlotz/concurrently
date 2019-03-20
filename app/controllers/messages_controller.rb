class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def create
    message = @room.messages.new(message_params)
    message.user = current_user
    MessageRelayJob.perform_later(message) if message.save
  end

  private

    def set_room
      @room = current_user.rooms.find(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end