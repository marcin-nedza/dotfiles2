local ls =require("luasnip")
local s =ls.snippet
local t= ls.text_node
local i= ls.insert_node

ls.add_snippets('go',{
 s("main", {
        t({"package main", "", "func main() {"}),
        t({"","\t"}),
        i(1, "// Your code here"),
        t({"", "}"}),
    }),
})
