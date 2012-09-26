require 'sheep'
require 'solid'

function love.load()
   debug=true
   sheeps={}
   solids={}
   gameworld=love.physics.newWorld(0,9.81*64,true)
   --add basket
   solids[#solids+1]=solid:new()
   solids[#solids]:load(1,gameworld,512,500,800,10)
end

function love.draw()
   if debug then
      for i,object in ipairs(solids) do
	 object:debug() 
      end
      -- for i,object in ipairs(sheeps) do
      -- 	 object:debug() 
      -- end
   
   end

   for i,object in ipairs(sheeps) do
      object:draw() 
   end

end

function love.update(dt)
   --updatephysics
   gameworld:update(dt)
   

   for i,object in ipairs(sheeps) do
      object:update(dt) 
   end
end

function love.keypressed(key)

   if key=='escape' then
      love.event.quit()
   elseif key==' ' then
      sheeps[#sheeps+1]=sheep:new()
      sheeps[#sheeps]:load(1,gameworld,480+math.random(58),200)
   end


end



function love.quit()
  print("One step closer to world hegemony.")
end




