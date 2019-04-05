App.rooms = App.cable.subscriptions.create "RoomsChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    active_room = $("[data-behavior='messages'][data-room-id='#{data.room_id}']")
    if active_room.length > 0
      active_room.append(data.message)
      if document.hidden
        if Notification.permission == "granted"
          new Notification(data.username, {body: data.body, icon: data.avatar})
      else
        # App.last_read.update(data.room_id)
    else
      $("[data-behavior='room-link'][data-room-id='#{data.room_id}']").css("font-weight", "bold")

  send_message: (room_id, message) ->
    @perform "send_message", { room_id: room_id, body: message }
