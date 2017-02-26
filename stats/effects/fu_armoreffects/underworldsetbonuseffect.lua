setName="fu_underworldset"

weaponEffect={
    {stat = "critChance", amount = 12}
  }
  
armorBonus={
    {stat = "electricResistance", amount = 0.15},
    {stat = "iceResistance", amount = 0.15}
}

require "/stats/effects/fu_armoreffects/setbonuses_common.lua"

function init()
	setSEBonusInit(setName)
	handler=effect.addStatModifierGroup({})
        daggerCheck()
	effect.addStatModifierGroup(armorBonus)	
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		daggerCheck()
	end	
end

function daggerCheck()
	if weaponCheck("both",{"rifle","pistol","machinepistol"},false) then
		effect.setStatModifierGroup(handler,weaponEffect)
	else
		effect.setStatModifierGroup(handler,{})
	end
end