local statusbar = require("lualine.component"):extend()
local entered = false
local lastRun = os.time()
local timeout = 900
local wakatime = ""

statusbar.init = function(self, options)
  statusbar.super.init(self,options)
end
function getWakatimeStatus()
  if entered == false or os.time() > lastRun + timeout then
    local openPop = assert(io.popen('~/.wakatime/wakatime-cli --today','r'))
    wakatime = openPop:read('*all')
    openPop:close()
    lastRun = os.time()
    entered = true
  end
  return string.sub(wakatime,0,string.len(wakatime)-1)
end

statusbar.update_status = function(self)
  return "🕒 "..os.date(self.options.format or "%H:%M:%S",os.time()).." 📅 "..os.date(self.options.format or "%d/%m/%Y",os.time()).." 📟 "..getWakatimeStatus()
end

return statusbar
