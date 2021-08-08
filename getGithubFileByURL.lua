write("Write full URL:")
fullUrl = io.read()
write("Filename:")
file = io.read()
local r = http.get(fullUrl); 
local f = fs.open(shell.resolve( file ), "w" ); 
f.write( r.readAll() ); 
f.close(); 
r.close()
