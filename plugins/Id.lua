local function usernameinfo (user)
  if user.username then
    return '@'..user.username
  end
  if user.print_name then
    return user.print_name
  end
  local text = ''
  if user.first_name then
    text = user.last_name..' '
  end
  if user.lastname then
    text = text..user.last_name
  end
  return text
end

local function channelUserIDs (extra, success, result)
  local receiver = extra.receiver
  print('Result')
  vardump(result)
  
  local text = ''
  for k,user in ipairs(result) do
    local id = user.peer_id
    local username = usernameinfo (user)
    text = text..("%s - %s\n"):format(username, id)
  end
  send_large_msg(receiver, text)
end

local function returnids (extra, success, result)
  local receiver = extra.receiver
  local chatname = result.print_name
  local id = result.peer_id
    
  local text = ('Id for chat %s (%s):\n'):format(chatname, id)
  for k,user in ipairs(result.members) do
    local username = usernameinfo(user)
    local id = user.peer_id
    local userinfo = ("%s - %s\n"):format(username, id)
    text = text .. userinfo
  end
  send_large_msg(receiver, text)
end

local function run(msg, matches)
  local receiver = get_receiver(msg)

  -- Id of the user and info about group / channel
  if matches[1]:lower() == "id" then
    if msg.to.type == 'channel' then
      return ('Group Id: %s\n\n👤Your Id: %s'):format(msg.to.id, msg.from.id)
    end
    if msg.to.type == 'chat' then
      return ('Group Id: %s\n\n👤Your Id: %s'):format(msg.to.id, msg.from.id)
    end
    return ('Your Id: %s'):format(msg.from.id)
  elseif matches[1]:lower() == 'chat' or matches[1]:lower() == 'channel' then
    local type = matches[1]
    local chanId = matches[2]
    -- !ids? (chat) (%d+)
    if chanId then
      local chan = ("%s#id%s"):format(type, chanId)
      if type == 'chat' then
        chat_info(chan, returnids, {receiver=receiver})
      else
        channel_get_users(chan, channelUserIDs, {receiver=receiver})
      end
    else
      -- !id chat/channel
      local chan = ("%s#id%s"):format(msg.to.type, msg.to.id)
      if msg.to.type == 'channel' then
        channel_get_users(chan, channelUserIDs, {receiver=receiver})
      end
   end
  elseif matches[1]:lower() == "member" and matches[2] == "@" then    
    
    local nick = matches[3]
    local chan = get_receiver(msg)

    if msg.to.type == 'chat' then
      chat_info(chan, function (extra, success, result)
        local receiver = extra.receiver
        local nick = extra.nick
        local found
        for k,user in pairs(result.members) do
          if user.username == nick then
            found = user
          end
        end
        if not found then
          send_msg(receiver, "User not found on this chat.", ok_cb, false)
        else
          local text = found.peer_id
          send_msg(receiver, text, ok_cb, false)
        end
      end, {receiver=chan, nick=nick})
    elseif msg.to.type == 'channel' then
      -- TODO
      return 'Channels currently not supported'
    else
      return 'You are not in a group'
    end
  elseif matches[1]:lower() == "members" and matches[2]:lower() == "name" then
    
    local text = matches[3]
    local chan = get_receiver(msg)

    if msg.to.type == 'chat' then
      chat_info(chan, function (extra, success, result)
        local members = result.members
        local receiver = extra.receiver
        local text = extra.text

        local founds = {}
        for k,member in pairs(members) do
          local fields = {'first_name', 'print_name', 'username'}
          for k,field in pairs(fields) do
            if member[field] and type(member[field]) == "string" then
              if member[field]:match(text) then
                local id = tostring(member.peer_id)
                founds[id] = member
              end
            end
          end
        end
        if next(founds) == nil then -- Empty table
          send_msg(receiver, "User not found on this chat.", ok_cb, false)
        else
          local text = ""
          for k,user in pairs(founds) do
            local first_name = user.first_name or ""
            local print_name = user.print_name or ""
            local user_name = user.user_name or ""
            local id = user.peer_id  or "" -- This would be funny
            text = text.."First name: "..first_name.."\n"
              .."Print name: "..print_name.."\n"
              .."User name: "..user_name.."\n"
              .."Id: "..id
          end
          send_msg(receiver, text, ok_cb, false)
        end
      end, {receiver=chan, text=text})
    elseif msg.to.type == 'channel' then
      -- TODO
      return 'Channels currently not supported'
    else
      return 'You are not in a group'
    end
  end
end

return {
  description = "Know your id or the id of a chat members.",
  usage = {
    "!id: Return your ID and the chat id if you are in one.",
    "!ids chat: Return the IDs of the current chat members.",
    "!ids chat <chat_id>: Return the IDs of the <chat_id> members.",
    "!ids channel: Return the IDs of the current channel members.",
    "!ids channel <channel_id>: Return the IDs of the <channel_id> members.",
    "!id member @<user_name>: Return the member @<user_name> ID from the current chat",
    "!id members name <text>: Search for users with <text> on first_name, print_name or username on current chat"
  },
  patterns = {
    "^[Ii]d$",
    "^[Ii]ds? ([Cc]hat) (%d+)$",
    "^[Ii]ds? ([Cc]hat)$",
    "^[Ii]ds ([Cc]hannel)$",
    "^[Ii]ds ([Cc]hannel) (%d+)$",
    "^[Ii]d ([Mm]ember) (@)(.+)",
    "^[Ii]d ([Mm]embers) ([Nn]ame) (.+)",
    "^[!/]([Ii]d)$",
    "^[!/]([Ii]ds)? ([Cc]hat) (%d+)$",
    "^[!/]([Ii]ds)? ([Cc]hat)$",
    "^[!/]([Ii]ds) ([Cc]hannel)$",
    "^[!/]([Ii]ds) ([Cc]hannel) (%d+)$",
    "^[!/]([Ii]d) ([Mm]ember) (@)(.+)",
    "^[!/]([Ii]d) ([Mm]embers) ([Nn]ame) (.+)",
    
  },
  run = run
}
