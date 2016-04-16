do

function run(msg, matches)
  local answers = {}
  return answers[math.random(#answers)]
end

return {
  description = "Sexy",
  usage = "Sexy",
  patterns = {"^[Ss]ex[Ss]tory"},
  run = run
}

end
