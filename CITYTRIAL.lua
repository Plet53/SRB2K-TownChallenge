freeslot(
  "MT_STATITEM",
  "MT_ITEMBOX",
  "S_ALLOFEM",
  "S_ATTACK",
  "S_BOOST",
  "S_CHARGE",
  "S_DEFEND",
  "S_HEALTH",
  "S_SPEED",
  "S_WEIGHT",
  "S_BLUEBOX",
  "S_REDBOX",
  "S_GREENBOX",
  "S_UNKOWNBOX",
  "S_ATTACKDOWN",
  "S_BOOSTDOWN",
  "S_CHARGEDOWN",
  "S_DEFENDDOWN",
  "S_SPEEDDOWN",
  "S_WEIGHTDOWN",
  "S_RANDOMSTAT",
  "sfx_allofe",
  "sfx_attack",
  "sfx_attacd",
  "sfx_boostu",
  "sfx_boostd",
  "sfx_charge",
  "sfx_chargd",
  "sfx_defenu",
  "sfx_defend",
  "sfx_health",
  "sfx_speedu",
  "sfx_speedd",
  "sfx_weight",
  "sfx_weighd",
  "SPR_BOX",
  "SPR_STAT")

mobjinfo[MT_STATITEM] = {
  radius = 32,
  height = 32,
  fuse = TICRATE * 15,
  xdeathstate = S_NULL,
  flags = MF_SPECIAL|MF_RUNSPAWNFUNC,
  SpawnState = S_RANDOMSTAT
}

mobjinfo[MT_ITEMBOX] ={
  radius = 64,
  height = 64,
  fuse = TICRATE * 30,
  xdeathstate = S_NULL,
  SpawnState = S_UNKOWNBOX
}

states[S_ALLOFEM] ={
  sprite = SPR_STAT,
  frame = A|FF_FULLBRIGHT
}
states[S_ATTACK] ={
  sprite = SPR_STAT,
  frame = B|FF_FULLBRIGHT
}
states[S_ATTACKDOWN] ={
  sprite = SPR_STAT,
  frame = B|FF_FULLBRIGHT
}
states[S_BOOST] ={
  sprite = SPR_STAT,
  frame = C|FF_FULLBRIGHT
}
states[S_BOOSTDOWN] ={
  sprite = SPR_STAT,
  frame = C|FF_FULLBRIGHT
}
states[S_CHARGE] ={
  sprite = SPR_STAT,
  frame = D|FF_FULLBRIGHT
}
states[S_CHARGEDOWN] ={
  sprite = SPR_STAT,
  frame = D|FF_FULLBRIGHT
}
states[S_DEFEND] ={
  sprite = SPR_STAT,
  frame = E|FF_FULLBRIGHT
}
states[S_DEFENDDOWN] ={
  sprite = SPR_STAT,
  frame = E|FF_FULLBRIGHT
}
states[S_HEALTH] ={
  sprite = SPR_STAT,
  frame = F|FF_FULLBRIGHT
}
states[S_SPEED] ={
  sprite = SPR_STAT,
  frame = G|FF_FULLBRIGHT
}
states[S_SPEEDDOWN] ={
  sprite = SPR_STAT,
  frame = G|FF_FULLBRIGHT
}
states[S_WEIGHT] ={
  sprite = SPR_STAT,
  frame = H|FF_FULLBRIGHT
}
states[S_WEIGHTDOWN] ={
  sprite = SPR_STAT,
  frame = H|FF_FULLBRIGHT
}
states[S_RANDOMSTAT] ={
  action = A_SETRANDOMSTATITEM
}
states[S_REDBOX] ={
  sprite = SPR_BOX,
  frame = A
}
states[S_GREENBOX] ={
  sprite = SPR_BOX,
  frame = B
}
states[S_BLUEBOX] ={
  sprite = SPR_BOX,
  frame = C
}

S_sfx[sfx_allofe] ={false, 255, 0}
S_sfx[sfx_attack] ={false, 255, 0}
S_sfx[sfx_attacd] ={false, 255, 0}
S_sfx[sfx_boostu] ={false, 255, 0}
S_sfx[sfx_boostd] ={false, 255, 0}
S_sfx[sfx_charge] ={false, 255, 0}
S_sfx[sfx_chargd] ={false, 255, 0}
S_sfx[sfx_defenu] ={false, 255, 0}
S_sfx[sfx_defend] ={false, 255, 0}
S_sfx[sfx_health] ={false, 255, 0}
S_sfx[sfx_speedu] ={false, 255, 0}
S_sfx[sfx_speedd] ={false, 255, 0}
S_sfx[sfx_weight] ={false, 255, 0}
S_sfx[sfx_weighd] ={false, 255, 0}

mobjinfo[MT_PLAYER] = mobjinfo[MT_PLAYER] + {
  attackmod = 0,
  boostmod = 0,
  chargemod = 0,
  defensemod = 0,
  healthmod = 0,
  maxhp = 120 * FRACUNIT,
  hp = 120 * FRACUNIT
}

local stattable = {
  S_ALLOFEM = function(player)
    player.attackmod = $ + 1
    player.boostmod = $ + 1
    player.chargemod = $ + 1
    player.defensemod = $ + 1
    player.healthmod = $ + 1
    player.kartspeed = $ + 1
    player.kartweight = $ + 1
    ratio = player.hp / player.maxhp
    player.maxhp = $ + (20 * FRACUNIT)
    hp = player.maxhp * ratio
    end,
  S_ATTACK = function(player)
    player.attackmod = $ + 1
    end,
  S_BOOST = function(player)
    player.boostmod = $ + 1
    end,
  S_CHARGE = function(player)
    player.chargemod = $ + 1
    end,
  S_DEFEND = function(player)
    player.defensemod = $ + 1
    end,
  S_HEALTH = function(player)
    player.healthmod = $ + 1
    ratio = player.hp / player.maxhp
    player.maxhp = $ + (20 * FRACUNIT)
    player.hp = player.maxhp * ratio
    end,
  S_SPEED = function(player)
    player.kartspeed = $ + 1
    end,
  S_WEIGHT = function(player)
    player.kartweight = $ + 1
    end,
  S_ATTACKDOWN = function(player)
    player.attackmod = $ - 1
    end,
  S_BOOSTDOWN = function(player)
    player.boostmod = $ - 1
    end,
  S_CHARGEDOWN = function(player)
    player.chargemod = $ - 1
    end,
  S_DEFENDDOWN = function(player)
    player.defensemod = $ - 1
    end,
  S_SPEEDDOWN = function(player)
    player.kartspeed = max($ - 1, 0)
    end,
  S_WEIGHTDOWN = function(player)
    player.kartweight = max($ - 1, 0)
    end
}

local droptable ={
  function(player)
    player.attackmod = $ - 1
    item = P_SpawnMobj(MT_STATITEM)
    P_SetMobjStateNF(item, S_ATTACK)
  end,
  function(player)
    player.boostmod = $ - 1
    item = P_SpawnMobj(MT_STATITEM)
    P_SetMobjStateNF(item, S_BOOST)
  end,
  function(player)
    player.chargemod = $ - 1
    item = P_SpawnMobj(MT_STATITEM)
    P_SetMobjStateNF(item, S_CHARGE)
  end,
  function(player)
    player.defensemod = $ - 1
    item = P_SpawnMobj(MT_STATITEM)
    P_SetMobjStateNF(item, S_DEFEND)
  end,
  function(player)
    player.healthmod = $ - 1
    player.maxhp = player.maxhp - (20 * FRACUNIT)
    item = P_SpawnMobj(MT_STATITEM)
    P_SetMobjStateNF(item, S_HEALTH)
  end,
  function(player)
    player.kartspeed = $ - 1
    item = P_SpawnMobj(MT_STATITEM)
    P_SetMobjStateNF(item, S_SPEED)
  end,
  function(player)
    player.kartweight = $ - 1
    item = P_SpawnMobj(MT_STATITEM)
    P_SetMobjStateNF(item, S_WEIGHT)
  end
}

local statetable = {
  states[S_ALLOFEM],
  states[S_ATTACK],
  states[S_BOOST],
  states[S_CHARGE],
  states[S_DEFEND],
  states[S_HEALTH],
  states[S_SPEED],
  states[S_WEIGHT],
  states[S_ATTACKDOWN],
  states[S_BOOSTDOWN],
  states[S_CHARGEDOWN],
  states[S_DEFENDDOWN],
  states[S_SPEEDDOWN],
  states[S_WEIGHTDOWN]
}
local boxtable = {
  states[S_BLUEBOX],
  states[S_REDBOX],
  states[S_GREENBOX]
}
local chancetable = {
  FRACUNIT/100,
  11 * FRACUNIT/100,
  21 * FRACUNIT/100,
  31 * FRACUNIT/100,
  41 * FRACUNIT/100,
  46 * FRACUNIT/100,
  51 * FRACUNIT/100,
  61 * FRACUNIT/100,
  68 * FRACUNIT/100,
  74 * FRACUNIT/100,
  80 * FRACUNIT/100,
  87 * FRACUNIT/100,
  93 * FRACUNIT/100,
  FRACUNIT
}
local weapontable ={
  MT_ORBINAUT = 3/2,
  MT_JAWZ = 2,
  MT_BANANA = 1/2,
  MT_BALLHOG = 3/2,
  MT_PLAYER = 1
}
local reditems ={
  KITEM_ORBINAUT,
  KITEM_JAWZ,
  KITEM_BALLHOG,
  KITEM_EGGMAN,
  KITEM_MINE,
  KITEM_BANANA,
  KITEM_THUNDERSHEILD
}
local greenitems ={
  KITEM_SNEAKER,
  KITEM_POGOSPRING,
  KITEM_INVINCIBILITY,
  KITEM_GROWTH,
  KITEM_HYUDORO,
  KITEM_ROCKETSNEAKER
}
local implementedMaps = {}
addHook("MobjCollide", attackCalc)
addHook("TouchSpecial", statPickup, MT_STATITEM)
addHook("MapLoad", trialSetup)
addHook("MobjDeath", statexplode, MT_PLAYER)
addHook("MobjDeath", itemexplode, MT_ITEMBOX)
addHook("FrameThinker", boostboost)
--expected max speed of a 2 speed character is 2569287, about 39 * FRACUNIT
--GOAL: At base (both players have 2 weight, 2 speed, and no modifiers) a player will almost die from 3 full speed hits, no quickspin.
local function attackCalc(defender, attacker)
  weaponmod = 1
  if attacker != MT_PLAYER
    weaponmod = weapontable[attacker]
    attacker = attacker.source
  end
  defender.hp = defender.hp - max((max((attacker.kartweight + attacker.attackmod + SpinMod), 1) * (weaponmod) * (attacker.speed) / max((defender.kartweight + defender.defensemod), 1)), 4 * FRACUNIT)
  if defender.hp <= 0
    P_KillMobj(defender, attacker)
  end
end

local isboost = {[0] = false, [1] = false. [2] = false, [3] = false}
local function boostboost(player)
  for player in player.iterate
    if !(isboost[player.splitscreenindex]) and player.kartstuff[k_driftboost]
      isboost[player.splitscreenindex] = true
      player.kartstuff[k_driftboost] = $ * ((4 + player.boostmod) / 4)
      player.kartstuff[k_boostpower] = $ + (FRACUNIT * (player.boostmod / 8))
    end
    if player.kartstuff[k_driftboost] == 0
      isboost[player.splitscreenindex] = false
    end
  end
end

local function statPickup(item, player)
  lua_getglobal(L, stattable[item.state])
  lua_pushliteral(L, player)
  lua_call(L, 1, 0)
end

local function trialSetup(map)
--[[  check = false
  for i,e in ipairs(implementedMaps)
    do if map == e 
    then check = true
    break
    end 
  end
  if check == true
    then ]]
	  do for player in players.splitscreen
      player.kartstuff[kartspeed] = 2
      player.kartstuff[kartweight] = 2
      player.attackmod = 0
      player.boostmod = 0
      player.chargemod = 0
      player.defensemod = 0
      player.healthmod = 0
      player.maxhp = 120 * FRACUNIT
      player.hp = 120 * FRACUNIT
    end
  end
--end

function A_SETRANDOMSTATITEM(actor)
  n = math.random(FRACUNIT)
  c = 0
  if actor == MT_STATITEM
    then for i,e in ipairs(chancetable)
      do if n < e
        then c = i
        break
      end
    end
  end
  actor.state = statetable[c]
end

local function statexplode(player, nil, nil)
  stattotal = player.kartspeed + player.kartweight + player.attackmod + player.boostmod + player.chargemod + player.defensemod + player.healthmod - 4
  dropamount = stattotal / 3
  for i = 0, i < dropamount, i++ do
    lua_getglobal(L, droptable[math.random(7)])
    lua_pushliteral(L, player)
    lua_call(L, 1, 0)
  end
  player.hp = player.maxhp
  return false
end

local function itemexplode(box, nil, nil)
  if(box.state == S_BLUEBOX)
    n = math.random(4)
    for i = 1, i <= n, i++ do
      P_SpawnMobjFromMobj(box, 0, 0, 0, MT_STATITEM)
    end
  else if(box.state == S_REDBOX)
    n = math.random(7)
    P_SpawnMobjFromMobj(box, 0, 0, 0, reditems[n])
    end
  else if(box.state == S_GREENBOX)
    n = math.random(6)
    P_SpawnMobjFromMobj(box, 0, 0, 0, greentiems[n])
    end
  end
end

rawset(_G, K_GetKartDriftSparkValue, function(player)
  return ((26*4) + (11 - player.chargemod)) * 8)