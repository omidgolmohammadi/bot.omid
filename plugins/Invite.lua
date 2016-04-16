do


local function callback(extra, success, result)
  if success == 1 and extra ~= false then
    return extra.text
  else
    return send_large_msg(chat, "Can't invite user to this group.")
  end
end

local function resolve_username(extra, success, result)
  local chat = extra.chat
  if success == 1 then
    local user = 'user#id'..result.id
    channel_invite_user(chat, user, callback, false)
    return extra.text
  else
    return send_large_msg(chat, "Can't invite user to this group.")
  end
end

local function action_by_reply(extra, success, result)
  if success == 1 then
    channel_invite_user('channel#id'..result.to.id, 'user#id'..result.from.id, callback, false)
  else
    return send_large_msg('chat#id'..result.to.id, "Can't invite user to this group.")
  end
end

local function run(msg, matches)
  local user_id = matches[1]
  local chat = 'channel#id'..msg.to.id
  local text = "Add: "..user_id.." to "..chat
  if msg.to.type == 'chat' then
    if msg.reply_id and msg.text:lower() == "invite" then
      msgr = get_message(msg.reply_id, action_by_reply, {msg=msg})
    end
    if string.match(user_id, '^%d+$') then
      user = 'user#id'..user_id
      channel_invite_user(chat, user, callback, {chat=chat, text=text})
    elseif string.match(user_id, '^@.+$') then
      username = string.gsub(user_id, '@', '')
      msgr = res_user(username, resolve_username, {chat=chat, text=text})
    else
      user = string.gsub(user_id, ' ', '_')
      channel_invite_user(chat, user, callback, {chat=chat, text=text})
    end
  else
    return 'This isnt a chat group!'
  end
end

return {
  description = 'Invite other user to the chat group.',
  usage = {
    ' !invite [id|user_name|name]'
  },
  patterns = {
    "^[Ii]nvite$",
    "^[Ii]nvite (.*)$",
    "^[Ii]nvite (%d+)$",
    "^[!/][Ii]nvite$",
    "^[!/][Ii]nvite (.*)$",
    "^[!/][Ii]nvite (%d+)$"
  },
  run = run,
  privileged = true
}

end