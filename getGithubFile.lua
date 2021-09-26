sameRepository = 'Y'
wantToContinue = 'N'
repo = ''
file = ''
urlBase = "https://raw.githubusercontent.com/"
function getData()
    write("Github user:")
    user = io.read()
    write("Repository name:")
    repo = io.read()
    getFileData()
end
function getFileData()
    write("Github file:")
    fileCp = io.read()
    write("Filename:")
    file = io.read()
end
function mountUrl(user,repo,fileCp)
    partialUrl = urlBase..user.."/"..repo.."/main/"
    fullUrl = partialUrl..fileCp
    return fullUrl
end
function getFileContent(user,repo,fileCp)
    local r = http.get(mountUrl(user,repo,fileCp))
    return r
end
function writeFileContent(user,repo,fileCp,file)
    local r = getFileContent(user,repo,fileCp)
    local f = fs.open(shell.resolve( file ), "w" ) 
    f.write( r.readAll() ) 
end
getData()
writeFileContent(user,repo,fileCp,file)
write("Want to Continue? (Y/N)")
wantToContinue = io.read()
if(wantToContinue == 'Y') then
    while(sameRepository == 'Y') do
        getFileContent(user,repo,fileCp)
        write("Want to stay in the same repository? (Y/N)")
        sameRepository = io.read()
        if(sameRepository == 'Y') then
            getFileData()
            writeFileContent(user,repo,fileCp,file)
        end
    end
end
 
 
f.close() 
r.close()