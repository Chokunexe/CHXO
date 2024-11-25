local Player = game:GetService("Players").LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()


_G.AutoFarm = true


local function GetQuests(N, NB)
    local args = {
        [1] = "StartQuest",
        [2] = N or "BanditQuest1",
        [3] = NB or 1
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))    
end

local function CheckQuest()
    local Lv = Player:FindFirstChild("Data") and Player.Data:FindFirstChild("Level")
    if Lv and Lv.Value then
        if Lv.Value >= 1 and Lv.Value <= 9 then
            return {
                ["Mon"] = 'Bandit',
                ["NumQ"] = 1,
                ["NameQ"] = 'BanditQuest1',
                ["CFrameQ"] = CFrame.new(1059.37195, 15.4495068, 1550.4231),
                ["CFrameMon"] = CFrame.new(1196.172, 11.8689699, 1616.95923)
            }
        elseif Lv.Value >= 10 and Lv.Value <= 29 then
            return {
                ["Mon"] = 'Monkey',
                ["NumQ"] = 1,
                ["NameQ"] = 'JungleQuest',
                ["CFrameQ"] = CFrame.new(-1598.08911, 35.5501175, 153.377838),
                ["CFrameMon"] = CFrame.new(-1619.10632, 21.7005882, 142.148117)
            }
        elseif Lv.Value >= 30 and Lv.Value <= 39 then
            return {
                ["Mon"] = 'Pirate',
                ["NumQ"] = 1,
                ["NameQ"] = 'BuggyQuest1',
                ["CFrameQ"] = CFrame.new(-1140.762939453125, 5.277381896972656, 3830.43017578125),
                ["CFrameMon"] = CFrame.new(-1180.4862060546875, 4.877380847930908, 3948.302978515625)
            }
        elseif Lv.Value >= 40 and Lv.Value <= 59 then
            return {
                ["Mon"] = 'Brute',
                ["NumQ"] = 2,
                ["NameQ"] = 'BuggyQuest1',
                ["CFrameQ"] = CFrame.new(-1140.762939453125, 5.277381896972656, 3830.43017578125),
                ["CFrameMon"] = CFrame.new(-1145.1796875, 14.935205459594727, 4315.4931640625)
            }
        elseif Lv.Value >= 60 and Lv.Value <= 74 then
            return {
                ["Mon"] = 'Desert Bandit',
                ["NumQ"] = 1,
                ["NameQ"] = 'DesertQuest',
                ["CFrameQ"] = CFrame.new(893.2763671875, 6.563793659210205, 4393.5732421875),
                ["CFrameMon"] = CFrame.new(922.5709228515625, 6.574110507965088, 4476.7412109375)
            }
        elseif Lv.Value >= 75 and Lv.Value <= 89 then
            return {
                ["Mon"] = 'Desert Officer',
                ["NumQ"] = 2,
                ["NameQ"] = 'DesertQuest',
                ["CFrameQ"] = CFrame.new(893.2763671875, 6.563793659210205, 4393.5732421875),
                ["CFrameMon"] = CFrame.new(1606.2596435546875, 1.7362850904464722, 4362.77783203125)
            }
        elseif Lv.Value >= 90 and Lv.Value <= 99 then
            return {
                ["Mon"] = 'Snow Bandit',
                ["NumQ"] = 1,
                ["NameQ"] = 'SnowQuest',
                ["CFrameQ"] = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685),
                ["CFrameMon"] = CFrame.new(1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388, 0.000432241941, 0.999844253, -0.0176417865, 0.969202161, -0.00476344163, -0.246220857)
            }
        elseif Lv.Value >= 100 and Lv.Value <= 119 then
            return {
                ["Mon"] = 'Snowman',
                ["NumQ"] = 2,
                ["NameQ"] = 'SnowQuest',
                ["CFrameQ"] = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685),
                ["CFrameMon"] = CFrame.new(1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925, 7.71531674e-08, 1, 6.08143536e-09, 0.162211925, -6.51427134e-09, -0.986755967)
            }
        elseif Lv.Value >= 120 and Lv.Value <= 149 then
            return {
                ["Mon"] = 'Chief Petty Officer',
                ["NumQ"] = 1,
                ["NameQ"] = 'MarineQuest2',
                ["CFrameQ"] = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                ["CFrameMon"] = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
            }
        elseif Lv.Value >= 150 and Lv.Value <= 174 then
            return {
                ["Mon"] = 'Sky Bandit',
                ["NumQ"] = 1,
                ["NameQ"] = 'SkyQuest',
                ["CFrameQ"] = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268),
                ["CFrameMon"] = CFrame.new(-4959.51367, 365.39267, -2974.56812, 0.964867651, 7.74418396e-08, 0.262737453, -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, 0.964867651)
            }
        elseif Lv.Value >= 175 and Lv.Value <= 189 then
            return {
                ["Mon"] = 'Dark Master',
                ["NumQ"] = 2,
                ["NameQ"] = 'SkyQuest',
                ["CFrameQ"] = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268),
                ["CFrameMon"] = CFrame.new(-5079.98096, 376.477356, -2194.17139, 0.465965867, -3.69776352e-08, 0.884802461, 3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, 0.465965867)
            }
        elseif Lv.Value >= 190 and Lv.Value <= 209 then
            return {
                ["Mon"] = 'Prisoner',
                ["NumQ"] = 1,
                ["NameQ"] = 'PrisonerQuest',
                ["CFrameQ"] = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712),
                ["CFrameMon"] = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
            }
        elseif Lv.Value >= 210 and Lv.Value <= 249 then
            return {
                ["Mon"] = 'Dangerous Prisoner',
                ["NumQ"] = 2,
                ["NameQ"] = 'PrisonerQuest',
                ["CFrameQ"] = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712),
                ["CFrameMon"] = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
            }
        elseif Lv.Value >= 250 and Lv.Value <= 274 then
            return {
                ["Mon"] = 'Toga Warrior',
                ["NumQ"] = 1,
                ["NameQ"] = 'ColosseumQuest',
                ["CFrameQ"] = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345),
                ["CFrameMon"] = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
            }
        elseif Lv.Value >= 275 and Lv.Value <= 324 then
            return {
                ["Mon"] = 'Gladiator',
                ["NumQ"] = 2,
                ["NameQ"] = 'ColosseumQuest',
                ["CFrameQ"] = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345),
                ["CFrameMon"] = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
            }
        elseif Lv.Value >= 325 and Lv.Value <= 374 then
            return {
                ["Mon"] = 'Military Soldier',
                ["NumQ"] = 1,
                ["NameQ"] = 'MagmaQuest',
                ["CFrameQ"] = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557),
                ["CFrameMon"] = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
            }
        elseif Lv.Value >= 375 and Lv.Value <= 399 then
            return {
                ["Mon"] = 'Military Spy',
                ["NumQ"] = 2,
                ["NameQ"] = 'MagmaQuest',
                ["CFrameQ"] = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557),
                ["CFrameMon"] = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
            }
        end
    end
    return nil
end

local function TW(...)
    local CFrame = {...}
    pcall(function()
        if not _G.StopTween and Char and Char:FindFirstChild("HumanoidRootPart") then
            local Distance = (CFrame[1].Position - Char.HumanoidRootPart.Position).Magnitude
            local speed = 127
            Tween = game:GetService("TweenService"):Create(Char.HumanoidRootPart, TweenInfo.new(Distance/speed, Enum.EasingStyle.Cubic), {CFrame = CFrame[1]})
            if _G.StopTween then 
                Tween:Cancel()
            elseif Char.Humanoid.Health > 0 then 
                Tween:Play() 
            end
            if not Char.HumanoidRootPart:FindFirstChild("OMG Hub") then
                local Noclip = Instance.new("BodyVelocity")
                Noclip.Name = "OMG Hub"
                Noclip.Parent = Char.HumanoidRootPart
                Noclip.MaxForce = Vector3.new(9e99, 9e99, 9e99)
                Noclip.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end)
end

local function ClearQ()
    local currentQuest = Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
    local questData = CheckQuest()
    if questData and not string.find(currentQuest, questData.Mon) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
end


_G.FastAttackEnabled = true -- ตั้งค่าเป็น true เพื่อเปิดใช้งาน

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

-- ทำงานเมื่อเปิดใช้งาน Fast Attack
spawn(function()
    while wait(0.1) do
        if _G.FastAttackEnabled then
            pcall(function()
                AttackNoCD()
            end)
        end
    end
end)


spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFarm then
                local UIQ = Player.PlayerGui.Main.Quest
                ClearQ()
                local questData = CheckQuest()
                if questData then
                    if not UIQ.Visible or UIQ.Visible == false then
                        TW(questData.CFrameQ)
                        if (questData.CFrameQ.Position - Char.HumanoidRootPart.Position).Magnitude <= 15 then
                            wait(.2)
                            GetQuests(questData.NameQ, questData.NumQ)
                        end
                    else
                        local enemy = game:GetService("Workspace").Enemies:FindFirstChild(questData.Mon)
                        if enemy then
                            repeat
                                if enemy and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                                    TW(enemy:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 30, 0))
                                else
                                    Char.HumanoidRootPart.CFrame = questData.CFrameMon * CFrame.new(0, 30, 0)
                                end
                                wait(1)
                                enemy = game:GetService("Workspace").Enemies:FindFirstChild(questData.Mon)
                            until not _G.AutoFarm or not UIQ.Visible
                        else
                            Char.HumanoidRootPart.CFrame = questData.CFrameMon * CFrame.new(0, 30, 0)
                        end
                    end
                end
            end
        end)
    end
end)


_G.AUTOHAKI = true
spawn(function()
    while wait(.1) do
        if _G.AUTOHAKI then 
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)


_G.BringMob = true
spawn(function()
    while wait(0.01) do
        if _G.BringMob then
            pcall(function()
                local questData = CheckQuest()
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    for x, y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == questData.Mon then
                            if y.Name == questData.Mon then
                                v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                y.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.HumanoidRootPart.Transparency = 1
                                v.HumanoidRootPart.CanCollide = false
                                y.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                y.Humanoid.WalkSpeed = 0
                                v.Humanoid.JumpPower = 0
                                y.Humanoid.JumpPower = 0
                                if sethiddenproperty then
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

_G.UpMelee = true

task.spawn(function()
    while wait() do
        pcall(function()
            if _G.UpMelee then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                    "AddPoint",
                    "Melee",
                    1
                )
            end
        end)
    end
end) 


