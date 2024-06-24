local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    print("Gitsigns could not be loaded")
    return
end

gitsigns.setup{}
