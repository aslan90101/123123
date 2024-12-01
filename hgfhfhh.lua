-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CheatMenu"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Create main frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 200, 0, 300)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.ZIndex = 999999
MainFrame.Parent = ScreenGui

-- Create rainbow frame
local RainbowFrame = Instance.new("Frame")
RainbowFrame.Name = "RainbowFrame"
RainbowFrame.Size = UDim2.new(1, 0, 0, 5)
RainbowFrame.Position = UDim2.new(0, 0, 0, 0)
RainbowFrame.BorderSizePixel = 0
RainbowFrame.ZIndex = 999999
RainbowFrame.Parent = MainFrame

-- Create title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "Cheat Menu"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.ZIndex = 999999
Title.Parent = MainFrame

-- Create InfiniteJump checkbox
local InfiniteJumpCheckbox = Instance.new("TextButton")
InfiniteJumpCheckbox.Name = "InfiniteJumpCheckbox"
InfiniteJumpCheckbox.Size = UDim2.new(0, 20, 0, 20)
InfiniteJumpCheckbox.Position = UDim2.new(0.1, 0, 0.3, 0)
InfiniteJumpCheckbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfiniteJumpCheckbox.Text = ""
InfiniteJumpCheckbox.ZIndex = 999999
InfiniteJumpCheckbox.Parent = MainFrame

local InfiniteJumpLabel = Instance.new("TextLabel")
InfiniteJumpLabel.Size = UDim2.new(0, 150, 0, 20)
InfiniteJumpLabel.Position = UDim2.new(0.25, 0, 0.3, 0)
InfiniteJumpLabel.BackgroundTransparency = 1
InfiniteJumpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteJumpLabel.Text = "Infinite Jump"
InfiniteJumpLabel.TextXAlignment = Enum.TextXAlignment.Left
InfiniteJumpLabel.ZIndex = 999999
InfiniteJumpLabel.Parent = MainFrame

-- Create Teleport checkbox
local TeleportCheckbox = Instance.new("TextButton")
TeleportCheckbox.Name = "TeleportCheckbox"
TeleportCheckbox.Size = UDim2.new(0, 20, 0, 20)
TeleportCheckbox.Position = UDim2.new(0.1, 0, 0.45, 0)
TeleportCheckbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TeleportCheckbox.Text = ""
TeleportCheckbox.ZIndex = 999999
TeleportCheckbox.Parent = MainFrame

local TeleportLabel = Instance.new("TextLabel")
TeleportLabel.Size = UDim2.new(0, 150, 0, 20)
TeleportLabel.Position = UDim2.new(0.25, 0, 0.45, 0)
TeleportLabel.BackgroundTransparency = 1
TeleportLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportLabel.Text = "Teleport (Press Z)"
TeleportLabel.TextXAlignment = Enum.TextXAlignment.Left
TeleportLabel.ZIndex = 999999
TeleportLabel.Parent = MainFrame

-- Create Float Tool checkbox
local FloatToolCheckbox = Instance.new("TextButton")
FloatToolCheckbox.Name = "FloatToolCheckbox"
FloatToolCheckbox.Size = UDim2.new(0, 20, 0, 20)
FloatToolCheckbox.Position = UDim2.new(0.1, 0, 0.6, 0)
FloatToolCheckbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FloatToolCheckbox.Text = ""
FloatToolCheckbox.ZIndex = 999999
FloatToolCheckbox.Parent = MainFrame

local FloatToolLabel = Instance.new("TextLabel")
FloatToolLabel.Size = UDim2.new(0, 150, 0, 20)
FloatToolLabel.Position = UDim2.new(0.25, 0, 0.6, 0)
FloatToolLabel.BackgroundTransparency = 1
FloatToolLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatToolLabel.Text = "Float Tool (Press K)"
FloatToolLabel.TextXAlignment = Enum.TextXAlignment.Left
FloatToolLabel.ZIndex = 999999
FloatToolLabel.Parent = MainFrame

-- Rainbow effect
spawn(function()
    while wait() do
        for i = 0, 1, 0.01 do
            RainbowFrame.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
            wait(0.05)
        end
    end
end)

-- Toggle menu visibility with INSERT key
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Infinite Jump functionality
local infiniteJumpEnabled = false
InfiniteJumpCheckbox.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    InfiniteJumpCheckbox.BackgroundColor3 = infiniteJumpEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState('Jumping')
    end
end)

-- Teleport functionality
local teleportEnabled = false
TeleportCheckbox.MouseButton1Click:Connect(function()
    teleportEnabled = not teleportEnabled
    TeleportCheckbox.BackgroundColor3 = teleportEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Z and teleportEnabled then
        local mouse = game.Players.LocalPlayer:GetMouse()
        local character = game.Players.LocalPlayer.Character
        if character then
            character:MoveTo(mouse.Hit.Position)
        end
    end
end)

-- Float Tool functionality with K key binding
local floatToolEnabled = false
local floatingTool = nil
local isFloating = false

FloatToolCheckbox.MouseButton1Click:Connect(function()
    floatToolEnabled = not floatToolEnabled
    FloatToolCheckbox.BackgroundColor3 = floatToolEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.K and floatToolEnabled then
        local character = game.Players.LocalPlayer.Character
        if character then
            local tool = character:FindFirstChildOfClass("Tool")
            if tool then
                if not isFloating then
                    -- Make tool float
                    floatingTool = tool
                    local handle = tool:FindFirstChild("Handle")
                    if handle then
                        local bodyPosition = Instance.new("BodyPosition")
                        bodyPosition.Name = "FloatingPosition"
                        bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        bodyPosition.Position = handle.Position
                        bodyPosition.Parent = handle
                        isFloating = true
                    end
                else
                    -- Stop tool from floating
                    if floatingTool then
                        local handle = floatingTool:FindFirstChild("Handle")
                        if handle then
                            local bodyPosition = handle:FindFirstChild("FloatingPosition")
                            if bodyPosition then
                                bodyPosition:Destroy()
                            end
                        end
                        floatingTool = nil
                        isFloating = false
                    end
                end
            end
        end
    end
end)

-- Make the menu draggable
local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if dragging and dragInput then
        local delta = dragInput.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
