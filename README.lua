local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local Window = Library.CreateLib("ADVANCED IMPOSSIBLE EXCESS MAKE BY TAN", "Ocean")

-----------------------------------
-- FLY JUMP TAB
-----------------------------------
local flyTab = Window:NewTab("FLY JUMP")
local flySection = flyTab:NewSection("FLY / FLY JUMP")

-- Toggle: Infinite Jump
local connectionJump
local connectionState

flySection:NewToggle("FLY Jump", "Jump without limit", function(state)
    if state then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
        humanoid.JumpPower = 100
        humanoid.AutoRotate = true

        connectionJump = UserInputService.JumpRequest:Connect(function()
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)

        connectionState = RunService.RenderStepped:Connect(function()
            if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if connectionJump then connectionJump:Disconnect() end
        if connectionState then connectionState:Disconnect() end
    end
end)

-- Button: Enable Infinite Jump (อีกแบบ)
flySection:NewButton("INFINITE JUMP", "Enable infinite jump directly", function()
    local InfiniteJumpEnabled = true
    UserInputService.JumpRequest:Connect(function()
        if InfiniteJumpEnabled then
            player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

-----------------------------------
-- LOCAL PLAYER TAB
-----------------------------------
local playerTab = Window:NewTab("LOCAL PLAYER")
local speedSection = playerTab:NewSection("WALK SPEED")

-- Slider: WalkSpeed
speedSection:NewSlider("SET WALK SPEED (PC)", "Adjust WalkSpeed", 500, 16, function(s)
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = s
    end
end)

-- Toggle: Speed for Mobile
playerTab:NewSection("SPEED Mobile"):NewToggle("SET SPEED 100", "Speed toggle", function(state)
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = state and 100 or 16 end
end)

-- Jump Power
playerTab:NewSection("JUMP POWER (PC)"):NewSlider("SET JUMP POWER", "Adjust JumpPower", 500, 50, function(s)
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = s end
end)

-- Toggle: Jump Power Mobile
playerTab:NewSection("JUMP POWER (Mobile)"):NewToggle("SET JUMP POWER 250", "JumpPower toggle", function(state)
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = state and 250 or 50 end
end)

-- Fly Button (โหลดสคริปต์ภายนอก)
playerTab:NewSection("FLY PC/Mobile"):NewButton("FLY", "Enable Fly (external script)", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end)

-----------------------------------
-- ACCOUNT TAB
-----------------------------------
local accountSection = Window:NewTab("ACCOUNT"):NewSection("ACCOUNT INFO")

-- Print Account Age
accountSection:NewButton("PRINT ACCOUNT AGE (Press F9)", "Check console", function()
    print("YOUR ACCOUNT AGE: " .. player.AccountAge .. " DAY(S)")
end)

local playerTab = Window:NewTab("GAMEHUB")
local speedSection = playerTab:NewSection("GAMEHUB")

accountSection:NewButton("COME SOON", "W", function()
    print(COME SOON)
end)

