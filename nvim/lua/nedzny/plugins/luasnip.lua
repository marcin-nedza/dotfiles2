if not pcall(require, "luasnip") then
  return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config{
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}
local s =ls.snippet
local t= ls.text_node
local i= ls.insert_node
local f =ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets('go',{
 s("main", {
        t({"package main", "", "func main() {"}),
        t({"","\t"}),
        i(1, "// Your code here"),
        t({"", "}"}),
    }),
})

local same = function (index)
   return f(function (arg)
       return arg[1]
   end,{index}) 
end

ls.add_snippets("lua",{
    s("expand",{
        t("what is expanding")
    }),
    s("snipp",fmt([[example:{},function:{}]],{i(1),same(1)})),
    s("req2",
    fmt(
    [[local2 {} = require "{}"]],
    {
        f(function(import_name)
            local parts = vim.split(import_name[1][1], ".",{plain=true})
            return parts[#parts] or ""
        end,{1}),i(1)
    }
    )
    ),
},{
    key="lua"
})
