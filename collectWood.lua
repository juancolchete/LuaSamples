print(shell.run("getFacing"))
local h = fs.open("facing", "r")
print(h.readAll())
h.close()