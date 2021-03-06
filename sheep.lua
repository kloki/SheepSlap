require 'animator'
sheep={
}


function sheep:new (o)
      o = o or {}
      setmetatable(o, self)
      self.__index = self
      return o
end

function sheep:load(index,gameworld,x,y,Satlas)
   self.body = love.physics.newBody(gameworld,x,y,"dynamic")
   --self.shape = love.physics.newRectangleShape(40,40)
   self.shape = love.physics.newPolygonShape(-20,-10,0,-20,20,-10,20,10,0,20,-20,10)
   self.fixture = love.physics.newFixture(self.body,self.shape,1)
   self.fixture:setUserData(index)
   self.fixture:setRestitution(0.6)
   self.destroy=false

   self.sprite=newAnimation(Satlas,64,64,0.2,0)

end

function sheep:update(dt)
   self.sprite:update(dt)
   if (self.body:getY()-100)>screenheight or (self.body:getY()+500)<0 or (self.body:getX()-200)>screenwidth or (self.body:getX()+200)<0 then   self.destroy=true end

end

function sheep:draw()
   self.sprite:draw(self.body:getX(),self.body:getY(),self.body:getAngle(),1,1,32,32)
end

function sheep:debug()
   love.graphics.setColor(255,0,0)
   local points={self.body:getWorldPoints(self.shape:getPoints())}
   love.graphics.polygon("line", points)   
   love.graphics.setColor(255,255,255)


end

