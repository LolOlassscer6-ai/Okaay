-- Настройки
local module_url = "https://raw.githubusercontent.com"

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local LoadButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Родитель GUI (используем CoreGui для инжекторов или PlayerGui для Studio Lite)
ScreenGui.Parent = (game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "MobileLoader"

-- Главное окно
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
MainFrame.Size = UDim2.new(0, 200, 0, 100)
MainFrame.Active = true
MainFrame.Draggable = true -- В Delta может работать по-разному

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

-- Заголовок
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Require Loader"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold

-- Кнопка загрузки
LoadButton.Parent = MainFrame
LoadButton.Position = UDim2.new(0.1, 0, 0.4, 0)
LoadButton.Size = UDim2.new(0.8, 0, 0.4, 0)
LoadButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
LoadButton.Text = "ЗАГРУЗИТЬ"
LoadButton.TextColor3 = Color3.new(1, 1, 1)
LoadButton.Font = Enum.Font.Gotham

Instance.new("UICorner", LoadButton).CornerRadius = UDim.new(0, 8)

-- Логика загрузки (нажатие)
LoadButton.MouseButton1Click:Connect(function()
    LoadButton.Text = "Загрузка..."
    local success, err = pcall(function()
        loadstring(game:HttpGet(module_url))()
    end)
    
    if success then
        LoadButton.Text = "Готово!"
        wait(2)
        ScreenGui:Destroy()
    else
        LoadButton.Text = "Ошибка!"
        warn("Ошибка загрузки: " .. tostring(err))
    end
end)
