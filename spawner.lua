spawner={
   timestep=1,
   currentstep=0
}


function spawner.update(dt)
   spawner.currentstep=spawner.currentstep+dt
   if spawner.currentstep>spawner.timestep then
      spawner.currentstep=spawner.currentstep-spawner.timestep
      spawner.spawnsheep()
   end

   if love.keyboard.isDown('x') then
      spawner.spawnsheep()
   end
end

function spawner.spawnsheep()
   if #sheeps<150 then
      sheeps[#sheeps+1]=sheep:new()
      sheeps[#sheeps]:load(1,gameworld,300+math.random(300),-50,SList[math.random(numberofSheep)])
   end
end

function spawner.spawnXsheep(X)
   for index=1,X do
      spawner.spawnsheep()
   end
end

