--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0=game:GetService("ReplicatedStorage");local v1=game:GetService("Players");local v2=workspace.CurrentCamera;local v3=require(v0:WaitForChild("Modules"):WaitForChild("Utility"));local v4=function() local v8={};for v15,v16 in workspace:GetChildren() do if v16:FindFirstChildOfClass("Humanoid") then table.insert(v8,v16);elseif (v16.Name=="HurtEffect") then for v23,v24 in v16:GetChildren() do if (v24.ClassName~="Highlight") then table.insert(v8,v24);end end end end return v8;end;local v5=function() local v9,v10=nil,math.huge;local v11=v1.LocalPlayer.Character;if ( not v11 or  not v11:FindFirstChild("HumanoidRootPart")) then return;end local v12=v11.HumanoidRootPart.Position;for v17,v18 in v4() do if (v18==v11) then continue;end if  not v18:FindFirstChild("HumanoidRootPart") then continue;end local v19=v18.HumanoidRootPart.Position;local v20=(v12-v19).Magnitude;if (v20<v10) then local v21=0;while true do if (v21==0) then v9=v18;v10=v20;break;end end end end return v9;end;local v6=v3.Raycast;v3.Raycast=function(...) local v13=0;local v14;while true do if (v13==0) then v14={...};if (( #v14>0) and (v14[4]==(1930 -(857 + 74)))) then local v22=v5();if (v22 and v22:FindFirstChild("Head")) then v14[571 -(367 + 201) ]=v22.Head.Position;end end v13=928 -(214 + 713) ;end if (v13==(1 + 0)) then return v6(table.unpack(v14));end end end;
