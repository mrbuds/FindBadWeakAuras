SLASH_FINDBADWEAKAURAS1 = "/badwa"
SlashCmdList.FINDBADWEAKAURAS = function()
	local count = 0
	for id, data in pairs(WeakAurasSaved.displays) do
		for triggernum, triggerdata in ipairs(data.triggers) do
			if
				triggerdata.trigger.type == "custom"
				and (triggerdata.trigger.custom_type == "event" or triggerdata.trigger.check ~= "update")
			then
				for _, event in pairs(WeakAuras.split(triggerdata.trigger.events)) do
					if event == "CLEU" or event == "COMBAT_LOG_EVENT_UNFILTERED" then
						print(("%s (trigger %s) => %s"):format(id, triggernum, event))
						count = count + 1
					end
				end
			end
		end
	end
	if count == 0 then
		print("You don't have any weakauras using unfiltered CLEU event")
	else
		print(("You have %s bad weakauras"):format(count))
	end
end
