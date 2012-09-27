spawner={
   timestep=1,
   currentstep=0
}


function spawner.update(dt)
   spawner.currentstep=spawner.currentstep+dt
   if spawner.currentstep>spawner.timestep then
      spawner.currentstep=spawner.currentstep-spawner.timestep
      spawnsheep()
   end
end