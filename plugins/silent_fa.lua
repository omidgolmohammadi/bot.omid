
antiarabic = {}-- An empty table for solving multiple kicking problem

do
local function run(msg, matches)

  local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)]['settings']['lock_join'] then
    if data[tostring(msg.to.id)]['settings']['lock_join'] == 'yes' then
      if antiarabic[msg.from.id] == true then 
        delete_msg(msg.id, ok_cb, true)
        return
      end
      send_large_msg("chat#id".. msg.to.id , "")
      local name = user_print_name(msg.from)
  --    savelog(msg.to.id, name.." ["..msg.from.id.."] kicked (arabic was locked) ")
      delete_msg(msg.id, ok_cb, true)
		  antiarabic[msg.from.id] = true
      return
    end
  end
  return
end
local function cron()
  antiarabic = {} -- Clear antiarabic table 
end
return {
  patterns = {
   "([\216-\219][\128-\191])"
    },
  run = run,
	cron = cron
}

end
