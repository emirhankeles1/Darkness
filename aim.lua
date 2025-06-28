--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0=game.GetService(game,"ReplicatedStorage");local v1=game.GetService(game,"Players");local v2=workspace.CurrentCamera;local v3=require(v0.Modules.Utility);local v4=function() local v8=0 -0 ;local v9;while true do if (v8==(2 -1)) then return v9;end if (v8==(568 -(367 + 201))) then v9={};for v22,v23 in workspace.GetChildren(workspace) do if v23.FindFirstChildOfClass(v23,"Humanoid") then table.insert(v9,v23);elseif (v23.Name=="HurtEffect") then for v26,v27 in v23.GetChildren(v23) do if (v27.ClassName~="Highlight") then table.insert(v9,v27);end end end end v8=928 -(214 + 713) ;end end end;local v5=function() local v10,v11=nil,math.huge;local v12=v1.LocalPlayer.Character;if (v12==nil) then return;end for v14,v15 in v4() do if (v15==v1.LocalPlayer) then continue;end if  not v15:FindFirstChild("HumanoidRootPart") then continue;end local v16,v17=v2.WorldToViewportPoint(v2,v15.HumanoidRootPart.Position);if (v17==false) then continue;end local v18=Vector2.new(v2.ViewportSize.X/(1 + 1) ,v2.ViewportSize.Y/2 );local v19=(v18-Vector2.new(v16.X,v16.Y)).Magnitude;if (v19>v11) then continue;end v10=v15;v11=v19;end return v10;end;local v6=v3.Raycast;v3.Raycast=function(...) local v13={...};if (( #v13>0) and (v13[881 -(282 + 595) ]==999)) then local v20=1637 -(1523 + 114) ;local v21;while true do if (v20==(0 + 0)) then v21=v5();if v21 then v13[3 -0 ]=v21.Head.Position;end break;end end end return v6(table.unpack(v13));end;