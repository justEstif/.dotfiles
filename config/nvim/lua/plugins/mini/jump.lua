-- Mini jump
local status_jump, mini_jump = pcall(require, "mini.jump")
if not status_jump then
	print("mini.jump error")
	return
end

mini_jump.setup()
