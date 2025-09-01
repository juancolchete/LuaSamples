local filePath = "sendFileHTTP.lua"
local url = "https://webhook.site/f0b8bcdd-10a4-44cd-aa9f-21c45f321114"

local file = fs.open(filePath, "rb")
if not file then
  print("error reading file "..filePath)
end

local fileContent = file.readAll()
file.close()
local headers = { ["Content-Type"] = "application/octet-stream"}

local response = http.post(url, fileContent,headers)
