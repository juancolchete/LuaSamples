local monitor = peripheral.find("monitor")
local i = 0
while (true) do  
  monitor.clear()
  monitor.setCursorPos(3,1)
  monitor.setTextScale(4
  )
  monitor.write("Feliz Aniversário!") 
  monitor.setCursorPos(7,2)
  sleep(1)
  monitor.write("SEBASTIAN")
  i = (i + 1) % 10 + 1
  print(i)
  monitor.setTextColour(i)
  sleep(2)
end
