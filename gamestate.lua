local GameState = {state = ""}

function GameState:checkState(state, event)
	if self.state == state then
		event()
	end
end

return GameState