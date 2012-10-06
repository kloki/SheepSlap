require 'utils'
require 'animator'
textballoon={
   on=false,
   balloon= love.graphics.newImage('balloon/balloon.png' ),
   counter=0,
   counter2=0,
   winlines=love.filesystem.newFile('text/win.txt'):read():split("\n"),
   currentEntry=0,
   speaker=newAnimation(love.graphics.newImage('balloon/shaapman.png'),150,400,0.3,0)
   
}


function textballoon.load()
end

function textballoon.update(dt)
   
   --timer display
   if  textballoon.on then
      textballoon.counter=textballoon.counter+dt
      textballoon.counter2=textballoon.counter2+dt
      
      if textballoon.counter2>0.3 then
	 textballoon.counter2=textballoon.counter2-0.3
	 spawner.spawnXsheep(1)
      end
      
      if textballoon.counter>8 then
	 textballoon.on=false
	 textballoon.counter=0
	 textballoon.counter2=0
      end
      --update sprite
      textballoon.speaker:update(dt)
   --check if minimum sheep
   elseif #sheeps <1 then 
      --set balloon on
      textballoon.on=true 
      --set text for balloon
      textballoon.currentEntry=math.random(#textballoon.winlines-1)
   end
end

function textballoon.draw()
   if textballoon.on then
      love.graphics.draw(textballoon.balloon,0,0)
      love.graphics.setColor(0,0,0)
      love.graphics.printf(textballoon.winlines[textballoon.currentEntry],360,150,550)
      love.graphics.setColor(255,255,255)
      textballoon.speaker:draw(100,200)
   end
end

