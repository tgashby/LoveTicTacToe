debug = true

function love.conf(t)
	t.title = "Tic Tac Toe!"
	t.screen.width = 1280
	t.screen.height = 800

	if debug then
		t.console = true
	end
end