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
    return r = http.get(mountUrl(user,repo,fileCp)) 
end
function writeFileContent(user,repo,fileCp,file)
    r = getFileContent(user,repo,fileCp)
    local f = fs.open(shell.resolve( file ), "w" ) 
    f.write( r.readAll() ) 
end
getData()
writeFileContent(user,repo,fileCp,file)
write("Want to Continue? (Y/N)")
sameRepository = io.read()
if(wantToContinue == 'Y') then
    while(sameRepository == 'Y') do
        getFileContent(user,repo,fileCp)
        write("Want to stay in the same repository? (Y/N)")
        sameRepository = io.read()
        if(sameRepository == 'Y') then
            getFileData()
            generateFile(user,repo,fileCp,file)
        end
    end
end


f.close() 
r.close()
