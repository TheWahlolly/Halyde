function table.find(table, item)
  for k, v in pairs(table) do
    if v == item then
      return(v)
    end
  end
end

function table.copy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[table.copy(orig_key)] = table.copy(orig_value)
    end
    setmetatable(copy, table.copy(getmetatable(orig)))
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end
