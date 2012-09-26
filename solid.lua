solid={
}


function solid:new (o)
      o = o or {}
      setmetatable(o, self)
      self.__index = self
      return o
end

function solid:load(index,gameworld,x,y,heigth,width)
   self.body = love.physics.newBody(gameworld,x,y)
   self.shape = love.physics.newRectangleShape(heigth,width)
   self.fixture = love.physics.newFixture(self.body,self.shape)
   self.fixture:setUserData(index)
   self.destroy=false


end


function solid:draw()
end


function solid:debug()
   if self.form == "circle" then
      love.graphics.circle("line", self.body:getX(),self.body:getY(), self.shape:getRadius())
   else
      local points={self.body:getWorldPoints(self.shape:getPoints())}
      love.graphics.polygon("line", points)
   end
end