local GameState = {state = "playing"}

function GameState:checkState(state, event)
	if self.state == state then
		event()
	end
end

return GameState