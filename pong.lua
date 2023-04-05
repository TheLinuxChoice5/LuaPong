-- Pong game in Lua using LÖVE

-- Set up initial game state
function love.load()
    windowWidth = 640
    windowHeight = 480
    ballX = windowWidth / 2
    ballY = windowHeight / 2
    ballSpeed = 300
    ballRadius = 10
    ballXDirection = 1
    ballYDirection = 1
    paddleWidth = 15
    paddleHeight = 75
    paddleSpeed = 500
    player1X = 50
    player1Y = (windowHeight / 2) - (paddleHeight / 2)
    player2X = windowWidth - 50 - paddleWidth
    player2Y = (windowHeight / 2) - (paddleHeight / 2)
    player1Score = 0
    player2Score = 0
  end
  
  -- Update game state
  function love.update(dt)
    -- Move player paddles up and down
    if love.keyboard.isDown("w") then
      player1Y = player1Y - (paddleSpeed * dt)
    end
    if love.keyboard.isDown("s") then
      player1Y = player1Y + (paddleSpeed * dt)
    end
    if love.keyboard.isDown("up") then
      player2Y = player2Y - (paddleSpeed * dt)
    end
    if love.keyboard.isDown("down") then
      player2Y = player2Y + (paddleSpeed * dt)
    end
    
    -- Keep player paddles within bounds
    if player1Y < 0 then
      player1Y = 0
    end
    if player1Y + paddleHeight > windowHeight then
      player1Y = windowHeight - paddleHeight
    end
    if player2Y < 0 then
      player2Y = 0
    end
    if player2Y + paddleHeight > windowHeight then
      player2Y = windowHeight - paddleHeight
    end
    
    -- Move the ball
    ballX = ballX + (ballSpeed * dt * ballXDirection)
    ballY = ballY + (ballSpeed * dt * ballYDirection)
    
    -- Bounce the ball off the top and bottom walls
    if ballY - ballRadius < 0 or ballY + ballRadius > windowHeight then
      ballYDirection = ballYDirection * -1
    end
    
    -- Bounce the ball off the player paddles
    if ballX - ballRadius < player1X + paddleWidth and ballY > player1Y and ballY < player1Y + paddleHeight then
      ballXDirection = ballXDirection * -1
    end
    if ballX + ballRadius > player2X and ballY > player2Y and ballY < player2Y + paddleHeight then
      ballXDirection = ballXDirection * -1
    end
    
    -- Reset the ball if it goes out of bounds
    if ballX < 0 or ballX > windowWidth then
      if ballX < 0 then
        player2Score = player2Score + 1
      else
        player1Score = player1Score + 1
      end
      ballX = windowWidth / 2
      ballY = windowHeight / 2
      ballXDirection = ballXDirection * -1
    end
  end

  -- Draw game elements to the screen
function love.draw()
    love.graphics.setColor(1, 1, 1)
    -- Draw the ball
    love.graphics.circle("fill", ballX, ballY, ballRadius)
    -- Draw the player paddles
    love.graphics.rectangle("fill", player1X, player1Y, paddleWidth, paddleHeight)
    love.graphics.rectangle("fill", player2X, player2Y, paddleWidth, paddleHeight)
    -- Draw the scores
    love.graphics.print(player1Score, windowWidth / 2 - 50, 10)
    love.graphics.print(player2Score, windowWidth / 2 + 30, 10)
    end