require 'sheep'
require 'solid'

function love.load()
   screenheight=640
   debug=true
   sheeps={}
   solids={}
   gameworld=love.physics.newWorld(0,9.81*64,true)
   --add basket
   solids[#solids+1]=solid:new()
   solids[#solids]:load(1,gameworld,512,500,800,10)
end

function love.draw()

   for i,object in ipairs(sheeps) do
      object:draw() 
   end


   if debug then
      love.graphics.print("Sheep: "..#sheeps,10,10)
      for i,object in ipairs(solids) do
	 object:debug() 
      end
       for i,object in ipairs(sheeps) do
       	 object:debug() 
       end
   
   end
end

function love.update(dt)
   --remove sheep of screen
   
   for i=#sheeps, 1 ,-1 do--backwards because we are removing stuff
      if sheeps[i].destroy then
	 sheeps[i].body:destroy()
	 table.remove(sheeps,i)
      end 
   end

   --updatephysics
   gameworld:update(dt)
   
   --update sheep
   for i,object in ipairs(sheeps) do
      object:update(dt) 
   end
end

function love.keypressed(key)

   if key=='escape' then
      love.event.quit()
   elseif key=='d' then
      if debug then debug=false else debug=true end
   elseif key==' ' then
      sheeps[#sheeps+1]=sheep:new()
      sheeps[#sheeps]:load(1,gameworld,480+math.random(58),200)
   end


end



function love.quit()
  print("One step closer to world hegemony.")
end




