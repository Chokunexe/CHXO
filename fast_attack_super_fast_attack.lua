getgenv().FastAttack = value
        
local plr = game.Players.LocalPlayer

local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end
function AttackNoCD() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end                  
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end
local cac
if SuperFastMode then 
	cac=task.wait
else
	cac=wait
end
while cac() do 
	AttackNoCD()
end

-----------

local SuperFastMode = value -- เปลี่ยนเป็นจริงถ้าคุณต้องการโจมตี Super Super Super Fast (เช่นการฆ่าทันที) แต่จะทำให้เกมเตะคุณมากกว่าโหมดปกติ
             _G.FastAttack = value

local plr = game.Players.LocalPlayer

local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end
function AttackNoCD() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end                  
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end
local cac
if SuperFastMode then 
	cac=task.wait
else
	cac=wait
end
while cac() do 
	AttackNoCD()
end

    end) 
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttack then
            if typeof(y) == "table" then
                pcall(function()
                    CameraShaker:Stop()
                    y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
                    y.activeController.timeToNextAttack = 0
                    y.activeController.hitboxMagnitude = 60
                    y.activeController.active = false
                    y.activeController.timeToNextBlock = 0
                    y.activeController.focusStart = 1655503339.0980349
                    y.activeController.increment = 1
                    y.activeController.blocking = false
                    y.activeController.attacking = false
                    y.activeController.humanoid.AutoRotate = true
                end)
            end
        end
    end)
end)

---------

_G.Fast_Attack = true

    spawn(function()
        while task.wait(0.1) do
            if _G.Fast_Attack then
                pcall(function()
                    local plr = game.Players.LocalPlayer

                    local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
                    local CbFw2 = CbFw[2]
                    
                    function GetCurrentBlade() 
                        local p13 = CbFw2.activeController
                        local ret = p13.blades[1]
                        if not ret then return end
                        while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
                        return ret
                    end
                    function AttackNoCD() 
                        local AC = CbFw2.activeController
                        for i = 1, 1 do 
                            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                                plr.Character,
                                {plr.Character.HumanoidRootPart},
                                60
                            )
                            local cac = {}
                            local hash = {}
                            for k, v in pairs(bladehit) do
                                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                                    table.insert(cac, v.Parent.HumanoidRootPart)
                                    hash[v.Parent] = true
                                end
                            end
                            bladehit = cac
                            if #bladehit > 0 then
                                local u8 = debug.getupvalue(AC.attack, 5)
                                local u9 = debug.getupvalue(AC.attack, 6)
                                local u7 = debug.getupvalue(AC.attack, 4)
                                local u10 = debug.getupvalue(AC.attack, 7)
                                local u12 = (u8 * 798405 + u7 * 727595) % u9
                                local u13 = u7 * 798405
                                (function()
                                    u12 = (u12 * u9 + u13) % 1099511627776
                                    u8 = math.floor(u12 / u9)
                                    u7 = u12 - u8 * u9
                                end)()
                                u10 = u10 + 1
                                debug.setupvalue(AC.attack, 5, u8)
                                debug.setupvalue(AC.attack, 6, u9)
                                debug.setupvalue(AC.attack, 4, u7)
                                debug.setupvalue(AC.attack, 7, u10)
                                pcall(function()
                                    for k, v in pairs(AC.animator.anims.basic) do
                                        v:Play()
                                    end                  
                                end)
                                if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
                                end
                            end
                        end
                    end
                    function AttackNoCD2() 
                        local AC = CbFw2.activeController
                        for i = 1, 1 do 
                            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                                plr.Character,
                                {plr.Character.HumanoidRootPart},
                                60
                            )
                            local cac = {}
                            local hash = {}
                            for k, v in pairs(bladehit) do
                                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                                    table.insert(cac, v.Parent.HumanoidRootPart)
                                    hash[v.Parent] = true
                                end
                            end
                            bladehit = cac
                            if #bladehit > 0 then
                                local u8 = debug.getupvalue(AC.attack, 5)
                                local u9 = debug.getupvalue(AC.attack, 6)
                                local u7 = debug.getupvalue(AC.attack, 4)
                                local u10 = debug.getupvalue(AC.attack, 7)
                                local u12 = (u8 * 798405 + u7 * 727595) % u9
                                local u13 = u7 * 798405
                                (function()
                                    u12 = (u12 * u9 + u13) % 1099511627776
                                    u8 = math.floor(u12 / u9)
                                    u7 = u12 - u8 * u9
                                end)()
                                u10 = u10 + 1
                                debug.setupvalue(AC.attack, 5, u8)
                                debug.setupvalue(AC.attack, 6, u9)
                                debug.setupvalue(AC.attack, 4, u7)
                                debug.setupvalue(AC.attack, 7, u10)
                                pcall(function()
                                    for k, v in pairs(AC.animator.anims.basic) do
                                        v:Play()
                                    end                  
                                end)
                                if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
                                end
                            end
                        end
                    end
                    spawn(function()
                        while wait(.5) do
                            pcall(function()
                                if _G.Fast_Attack then
                                    repeat wait(0.3)
                                        AttackNoCD()
                                        AttackNoCD2()
                                    until not Fast_Attack
                                end
                            end)
                        end
                    end)
                end)
            end
        end
    end)
