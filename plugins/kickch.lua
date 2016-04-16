 local function run(msg, matches)
  if matches[1]:lower() == 'sik' then
    if type(msg.reply_id)~="nil" and is_momod(msg_channel) then
      if is_admin(msg_channel) then
        local msgr = get_message(msg.reply_id,Kick_by_reply_channel, false)
      else
        msgr = get_message(msg.reply_id,Kick_by_reply, false)
      end
    end
    if msg.to.type == 'channel' then
      local user_id = matches[2]
      local channel_id = msg.to.id
      if string.match(matches[2], '^%d+$') then
        if tonumber(matches[2]) == tonumber(our_id) then 
          return
        end
        if not is_admin(msg) and is_momod2(matches[2], msg.to.id) then
          return "you can't kick mods/owner/admins"
        end
        if tonumber(matches[2]) == tonumber(msg.from.id) then
          return "You can't kick your self !"
        end
        local name = user_print_name(msg.from)
        savelog(msg.to.id, name.." ["..msg.from.id.."] kicked user ".. matches[2])
        kick_user(user_id, channel_id)
      else
        local member = string.gsub(matches[2], '@', '')
        local get_cmd = 'kick'
        local name = user_print_name(msg.from)
        savelog(msg.to.id, name.." ["..msg.from.id.."] kicked user ".. matches[2])
        channel_info(receiver, username_id, {get_cmd=get_cmd, receiver=receiver, channel_id=msg.to.id, member=member})
      end
    else
      return 'This isn\'t a chat group'
    end
  end

  if not is_admin(msg_channel) then
    return
  end
   end
return {
  patterns = {
    "^([Kk]ick)$",
    "^([Ss]ik)$",
    "^([Kk]ick) (.*)$",
    "^([Ss]ik) (.*)$",
    "^([Kk]ickme)$",
    "^[!/]([Kk]ick)$",
    "^[!/]([Kk]ick) (.*)$",
  },
  run = run,
  pre_process = pre_process
}
