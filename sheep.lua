require 'animator'
sheep={
}


function sheep:new (o)
      o = o or {}
      setmetatable(o, self)
      self.__index = self
      return o
end

function sheep:load(index,gameworld,x,y,radius)
   self.body = love.physics.newBody(gameworld,x,y,"dynamic")
   self.shape = love.physics.newCircleShape(radius)
   self.fixture = love.physics.newFixture(self.body,self.shape,1)
   self.fixture:setUserData(index)
   self.fixture:setRestitution(0.9)
   self.destroy=false

   self.sprite=newAnimation(love.graphics.newImage("Sheep/test.png"),64,64,0.2,0)

end

function sheep:update(dt)
   self.sprite:update(dt)

end

function sheep:draw()
   self.sprite:draw(self.body:getX(),self.body:getY(),self.body:getAngle())
end

function sheep:debug()
   love.graphics.circle("line",self.body:getX(),self.body:getY(), self.shape:getRadius())
  
end

