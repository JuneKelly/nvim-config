-- Snacks pickers over nvim-orgmode's public API (require("orgmode.api")).
local M = {}

local function headline_path(headline)
  local parts, h = {}, headline
  while h do
    table.insert(parts, 1, h.title)
    h = h.parent
  end
  return table.concat(parts, " / ")
end

local function basename(file)
  return vim.fn.fnamemodify(file.filename, ":t")
end

--- Is `headline` equal to `root` or nested anywhere below it?
local function within(headline, root)
  local h = headline
  while h do
    if h.file.filename == root.file.filename and h.position.start_line == root.position.start_line then
      return true
    end
    h = h.parent
  end
  return false
end

---@param include_files boolean add each file itself as a top-level destination
---@param exclude? OrgApiHeadline omit this headline and its subtree
---@return snacks.picker.finder.Item[] items, table dests  picker items and the API objects they refer to
--- (kept separately because snacks deep-copies items and the API objects contain cycles)
local function collect(include_files, exclude)
  local items, dests = {}, {}
  local function add(item, dest)
    table.insert(dests, dest)
    item.dest_idx, item.text = #dests, item.label
    table.insert(items, item)
  end
  for _, file in ipairs(require("orgmode.api").load()) do
    if not file.is_archive_file then
      local name = basename(file)
      if include_files then
        add({ label = name, file = file.filename }, file)
      end
      for _, headline in ipairs(file.headlines) do
        if not headline.is_archived and not (exclude and within(headline, exclude)) then
          add({
            label = name .. " / " .. headline_path(headline),
            file = file.filename,
            pos = { headline.position.start_line, 0 },
          }, headline)
        end
      end
    end
  end
  return items, dests
end

local function format(item)
  return { { item.label } }
end

--- Refile the headline under the cursor (or the capture buffer) to a picked file/headline.
function M.refile()
  local api = require("orgmode.api")
  local source = api.current():get_closest_headline()
  if not source then
    vim.notify("No headline under cursor", vim.log.levels.WARN)
    return
  end
  local items, dests = collect(true, source)
  Snacks.picker({
    title = "Refile: " .. source.title,
    items = items,
    format = format,
    preview = "file",
    confirm = function(picker, item)
      picker:close()
      if item then
        api.refile({ source = source, destination = dests[item.dest_idx] }):catch(function(err)
          vim.notify("Org refile failed: " .. tostring(err), vim.log.levels.ERROR)
        end)
      end
    end,
  })
end

--- Jump to any headline across the agenda files.
function M.headlines()
  Snacks.picker({
    title = "Org headlines",
    items = (collect(false)),
    format = format,
    preview = "file",
  })
end

return M
