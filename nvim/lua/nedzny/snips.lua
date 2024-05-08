local ls =require("luasnip")
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
    [[local {} = require "{}"]],
    {
        f(function(import_name)
            return import_name[1]
        end,{1}),i(1)
    }
    --local sdsd = require "sdsd"
    )
    ),
},{
    key="lua"
})
