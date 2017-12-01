local isOn = false
SLASH_TOGGLE1 = "/chatf";
SlashCmdList["TOGGLE"] = function(msg)
  	if(isOn==true) then
        isOn = false
		print("Addon Disabled")
    else
         isOn = true
        print("Addon Enabled")
    end
end
local EventFrame = CreateFrame("Frame")
print("Officer chat being sent to Barnacles")
EventFrame:RegisterEvent("CHAT_MSG_WHISPER")
--EventFrame:RegisterEvent("CHAT_MSG_OFFICER")
EventFrame:SetScript("OnEvent", function(self, event, ...)
		if(isOn==true) then
			local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11 = ... -- args from officer chat event
			--[[for i=1, BNGetNumFriends(), 1 do --loops through bnet friends
				local presenceID, presenceName, battleTag, isBattleTagPresence, toonName, toonID, client, isOnline, lastOnline, isAFK, isDND, messageText = BNGetFriendInfo(i) -- sets variables to returned args
				if string.find(battleTag, "Anikleiner") then  
					 if(isOnline) then
				 		BNSendWhisper(presenceID, arg2 .. ' said "' .. arg1 .. '"') --sends bn whisper to the found btag with ochat sender and message
					 end
				end
			end	--]]
		SendChatMessage(arg2 .. ' said "' .. arg1 .. '"', PARTY, nil, nil)
	end
	end)

