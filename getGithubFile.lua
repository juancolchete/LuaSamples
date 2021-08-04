urlBase = "https://raw.githubusercontent.com/"
write("Github user:")
user = io.read()
write("Repository name:")
repo = io.read()
write("Github file:")
fileCp = io.read()
write("Filename:")
file = io.read()
partialUrl = urlBase..user.."/"..repo
fullUrl = partialUrl.."/main/"..fileCp
local r = http.get(fullUrl); 
local f = fs.open(shell.resolve( file ), "w" ); 
f.write( r.readAll() ); 
f.close(); 
r.close()
