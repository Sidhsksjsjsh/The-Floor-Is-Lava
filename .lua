local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - EGG HUNT 🔥👀")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Parkour")
local T3 = wndw:Tab("Vote")

local self = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

local g = {
  place = false,
  a = false,
  q = false,
  s = false,
  v1 = false,
  v2 = false,
  v3 = false,
  bring = false
}

--[[
save: 16, 324, -22
VIP parkour: -88, 67, -287
Parkour: 34, 70, -461
]]

local poslist = {
  save = Vector3.new(16,324,-22),
  parkour = {
    VIP = Vector3.new(-88,67,-287),
    Normal = Vector3.new(34,70,-461)
  }
}

local function kids(str,funct)
  for i,v in pairs(str:GetChildren()) do
    funct(v)
  end
end
--workspace.CurrentMap["Which one is it?"].Coins.Coin4

T1:Toggle("Bring coins",false,function(value)
    g.bring = value
    while wait() do
      if g.bring == false then break end
      kids(workspace.CurrentMap,function(v)
          kids(v.Coins,function(get)
              get.Position = self.Character.HumanoidRootPart.Position
          end)
      end)
    end
end)

T1:Toggle("Save place",false,function(value)
    g.place = value
    while wait() do
      if g.place == false then break end
      self.Character.HumanoidRootPart.Position = poslist.save
    end
end)

T2:Toggle("Auto VIP parkour",false,function(value)
    g.a = value
    while wait() do
      if g.a == false then break end
      self.Character.HumanoidRootPart.Position = poslist.parkour.VIP
    end
end)

T2:Toggle("Auto Normal parkour",false,function(value)
    g.q = value
    while wait() do
      if g.q == false then break end
      self.Character.HumanoidRootPart.Position = poslist.parkour.Normal
    end
end)

T1:Button("Remove VIP door",function()
    workspace.Part.VIP:Destroy()
end)

T1:Toggle("Auto spin",false,function(value)
    g.s = value
    while wait() do
      if g.s == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["SpinEvent"]:FireServer(true)
    end
end)

T3:Toggle("Vote '1'",false,function(value)
    g.v1 = value
    while wait() do
      if g.v1 == false then break end
      game:GetService("ReplicatedStorage")["Voting"]["map1_trigger"]:FireServer()
    end
end)

T3:Toggle("Vote '2'",false,function(value)
    g.v2 = value
    while wait() do
      if g.v2 == false then break end
      game:GetService("ReplicatedStorage")["Voting"]["map2_trigger"]:FireServer()
    end
end)

T3:Toggle("Vote '3'",false,function(value)
    g.v3 = value
    while wait() do
      if g.v3 == false then break end
      game:GetService("ReplicatedStorage")["Voting"]["map3_trigger"]:FireServer()
    end
end)
