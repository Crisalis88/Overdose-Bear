local love = require('love')


function love.load()
	
	love.window.setTitle('Goal Against Cards')

	function enemy()
		return {
			x = 1600 + math.random(300),
			y = 0 + math.random(950),
			radius = 30,
			speed = 2,
			moveEnable = false,
			move = function (self)
				self.x = self.x - self.speed
			end
		}
	end


	overdoseBear = {
		x = 100,
		y = 100,
		speed = 18,
		image = love.graphics.newImage('overdoseBear.png')
	}

	function bullet()
		return {
		x = overdoseBear.x,
		y = overdoseBear.y,
		radius = math.random(60),
		speed = 1 + math.random(50),
		run = false,
		move = function (self)
			self.x = self.x + self.speed
		end
	}
	end

	listOfBullets = {

	}

	listOfTheEnemies = {

	}

end

function love.update(dt)

	if love.keyboard.isDown('d')then
		overdoseBear.x = overdoseBear.x + overdoseBear.speed
	end
	if love.keyboard.isDown('a')then
		overdoseBear.x = overdoseBear.x - overdoseBear.speed
	end
	if love.keyboard.isDown('s')then
			overdoseBear.y = overdoseBear.y + overdoseBear.speed
	end
	if love.keyboard.isDown('w')then
		overdoseBear.y = overdoseBear.y - overdoseBear.speed
	end


	if 	love.keyboard.isDown('j') then
		table.insert(listOfBullets, bullet())
		for i = 1, #listOfBullets do
			listOfBullets[i].run = true
		end
	end

	for i = 1, #listOfBullets do
		if listOfBullets[i].run then
			listOfBullets[i]:move()
		end
	end



	if love.keyboard.isDown('f')then
		table.insert(listOfTheEnemies, enemy())
		for i = 1, #listOfTheEnemies do
			listOfTheEnemies[i].runEnable = true
		end
	end


	if overdoseBear.x > 1500 then
		overdoseBear.x = 1480
	elseif overdoseBear.y > 990 then
		overdoseBear.y = 970
	elseif overdoseBear.y < -410 then
		overdoseBear.y = -390
	elseif overdoseBear.x < -460 then
		overdoseBear.x = -440
	end
end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.scale(1.1)
	love.graphics.draw(overdoseBear.image, overdoseBear.x, overdoseBear.y)

	for i = 1, #listOfBullets do 
		love.graphics.setColor(math.random(255) / 255, math.random(255) / 255, math.random(255) / 255)
		love.graphics.circle('fill', listOfBullets[i].x, listOfBullets[i].y, listOfBullets[i].radius)
	end

	love.graphics.setColor(1, 0, 0)
	for i = 1, #listOfTheEnemies do 
		love.graphics.circle('fill', listOfTheEnemies[i].x, listOfTheEnemies[i].y, listOfTheEnemies[i].radius)
	end
end




