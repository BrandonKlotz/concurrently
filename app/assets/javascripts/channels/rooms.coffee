App.rooms = App.cable.subscriptions.create "RoomsChannel",
  connected: ->
    console.log("Connected")

  disconnected: ->
    console.log("Disconnected")

  received: (data) ->
    active_chatroom = $("[data-behavior='messages'][data-room-id='#{data.room_id}']")
    if active_chatroom.length > 0
      active_chatroom.append(data.message)
    else
      $("[data-behavior='room-link'][data-room-id=#{data.room_id}]").css("font-weight, bold")

  send_message: (room_id, message) ->
    @perform "send_message", {room_id: chatroom_id, body: message}