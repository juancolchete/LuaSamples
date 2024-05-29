local statusbar = require("lualine.component"):extend()

statusbar.init = function(self, options)
  statusbar.super.init(self,options)
end

statusbar.update_status = function(self)
  return "🕒 "..os.date(self.options.format or "%H:%M:%S",os.time()).." 📅 "..os.date(self.options.format or "%d/%m/%Y",os.time())
end

return statusbar
