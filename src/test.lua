function particle_tune(p)
	p:setParticleLifetime(1, 10) 
	p:setEmissionRate(100)
	p:setSizeVariation(0,5)
	p:setLinearAcceleration(-20, -20, 20, 20) 
	p:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.
end