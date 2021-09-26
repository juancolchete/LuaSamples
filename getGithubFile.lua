sameRepository = 'N'
wantToContinue = 'N'
urlBase = ''
repo = ''
file = ''
function getData()
    urlBase = "https://raw.githubusercontent.com/"
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
end
function writeFileContent(file)
    local f = fs.open(shell.resolve( file ), "w" ) 
    f.write( r.readAll() ) 
end
function generateFile(user,repo,fileCp,file)
    getFileContent(user,repo,fileCp)
    writeFileContent(file)
end
getData()
generateFile(user,repo,fileCp,file)
write("Want to Continue? (Y/N)")
sameRepository = io.read()
if(wantToContinue == 'Y')
    while(sameRepository == 'Y')
        getFileContent(user,repo,fileCp)
        write("Want to stay in the same repository? (Y/N)")
        sameRepository = io.read()
        getFileData()
        generateFile(user,repo,fileCp,file)
    end
end


f.close() 
r.close()
