local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- กำหนดการตั้งค่าของหน้าต่าง UI
_G.WindowConfig = {
    Title = "[⭐️] BloxFruit | Multi Features",
    SubTitle = "By CHXO",
    TabWidth = 160,
    Size = UDim2.fromOffset(450, 400),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
}

local Window = Fluent:CreateWindow(_G.WindowConfig)
local Tabs = {
    Main = Window:AddTab({ Title = "General", Icon = "sword" })
}

-- ตัวแปรควบคุมสถานะ
getgenv().AutoFarm = false
getgenv().FastAttackEnabled = false
getgenv().BringMob = false
getgenv().AUTOHAKI = false
getgenv().UpMelee = false

-- ฟังก์ชัน AutoFarm
local function AutoFarmLogic()
    spawn(function()
        while wait(0.1) do
            pcall(function()
                if getgenv().AutoFarm then
                    local questData = CheckQuest()
                    local UIQ = Player.PlayerGui.Main.Quest
                    ClearQ()
                    if questData then
                        if not UIQ.Visible or UIQ.Visible == false then
                            -- ไปที่จุดเริ่มเควส
                            TW(questData.CFrameQ)
                            if (questData.CFrameQ.Position - Char.HumanoidRootPart.Position).Magnitude <= 15 then
                                wait(0.1)
                                GetQuests(questData.NameQ, questData.NumQ)
                            end
                        else
                            -- ฟาร์มมอนสเตอร์
                            local enemy = game:GetService("Workspace").Enemies:FindFirstChild(questData.Mon)
                            if enemy then
                                repeat
                                    if enemy and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                                        TW(enemy:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0))
                                    else
                                        Char.HumanoidRootPart.CFrame = questData.CFrameMon * CFrame.new(0, 30, 0)
                                    end
                                    wait()
                                    enemy = game:GetService("Workspace").Enemies:FindFirstChild(questData.Mon)
                                until not getgenv().AutoFarm or not UIQ.Visible
                            else
                                Char.HumanoidRootPart.CFrame = questData.CFrameMon * CFrame.new(0, 30, 0)
                            end
                        end
                    end
                end
            end)
        end
    end)
end


local Player = game.Players.LocalPlayer
local CombatFramework = getupvalues(require(Player.PlayerScripts.CombatFramework))
local CombatController = CombatFramework[2]

-- ฟังก์ชันสำหรับค้นหาอาวุธปัจจุบัน
local function GetCurrentBlade()
    local controller = CombatController.activeController
    local blade = controller.blades[1]
    if not blade then return end
    while blade.Parent ~= Player.Character do
        blade = blade.Parent
    end
    return blade
end

-- ฟังก์ชันสำหรับโจมตีไม่มีคูลดาวน์
local function AttackNoCD()
    local controller = CombatController.activeController
    for _ = 1, 1 do
        local hits = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            Player.Character,
            {Player.Character.HumanoidRootPart},
            60
        )
        local hitTargets = {}
        local processedTargets = {}

        for _, hit in pairs(hits) do
            if hit.Parent:FindFirstChild("HumanoidRootPart") and not processedTargets[hit.Parent] then
                table.insert(hitTargets, hit.Parent.HumanoidRootPart)
                processedTargets[hit.Parent] = true
            end
        end

        if #hitTargets > 0 then
            local u8 = debug.getupvalue(controller.attack, 5)
            local u9 = debug.getupvalue(controller.attack, 6)
            local u7 = debug.getupvalue(controller.attack, 4)
            local u10 = debug.getupvalue(controller.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405

            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()

            u10 = u10 + 1
            debug.setupvalue(controller.attack, 5, u8)
            debug.setupvalue(controller.attack, 6, u9)
            debug.setupvalue(controller.attack, 4, u7)
            debug.setupvalue(controller.attack, 7, u10)

            pcall(function()
                if Player.Character:FindFirstChildOfClass("Tool") and controller.blades and controller.blades[1] then
                    controller.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(GetCurrentBlade()))
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", hitTargets, 1, "")
                end
            end)
        end
    end
end


-- ฟังก์ชัน FastAttack
local function FastAttackLogic()
    spawn(function()
        while wait(0.1) do
            if getgenv().FastAttackEnabled then
                pcall(function()
                    AttackNoCD()
                end)
            end
        end
    end)
end

-- ฟังก์ชัน BringMob
local function BringMobLogic()
    spawn(function()
        while wait() do
            if getgenv().BringMob then
                pcall(function()
                    local questData = CheckQuest()
                    if questData and questData.Mon then
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == questData.Mon and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                                -- ปรับค่ามอนสเตอร์
                                v.HumanoidRootPart.CFrame = questData.CFrameMon
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.HumanoidRootPart.Transparency = 1
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Humanoid.JumpPower = 0
                                if sethiddenproperty then
                                    pcall(function()
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    end)
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end

-- ฟังก์ชัน AutoHaki
local function AutoHakiLogic()
    spawn(function()
        while wait(0.1) do
            if getgenv().AUTOHAKI then
                pcall(function()
                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                        local args = {
                            [1] = "Buso"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end)
            end
        end
    end)
end

-- ฟังก์ชัน UpMelee
local function UpMeleeLogic()
    spawn(function()
        while wait() do
            if getgenv().UpMelee then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "AddPoint",
                        "Melee",
                        1
                    )
                end)
            end
        end
    end)
end

-- UI Toggles
Tabs.Main:AddToggle("AutoFarmToggle", {
    Title = "Auto Farm",
    Default = false,
    Callback = function(enabled)
        getgenv().AutoFarm = enabled
        if enabled then
            AutoFarmLogic()
        end
    end
})

Tabs.Main:AddToggle("FastAttackToggle", {
    Title = "Fast Attack",
    Default = false,
    Callback = function(enabled)
        getgenv().FastAttackEnabled = enabled
        if enabled then
            FastAttackLogic()
        end
    end
})

Tabs.Main:AddToggle("BringMobToggle", {
    Title = "Bring Mob",
    Default = false,
    Callback = function(enabled)
        getgenv().BringMob = enabled
        if enabled then
            BringMobLogic()
        end
    end
})

Tabs.Main:AddToggle("AutoHakiToggle", {
    Title = "Auto Haki",
    Default = false,
    Callback = function(enabled)
        getgenv().AUTOHAKI = enabled
        if enabled then
            AutoHakiLogic()
        end
    end
})

Tabs.Main:AddToggle("UpMeleeToggle", {
    Title = "Up Melee",
    Default = false,
    Callback = function(enabled)
        getgenv().UpMelee = enabled
        if enabled then
            UpMeleeLogic()
        end
    end
})

Window:SelectTab(1)
