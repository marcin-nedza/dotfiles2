local setup,comment=pcall(require,"Comment")
if not setup then
    return
end

comment.setup({
  toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
})
