
--=========================REGLAS===========================--

local ruleStart = "-- [ COMIENZAN LAS REGLAS ] --"

local ruleRaidOne	 = "WOLOOOOOOLOOO"
local ruleRaidTwo	 = "WOLOOOOOOLOOO"
local ruleRaidThree	 = "WOLOOOOOOLOOO"
local ruleRaidFour	 = "WOLOOOOOOLOOO"
local ruleRaidFive	 = "WOLOOOOOOLOOO"
local ruleRaidSix	 = "WOLOOOOOOLOOO"
--==============================================
--Añadir mas normas aqui

--==============================================
local ruleEnd	= "-- [ FIN DE LAS REGLAS ] --"

--=========================REGLAS===========================--

-- Version
LootRules_Version = "1.0.0";

function LootRules_OnLoad()
	-- Registrar comandos slash
	SLASH_LOOTRULESVER1 = "/lootrulesver";
	SlashCmdList["LOOTRULESVER"] = function()
			    lootrules_ShowVersion(LootRules_Version);
			 end
			
	SLASH_RAIDRULES1 = "/raidloot";
	SLASH_RAIDRULES2 = "/raidlootrules";
	SLASH_RAIDRULES3 = "/rlr";
	SlashCmdList["RAIDRULES"] = function()
				lootrules_DispRaidRules();
			end
	-- Fin de los slash
	
	-- Confirmar que el addon se ha cargado
	if (DEFAULT_CHAT_FRAME) then
		DEFAULT_CHAT_FRAME:AddMessage("Krilin Loot Rules " .. LootRules_Version .. " Cargado!");
	else 
      message("Krilin Loot Rules " .. LootRules_Version .. " Cargado!");
   	end
end

function lootrules_ShowVersion(ver)
   if (DEFAULT_CHAT_FRAME) then
      DEFAULT_CHAT_FRAME:AddMessage("Krilin Loot Rules " .. ver .. " Cargado!");
   else 
      message("Krilin Loot Rules " .. ver .. " Cargado!");
   end
end

--=========================ALERTAS===========================--

function lootrules_DispRaidRules()

	-- Comprobar si es lider o ayudante
	if IsRaidLeader() or IsRaidOfficer() then 

		--Lanzar alertas
		SendChatMessage( ruleStart, "RAID_WARNING" );
		
		SendChatMessage( ruleRaidOne , "RAID_WARNING" );
		SendChatMessage( ruleRaidTwo , "RAID_WARNING" );
		SendChatMessage( ruleRaidThree , "RAID_WARNING" );
		SendChatMessage( ruleRaidFour , "RAID_WARNING" );
		SendChatMessage( ruleRaidFive , "RAID_WARNING" );
		SendChatMessage( ruleRaidSix , "RAID_WARNING" );
		--==============================================
		--Añadir mas normas aqui

		--==============================================
		SendChatMessage( ruleEnd , "RAID_WARNING" );
		-- Fin de las alertas
	else

		-- Mensajes de error
		if (DEFAULT_CHAT_FRAME) then
			DEFAULT_CHAT_FRAME:AddMessage("Debes de ser lider de banda o ayudante para mandar alertas");
		else
			message("Debes de ser lider de banda o ayudante para mandar alertas");
		end
	end
end