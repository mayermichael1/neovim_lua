return {
    {'sainnhe/sonokai', 
        init = function()
            vim.g.sonokai_transparent_background = 0
            vim.g.sonokai_style = 'shusia'
            vim.g.sonokai_better_performance = 1;
            vim.g.sonokai_disable_italic_comment = 1;
        end
    },
    {'sainnhe/gruvbox-material', 
        init = function() 
            vim.g.gruvbox_material_foreground='material'
            vim.g.gruvbox_material_disable_italic_comment=1
        end
    },
    {'luisiacc/gruvbox-baby'},
}
