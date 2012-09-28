require 'sheep'
require 'solid'
require 'spawner'
require 'textballoon'

function love.load()
   math.randomseed( os.time() )
   screenheight=640
   screenwidth=1024
   debug=false
   sheeps={}
   solids={}
   gameworld=love.physics.newWorld(0,5*64,true)
   myfont=love.graphics.newFont('font/ChronoTrigger.ttf',40)
   love.graphics.setFont(myfont)
   --add basket
   solids[#solids+1]=solid:new()
   solids[#solids]:load(1,gameworld,512,500,800,10)
   solids[#solids+1]=solid:new()
   solids[#solids]:load(1,gameworld,112,350,10,300)
   solids[#solids+1]=solid:new()
   solids[#solids]:load(1,gameworld,902,350,10,300)
   spawner.spawnXsheep(20)
end

function love.draw()
   --draw sheep
   for i,object in ipairs(sheeps) do
      object:draw() 
   end


   --draw balloon
   textballoon.draw(dt)

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

   --spawn new sheep
   spawner.update(dt)

   --update sheep
   for i,object in ipairs(sheeps) do
      object:update(dt) 
   end

   --update textballoon
   textballoon.update(dt)
end


function love.keypressed(key)

   if key=='escape' then
      love.event.quit()
   elseif key=='d' then
      if debug then debug=false else debug=true end
   elseif key=='c' then
      textballoon.currentEntry=math.random(#textballoon.winlines-1)
   elseif key==' ' then
      punchsheep()
   end


end


function love.quit()
  print("One step closer to world hegemony.")
end


function punchsheep()
   if #sheeps~=0 then
      local minus1=1
      local minus2=1
      if math.random()>0.5 then minus1=-1 end
      if math.random()>0.5 then minus2=-1 end
      sheeps[math.random(#sheeps)].body:applyLinearImpulse(minus1*math.random(1,10)*500,minus2*math.random(1,10)*500)
   end
end


