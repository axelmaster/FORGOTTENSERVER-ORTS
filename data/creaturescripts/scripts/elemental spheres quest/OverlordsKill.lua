local overlords = {
	['energy overlord'] = {storage = 10001, globalStorage = 8568},
	['fire overlord'] = {storage = 10001, globalStorage = 8569},
	['ice overlord'] = {storage = 10001, globalStorage = 8570},
	['earth overlord'] = {storage = 10001, globalStorage = 8578},
	['lord of the elements'] = {}
}

function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	local bossConfig = overlords[targetMonster:getName():lower()]
	if not bossConfig then
		return true
	end

	if bossConfig.globalStorage then
		Game.setStorageValue(bossConfig.globalStorage, 0)
	end

	local player = creature:getPlayer()
	if bossConfig.storage and player:getStorageValue(bossConfig.storage) < 1 then
		player:setStorageValue(bossConfig.storage, 1)
	end

	player:say('You slayed ' .. targetMonster:getName() .. '.', TALKTYPE_MONSTER_SAY)
	return true
end
