local function run(msg, matches)
 local text = matches[2]
 if matches[1]:lower() == "save plug" and is_sudo(msg) then
  return text
 else
  local file = io.open("./plugins/"..matches[1], "w")
  file:write(text)
  file:flush()
  file:close()
  return "Plugin Saved"
 end
end

return {
 description = "Simplest plugin ever!",
 usage = {
  "!echo [text] : return text",
  "!echo> [ext] [text] : save text to file",
 },
 patterns = {
  "^[!/][Ss]ae[Pp]lug ([^%s]+) (.*)$",
  "^[Ss]ave[Pp]lug ([^%s]+) (.*)$"
 },
 run = run
}