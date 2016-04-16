do function run(msg, matches)

	  if matches[1]:lower() == 'wai' and is_sudo(msg) then
      return "You are SUDO"
      end
      if matches[1]:lower() == 'wai' and is_admin(msg) then
      return "You are Admin"
      end
      if matches[1]:lower() == 'wai' and is_owner(msg) then
      return "You are Group Leader"
      end
      if matches[1]:lower() == 'wai' and is_momod(msg) then
      return "You are Group Moderator"
      end
      if matches[1]:lower() == 'wai' then
      return "You are Group Member"
    end
      if matches[1]:lower() == 'ãŞÇã' and is_sudo(msg) then
      return "ÔãÇ ÓÇÒäÏå ÑÈÇÊ åÓÊíÏ"
      end
      if matches[1]:lower() == 'ãŞÇã' and is_admin(msg) then
      return "ÔãÇ ÇÏãíä ÑÈÇÊ åÓÊíÏ"
      end
      if matches[1]:lower() == 'ãŞÇã' and is_owner(msg) then
      return "ÔãÇ ãÏíÑ ÇÕáí Ñæå åÓÊíÏ"
      end
      if matches[1]:lower() == 'ãŞÇã' and is_momod(msg) then
      return "ÔãÇ ˜ã˜ ãÏíÑ åÓÊíÏ"
      end
      if matches[1]:lower() == 'ãŞÇã' then
      return "ÔãÇ ÚÖæ ÓÇÏå åÓÊíÏ"
    end
end
  return {
  description = "Your Postation In Group",
  usage = "Wai",
  patterns = {
  "^([Ww][Aa][Ii])$",
  "^(ãŞÇã)$"
    },
  run = run
}
end