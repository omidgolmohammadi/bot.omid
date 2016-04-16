do

function run(msg, matches)
  return 'freeze bot '.. VERSION .. [[ 
sudo users: @heset_ni_zendgi 
          @Xx_admin_eblis_xX
  freeze bot v1 license.]]
end

return {
  description = "Shows bot version", 
  usage = "!version: Shows bot version",
  patterns = {
    "^!version$"
  }, 
  run = run 
}

end
