local StarterGui = game:GetService("StarterGui")

repeat
	local Disabled = pcall(function()
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
		StarterGui:SetCore("ResetButtonCallback", false)
	end)
	task.wait(0.5)
until Disabled