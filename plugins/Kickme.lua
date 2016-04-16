do
local function run(msg, matches)
 if matches[1]:lower() == 'kickme' then
       channel_kick_user("channel#id"..msg.to.id, 'user#id'..msg.from.id, ok_cb, false)
       send_large_msg("channel#id"..msg.to.id, 'User @'..msg.from.username.. ' Left Group') 
    end
end
return {
  patterns = {
    "^[!/]([Kk]ickme)$",
    "^([Kk]ickme)$"
  },
  run = run
}
end