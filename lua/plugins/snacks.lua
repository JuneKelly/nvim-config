-- Projects added with :ProjectAdd, one directory per line.
local projects_file = vim.fn.stdpath("data") .. "/projects.txt"

local function read_projects()
  if vim.fn.filereadable(projects_file) == 0 then
    return {} -- no projects added yet
  end
  return vim.tbl_filter(function(line)
    return line ~= ""
  end, vim.fn.readfile(projects_file))
end

return {
  {
    "folke/snacks.nvim",
    init = function()
      vim.api.nvim_create_user_command("ProjectAdd", function(args)
        local dir = vim.fn.fnamemodify(vim.fn.expand(args.args ~= "" and args.args or vim.fn.getcwd()), ":p")
        dir = dir:gsub("/$", "")
        if vim.fn.isdirectory(dir) == 0 then
          vim.notify("Not a directory: " .. dir, vim.log.levels.ERROR)
          return
        end
        if vim.tbl_contains(read_projects(), dir) then
          vim.notify("Project already added: " .. dir)
          return
        end
        if vim.fn.writefile({ dir }, projects_file, "a") ~= 0 then
          vim.notify("Failed to write " .. projects_file, vim.log.levels.ERROR)
          return
        end
        vim.notify("Added project: " .. dir)
      end, { nargs = "?", complete = "dir", desc = "Add a directory to the projects picker" })
    end,
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
          projects = {
            -- re-read on every open so new projects show up without a restart
            config = function(opts)
              local projects = vim.deepcopy(opts.projects or {})
              for _, dir in ipairs(read_projects()) do
                if not vim.tbl_contains(projects, dir) then
                  table.insert(projects, dir)
                end
              end
              opts.projects = projects
            end,
          },
        },
      },
    },
  },
}
