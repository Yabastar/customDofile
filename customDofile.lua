function customDofile(filename)
    local file = oldfs.open(filename, "r")
    if not file then
        return error("File not found: " .. filename)
    end
 
    local content = file.readAll()
    file.close()
 
    local func, err = load(content, "=" .. filename, "t", _ENV)
    if not func then
        return error("Error loading file: " .. err)
    end
 
    return func()
end
