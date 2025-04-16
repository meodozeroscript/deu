-- TẠO GIAO DIỆN REDZ HUB
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "Mèo Đỏ PKĐ"

-- KHUNG CHÍNH
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 350, 0, 400)
main.Position = UDim2.new(0.5, -175, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.Visible = true

-- TIÊU ĐỀ
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Redz Hub Menu"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

-- NÚT ẨN/HIỆN MENU
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 100, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0.5, -20)
toggleBtn.Text = "Mở/Tắt Hub"
toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.Gotham
toggleBtn.TextSize = 18

toggleBtn.MouseButton1Click:Connect(function()
	main.Visible = not main.Visible
end)

-- HÀM TẠO NÚT NHANH
local function createButton(name, posY, func)
	local btn = Instance.new("TextButton", main)
	btn.Size = UDim2.new(0, 320, 0, 40)
	btn.Position = UDim2.new(0, 15, 0, posY)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 20
	btn.MouseButton1Click:Connect(func)
	return btn
end

-- CÁC CHỨC NĂNG
createButton("Tăng tốc độ chạy", 60, function()
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then hum.WalkSpeed = 50 end
end)

createButton("Tăng nhảy cao", 110, function()
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then hum.JumpPower = 120 end
end)

createButton("Bay (Fly)", 160, function()
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	local bv = Instance.new("BodyVelocity", hrp)
	bv.Velocity = Vector3.new(0, 50, 0)
	bv.MaxForce = Vector3.new(0, math.huge, 0)
	wait(2)
	bv:Destroy()
end)

createButton("Reset nhân vật", 210, function()
	player:LoadCharacter()
end)

createButton("Đặt lại tốc độ và nhảy", 260, function()
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then
		hum.WalkSpeed = 16
		hum.JumpPower = 50
	end
end)
