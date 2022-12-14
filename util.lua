local M = {}

M.dump = function(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. M.dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

M.read_file = function(path)
    local file = io.open(path, "rb")
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end

M.split_lines = function(s)
    if s:sub(-1)~="\n" then s=s.."\n" end
    local lines={}
    for line in s:gmatch("(.-)\n") do table.insert(lines, line) end
    return lines
end

M.rebuild_table_index = function(t)
    local new_table = {}
    local index = 1
    for _, v in pairs(t) do
        new_table[index] = v
        index = index + 1
    end
    return new_table
end

return M
