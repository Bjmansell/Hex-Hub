local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Pick your Theme", colors)

local YesTab = Window:NewTab("Themes")

local YesSection = YesTab:NewSection("Pick Your Theme")

YesSection:NewButton("Dark Theme", "Select this theme", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Hex%20Hub%20Versions/DarkTheme.lua'))()
end)

YesSection:NewButton("Blood Theme", "Select This theme", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Hex%20Hub%20Versions/Blood%20Theme.lua'))()
end)

YesSection:NewButton("Default", "Select This theme", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Hex%20Hub%20Versions/Default.lua'))()
end)

YesSection:NewButton("Midnight", "Select This theme", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Hex%20Hub%20Versions/Midnight.lua'))()
end)

YesSection:NewButton("Grape", "Select This theme", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Hex%20Hub%20Versions/GrapeTheme.lua'))()
end)

YesSection:NewButton("Ocean", "Select This theme", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Hex%20Hub%20Versions/Ocean.lua'))()
end)

YesSection:NewButton("Sentinel", "Select This theme", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Hex%20Hub%20Versions/Sentinel.lua'))()
end)