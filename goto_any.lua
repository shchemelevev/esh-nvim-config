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

local ex4 = {}
ex4["buf_line"] = "accounts/components/inventory/__init__.py:15: in <module>"
ex4['file'] = "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/accounts/components/inventory/__init__.py"
ex4["file_line_number"] = 15


local ex5 = {}
ex5["buf_line"] = "accord_handlers_protobuf/logging_policy.py:176: AttributeError"
ex5['file'] = "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/accord_handlers_protobuf/logging_policy.py"
ex5["file_line_number"] = 176

local ex6 = {}
ex6["buf_line"] = "ERROR    accord_handlers_protobuf.logging_policy:logging_policy.py:149 source: (/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/accounts/components/matchmaker.py:176):"
ex6['file'] = "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/accounts/components/matchmaker.py"
ex6["file_line_number"] = 176

local ex7 = {}
ex7["buf_line"] = '  File "/usr/local/Cellar/python@3.11/3.11.4_1/Frameworks/Python.framework/Versions/3.11/lib/python3.11/asyncio/events.py", line 80'
ex7['file'] = "/usr/local/Cellar/python@3.11/3.11.4_1/Frameworks/Python.framework/Versions/3.11/lib/python3.11/asyncio/events.py"
ex7["file_line_number"] = 80

local ex8 = {}
ex8["buf_line"] = ' /Users/e_shchemelev/develop/accord/py-accord-handlers/.tox/py38/lib/python3.8/site-packages/asynctest/case.py:414: DeprecationWarning: "@coroutine" decorator is deprecated since Python'
ex8['file'] = "/Users/e_shchemelev/develop/accord/py-accord-handlers/.tox/py38/lib/python3.8/site-packages/asynctest/case.py"
ex8["file_line_number"] = 414

local ex9 = {}
ex9['buf_line'] = 'E     File "/Users/e_shchemelev/Perforce/e_shchemelev_CY1-AL-012_ACCORD-2673_nprs_db_logs_7494/game/hammer/res/scripts/base/account_helpers/receipt_log_db_writer.py", line 176'
ex9['file'] = '/Users/e_shchemelev/Perforce/e_shchemelev_CY1-AL-012_ACCORD-2673_nprs_db_logs_7494/game/hammer/res/scripts/base/account_helpers/receipt_log_db_writer.py'
ex9['file_line_number'] = 176

local ex10 = {}
ex10['buf_line'] = 'groups/actor.py                      71     22    69%   76, 80-89, 95-97, 100-108, 131-133, 137-139'
ex10['file'] = 'groups/actor.py                      71     22    69%   76, 80-89, 95-97, 100-108, 131-133, 137-139'
ex10['file_line_number'] = 1

local ex11 = {}
ex11["buf_line"] = "accord_handlers/custom_types.py:5:1: F401 'typing.Dict' imported but unused"
ex11['file'] = "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/accord_handlers/custom_types.py"
ex11['file_line_number'] = 5

-- local test_examples = {ex1, ex2, ex3, ex4, ex5, ex6, ex7, ex8, ex10}
local test_examples = {ex11}

local function case4_parser(line, workspace)
  -- print('case4')
  local sloc, eloc = string.find(line, "source: %(.*%.py:%d+%)")
  if sloc and eloc then
    local subline = string.sub(line, sloc, eloc)
    local sloc2, eloc2 = string.find(subline, ":%d+%)")
    result = {}
    result['file'] = string.sub(subline, 10, sloc2-1)
    result['file_line_number'] = tonumber(string.sub(subline, sloc2+1, eloc2-1))
    -- print("sloc "..sloc.."eloc "..eloc)
    -- print(result['file'])
    -- print(result['file_line_number'])
    -- print(subline)
    return result
  end
end

local function case1_parser(line)
  local filename_pattern = '.*File ".*%.py", line '
  local sloc, eloc = string.find(line, filename_pattern)
  local line_number_pattern = 'py", line %d+'
  local sloc2, eloc2 = string.find(line, line_number_pattern)
  -- print(sloc2 .. eloc)
  local result = {}
  if sloc and eloc and sloc2 and eloc2 then
    -- print("name location " .. sloc .. " " .. eloc2)
    -- print("line location " .. sloc2 .. " " .. eloc2)
    local line_num = tonumber(string.sub(line, sloc2+10, eloc2))
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

local function case3_parser(line, workspace)
  local pattern = "[a-zA-z0-9%_%-%.%/]+%.py:%d+:.?"
  -- print("line: " .. line)
  local sloc, eloc = string.find(line, pattern)
  -- print("sloc "..sloc.." eloc "..eloc)
  if sloc and eloc then
    local sloc2, eloc2 = string.find(line, "py:%d+:")
    local found = string.sub(line, sloc2, eloc2)
    -- print("found: " .. found)
    -- print("sloc2 "..sloc2.." eloc2 "..eloc2)
    -- print("number: " .. string.sub(line, sloc2+3, eloc2-1))
    local number = tonumber(string.sub(line, sloc2+3, eloc2-1))
    local filename = string.sub(line, sloc, sloc2+1)
    -- print("first part: " .. string.sub(filename, 0, 1))
    if string.sub(filename, 0, 1) ~= '/' then
      filename = workspace .. filename
    end
    -- print("filename " .. filename .. "location " .. number)
    local result = {}
    result['file'] =  filename
    result['file_line_number'] = number
    return result
  end
  return nil
end

local parse_str = function (line, workspace)
  local result = {}
  -- case 1
  local c1 = case1_parser(line)
  local c2 = case2_parser(line, workspace)
  local c3 = case3_parser(line, workspace)
  local c4 = case4_parser(line, workspace)
  -- print(c2)
  if c4 then
    -- print("return c4")
    return c4
  elseif c2 then
    -- print("return c2")
    return c2
  elseif c3 then
    -- print("return c2")
    return c3
  elseif c1 then
    -- print("return c2")
    return c1
  end
end

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function get_workspaces(basedir)
  foo = {}
  local cmd = 'find "'..basedir..'" \\( -name ".git" -o -name ".tox" -o -name ".mypy_cache" -o -name "htmlcov" -o -name "__pycache__" -o -name "target"  \\) -prune -o -name "pyrightconfig.json" -print '
   local p = io.popen(cmd)

  
  print("test get workspaces")
  -- local p = io.popen('find "'..basedir..'" -type f')
  for filename in p:lines() do                         --Loop through all files
    table.insert(foo, filename)
  end
  return foo
end

M.run = function ()
  local line = vim.api.nvim_get_current_line()
  local workspace = vim.fn.getcwd()

  workspace = workspace .. '/'
  if vim.g.go_to_any_prefix then
    workspace = workspace .. vim.g.go_to_any_prefix  .. '/'
  end

  local data = parse_str(line, workspace)

  -- for workspace in get_workspaces(vim.fn.getcwd()) do
  --   local data = parse_str(line, workspace)
  --   if not data then
  --     local row = vim.api.nvim_win_get_cursor(0)[1]
  --     local lines = table.concat(vim.api.nvim_buf_get_lines(0, row-1, row+1, false))
  --     -- print(lines)
  --     data = parse_str(lines, workspace)
  --   end
  -- end

  -- print(data)
  if data then
    local range = {
      start= {line=data['file_line_number']-1, character=0},
    }

    range["end"] = {line=data['file_line_number']+1, character=0}

    if file_exists(data['file']) then
      local location = "file://" .. data['file']

      require("neotest").output_panel.close()
      vim.defer_fn(function()
        vim.cmd(vim.api.nvim_replace_termcodes('normal <C-w>h', true, true, true))
        vim.cmd(vim.api.nvim_replace_termcodes('normal <C-k>', true, true, true))
        vim.cmd(vim.api.nvim_replace_termcodes('normal <C-l>', true, true, true))
        vim.cmd(vim.api.nvim_replace_termcodes('normal zz', true, true, true))
        vim.lsp.util.jump_to_location({uri=location, range=range }, "utf-8")
        vim.defer_fn(function()
          vim.lsp.util.jump_to_location({uri=location, range=range }, "utf-8")
        end, 300)
      end, 300)
    else
      print("File "..data["file"].." not found in workspace")
    end

  else
    print("Location not found")
  end
end

M.select_workspace = function ()
  local Menu = require("nui.menu")
  local event = require("nui.utils.autocmd").event
  

  wp = get_workspaces(vim.fn.getcwd()) 
  lines_value = {}
  local cwd = vim.fn.getcwd()
  local pcwd = string.gsub(cwd, '-', '--')
  for i, workspace in ipairs(wp) do
    local wp_path = string.gsub(workspace, '/pyrightconfig.json', '')
    wp_path = string.gsub(wp_path, pcwd..'/', '')
    table.insert(lines_value, Menu.item(wp_path))
  end

  local menu = Menu({
    position = "50%",
    size = {
      width = 100,
      height = 5,
    },
    border = {
      style = "single",
      text = {
        top = "[Choose-an-Element]",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  }, {
    lines = lines_value,
    max_width = 20,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_close = function()
      print("Menu Closed!")
    end,
    on_submit = function(item)
      print("Menu Submitted: ", item.text)
      vim.g.go_to_any_prefix = item.text
    end,
  })
  
  -- mount the component
  menu:mount()
end

function test()
  local base_path = "/Users/e_shchemelev/develop/generic-meta-server/meta-server"
  wp = get_workspaces(base_path) 
  local cwd = string.gsub("/Users/e_shchemelev/develop/generic-meta-server/meta-server/", '-', '--')
  for i, workspace in ipairs(wp) do
    local wp_path = string.gsub(workspace, '/pyrightconfig.json', '')
    print(wp_path)

    local wp3 = string.gsub(wp_path, cwd, '')
    print(wp3)
  end
  -- for key, value in pairs(test_examples) do
  --   print("test:")
  --   local workspace = "/Users/e_shchemelev/develop/generic-meta-server/meta-server/accounts/"
  --   local result = parse_str(value['buf_line'], workspace)
  --   if result and value["file"] == result['file'] and value['file_line_number'] == result['file_line_number'] then
  --     print("success")
  --   else
  --     print("failure")
  --     if result then
  --       print('expected ' .. value["file"])
  --       print(result["file"])
  --       print('expected ' .. value["file_line_number"])
  --       print(result["file_line_number"])
  --     end
  --   end
  -- end
end

test()

return M

