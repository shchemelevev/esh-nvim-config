local M = {}


local ex1 = {}
ex1["buf_line"] = ' File "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/accounts/actor.py", line 78, in unpack_message_with_meta_info'
ex1['file'] = "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/accounts/actor.py"
ex1['file_line_number'] = 78
local ex2 = {}
ex2['buf_line'] = "DEBUG    accounts.actor:actor.py:76 [DEV] parsing msg b'\xcf\xed\x99\x94\xb4s\xb4\x03[\xc0\x93\xacstorefront_1\x92\xa6prod_1\x01\x91\x92\xa5cur_1\x05'"
ex2['file'] = "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/accounts/actor.py"
ex2['file_line_number'] = 76
local ex3 = {}

ex3["buf_line"] = "ERROR    accord_handlers_protobuf.logging_policy:logging_policy.py:240  failed to send response; internal error"
ex3['file'] = "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/accord_handlers_protobuf/logging_policy.py"
ex3["file_line_number"] = 240

local test_examples = {ex1, ex2, ex3}

local function case1_parser(line)
  local filename_pattern = '.*File ".*%.py", line '
  local sloc, eloc = string.find(line, filename_pattern)
  local line_number_pattern = 'py", line %d+, '
  local sloc2, eloc2 = string.find(line, line_number_pattern)
  local result = {}
  if sloc and eloc and sloc2 and eloc2 then
    -- print("name location " .. sloc .. " " .. eloc2)
    -- print("line location " .. sloc2 .. " " .. eloc2)
    local line_num = tonumber(string.sub(line, sloc2+10, eloc2-2))
    -- print("line_number " .. line_num)
    local s1, e1 = string.find(line, '.*File "')
    -- print("s1 " .. s1 .. " e1 " .. e1)
    local file = string.sub(line, e1+1, eloc-8)
    -- print("file: " .. file)
    result['file'] = file
    result['file_line_number'] = line_num
    -- print("return result")
    return result
  end
  return nil
end


local function case2_parser(line, workspace)
  -- print("case2parser")
  local filename_pattern = '%w+[ ]+[a-zA-Z0-9_.]+:[a-zA-Z0-9_]+%.py:%d+'
  local sloc, eloc = string.find(line, filename_pattern)
  result = {}
  if sloc and eloc then
    local only_filename_part = string.sub(line, sloc, eloc)
    -- print('only' .. only_filename_part)
    local s1, e1 = string.find(only_filename_part, '%w+[ ]+')
    -- print("s1 " .. s1 .. "e1 " ..e1)
    local s2, e2 = string.find(only_filename_part, ":[a-zA-Z0-9_]+%.py:%d+")
    -- print("s2 " .. s2 .. "e2 " ..e2)
    local filename = string.sub(only_filename_part, e1+1, s2-1)
    filename = string.gsub(filename, ':', '/')
    filename = string.gsub(filename, '%.', '/')
    filename = workspace .. filename .. ".py"
    -- print('filename ' .. filename)
    local s3, e3 = string.find(only_filename_part, ":%d+")
    local linenum = string.sub(only_filename_part, s3+1, e3)
    -- print("linenum; " .. linenum)
    result['file'] =  filename
    result['file_line_number'] = tonumber(linenum)
    return result
  end
  return nil
end

local parse_str = function (line, workspace)
  local result = {}
  -- case 1
  local c1 = case1_parser(line)
  local c2 = case2_parser(line, workspace)
  -- print(c2)
  if c1 then
    -- print("return c1")
    return c1
  elseif c2 then
    -- print("return c2")
    return c2
  end
end

M.run = function ()
  local line = vim.api.nvim_get_current_line()
  local workspace = vim.fn.getcwd()
  workspace = workspace .. '/'
  local data = parse_str(line, workspace)
  local range = {
    start= {line=data['file_line_number']-1, character=0},
  }

  range["end"] = {line=data['file_line_number']+1, character=0}
  local location = "file://" .. data['file']

  vim.cmd(vim.api.nvim_replace_termcodes('normal <C-k>', true, true, true))
  vim.cmd(vim.api.nvim_replace_termcodes('normal <C-l>', true, true, true))
  vim.lsp.util.jump_to_location({uri=location, range=range }, "utf-8")
  vim.cmd(vim.api.nvim_replace_termcodes('normal zz>', true, true, true))
end

-- for key, value in pairs(test_examples) do
--   print("test:")
--   local workspace = "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/"
--   local result = parse_str(value['buf_line'], workspace)
--   if result and value["file"] == result['file'] and value['file_line_number'] == result['file_line_number'] then
--     print("success")
--   else
--     print(value["file"])
--     print(result["file"])
--     print(value["file_line_number"])
--     print(result["file_line_number"])
--     print("failure")
--   end
-- end

return M

