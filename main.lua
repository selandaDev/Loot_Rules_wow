local addon = LibStub("AceAddon-3.0"):NewAddon("KrilinLootRules", "AceConsole-3.0", "AceEvent-3.0")
local AceGUI = LibStub("AceGUI-3.0")

<<<<<<< HEAD
        --=========================REGLAS===========================--
        

        local ruleStart = "-- [ COMIENZAN LAS REGLAS ] --"
        local ruleRaid1
        local ruleRaid2
        local ruleRaid3
        local ruleRaid4
        local ruleRaid5
        local ruleRaid6
        local ruleRaid7
        local ruleRaid8
        local ruleRaid9
        local ruleRaid10
        local ruleRaid11
        local ruleRaid12
        local ruleRaid13
        local ruleRaid14
        local ruleRaid15
        local ruleRaid16
        local ruleRaid17
        local ruleRaid18
        local ruleRaid19
        local ruleRaid20
        local ruleRaid21
        local ruleRaid22
        local ruleRaid23
        local ruleRaid24
        local ruleRaid25
        local ruleRaid26
        local ruleRaid27
        local ruleRaid28
        local ruleRaid29
        local ruleRaid30
        local ruleRaid31
        local ruleRaid32
        local ruleRaid33
        local ruleRaid34
        local ruleRaid35
        local ruleRaid36
        local ruleRaid37
        local ruleRaid38
        local ruleRaid39
        local ruleRaid40

=======

        --=========================REGLAS===========================--


        local ruleStart = "-- [ COMIENZAN LAS REGLAS ] --"
        local ruleRaidOne
        local ruleRaidTwo
        local ruleRaidThree
        local ruleRaidFour
        local ruleRaidFive
        local ruleRaidSix
        local ruleRaidSeven
        local ruleRaidEight
        local ruleRaidNine
        local ruleRaidTen
        local ruleRaidEleven
        local ruleRaidTwelve
        local ruleRaidThirteen
        local ruleRaidFourteen
>>>>>>> origin/master
        local ruleRaidSr1
        local ruleRaidSr2
        local ruleRaidSr3
        local bufos1
        local bufos2
        local raidcall
        local discord
        local ruleEnd	= "-- [ FIN DE LAS REGLAS ] --"
        
        --=========================REGLAS===========================--

        local manual1 = "Bienvenido a Krilin Loot Rules!"
        local manual2 = "Este addon te ayudará a gestionar las normas de tu raid, a organizar los bufos y el sistema de comunicación que se usará para su desempeño."
        local manual3 = "Para configurar este addon rellena los campos de las reglas para cada modalidad de raid y pulsa enter o aceptar, verás un mensaje en el chat confirmando que la norma ha sido añadida, si has escrito todas las normas y te sobran campos simplemente dejalos vacios y se omitirán."
        local manual4 = "Para lanzar las reglas debes usar los siguientes comandos escribiendolos en el chat, con una macro o con los botones Lanzar de cada pestaña:"
        local manual5 = "/icc  =>Para lanzar las reglas de la pestaña ICC"
        local manual6 = "/sr   =>Para lanzar las reglas de la pestaña SR"
        local manual7 = "/buf  =>Para lanzar la asignación de bufos"
        local manual8 = "/rc   =>Para lanzar el canal de RC guardado"
        local manual9 = "/dis =>Para lanzar el canal de Discord guardado"

-- Version
<<<<<<< HEAD
LootRules_Version = "1.1.0";
=======
LootRules_Version = "1.0.0";
>>>>>>> origin/master

local bunnyLDB = LibStub("LibDataBroker-1.1"):NewDataObject("Bunnies!", {
    type = "data source",
    text = "Bunnies!",
    icon = "Interface\\Icons\\INV_Inscription_Armorscroll03",
    OnClick = function(clickedframe, button)
        if button == "RightButton" then addon:CreateFrame()  end
    end,
})
local icon = LibStub("LibDBIcon-1.0")

function LootRules_OnLoad()
	-- Registrar comandos slash
	SLASH_LOOTRULESVER1 = "/lootrulesver";
	SlashCmdList["LOOTRULESVER"] = function()
			    lootrules_ShowVersion(LootRules_Version);
			 end
			
	SLASH_RAIDRULES1 = "/reglasicc";
	SLASH_RAIDRULES2 = "/iccrules";
	SLASH_RAIDRULES3 = "/icc";
	SlashCmdList["RAIDRULES"] = function()
				addon:LanzarReglasIcc();
            end
            
    SLASH_SRRAIDRULES1 = "/reglassr";
	SLASH_SRRAIDRULES2 = "/srrules";
	SLASH_SRRAIDRULES3 = "/sr";
	SlashCmdList["SRRAIDRULES"] = function()
				addon:LanzarReglasSr();
            end
    
    SLASH_BUF1 = "/buf";
	SlashCmdList["BUF"] = function()
				addon:LanzarBufos();
            end
    
    SLASH_RC1 = "/rc";
	SlashCmdList["RC"] = function()
				addon:LanzarRc();
            end

    SLASH_DISCORD1 = "/discord";
    SLASH_DISCORD2 = "/dis";
	SlashCmdList["DISCORD"] = function()
				addon:LanzarDiscord();
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





--==ONLOAD END======================================--

--==ONINITIALIZE====================================--

function addon:OnInitialize()

	self.db = LibStub("AceDB-3.0"):New("KrilinDB", {
		profile = {
			minimap = {
                hide = false,
                radius = 80,
            },
            reglas = {
                regla1 = "",
                regla2 = "",
                regla3 = "",
                regla4 = "",
                regla5 = "",
                regla6 = "",
                regla7 = "",
                regla8 = "",
                regla9 = "",
                regla10 = "",
                regla11 = "",
                regla12 = "",
                regla13 = "",
                regla14 = "",
                regla15 = "",
<<<<<<< HEAD
                regla16 = "",
                regla17 = "",
                regla18 = "",
                regla19 = "",
                regla20 = "",
                regla21 = "",
                regla22 = "",
                regla23 = "",
                regla24 = "",
                regla25 = "",
                regla26 = "",
                regla27 = "",
                regla28 = "",
                regla29 = "",
                regla30 = "",
                regla31 = "",
                regla32 = "",
                regla33 = "",
                regla34 = "",
                regla35 = "",
                regla36 = "",
                regla37 = "",
                regla38 = "",
                regla39 = "",
                regla40 = "",
=======
>>>>>>> origin/master
                reglasr1 = "",
                reglasr2 = "",
                reglasr3 = "",

            },
            voz = {
                rc = "",
                disc = "",
            },
            bufos = {
                bufs1= "",
                bufs2= "",
            },
		},
	})
	icon:Register("Bunnies!", bunnyLDB, self.db.profile.minimap)
    self:RegisterChatCommand("bunnies", "CommandTheBunnies")

end



--======================Frame=======================--


function addon:CreateFrame()

--===============Startfirst tab=================-- 
function DrawGroup1(container)
    local btn = AceGUI:Create("Button")
    btn:SetFullWidth(true)
    btn:SetText("Lanzar reglas")
    btn:SetCallback("OnClick", function()
        addon:LanzarReglasIcc()
    end
    )
    container:AddChild(btn)


    local desc = AceGUI:Create("Label")
    desc:SetText("Reglas para ICC 25")
    desc:SetFullWidth(true)
    container:AddChild(desc)


    local scrollcontainer = AceGUI:Create("SimpleGroup") -- "InlineGroup" is also good
    scrollcontainer:SetFullWidth(true)
    scrollcontainer:SetFullHeight(true) -- probably?
    scrollcontainer:SetLayout("Fill") -- important!

    container:AddChild(scrollcontainer)

    local scroll = AceGUI:Create("ScrollFrame")
    scroll:SetLayout("Flow") -- probably?
    scrollcontainer:AddChild(scroll)




<<<<<<< HEAD
            local editbox = AceGUI:Create("EditBox")
=======
            local editbox = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox:SetFullWidth(true)
        editbox:SetText(self.db.profile.reglas.regla1)
        editbox:SetMaxLetters(255)
        editbox:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid1 = editbox:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid1 .. " añadida!");
            self.db.profile.reglas.regla1 = ruleRaid1
        end)

        local editbox1 = AceGUI:Create("EditBox")
=======
            ruleRaidOne = editbox:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidOne .. " añadida!");
            self.db.profile.reglas.regla1 = ruleRaidOne
        end)

        local editbox1 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox1:SetFullWidth(true)
        editbox1:SetText(self.db.profile.reglas.regla2)
        editbox1:SetMaxLetters(255)
        editbox1:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid2 = editbox1:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid2 .. " añadida!");
            self.db.profile.reglas.regla2 = ruleRaid2
        end)

        local editbox2 = AceGUI:Create("EditBox")
=======
            ruleRaidTwo = editbox1:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidTwo .. " añadida!");
            self.db.profile.reglas.regla2 = ruleRaidTwo
        end)

        local editbox2 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox2:SetFullWidth(true)
        editbox2:SetText(self.db.profile.reglas.regla3)
        editbox2:SetMaxLetters(255)
        editbox2:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid3 = editbox2:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid3 .. " añadida!");
            self.db.profile.reglas.regla3 = ruleRaid3
        end)

        local editbox3 = AceGUI:Create("EditBox")
=======
            ruleRaidThree = editbox2:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidThree .. " añadida!");
            self.db.profile.reglas.regla3 = ruleRaidThree
        end)

        local editbox3 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox3:SetFullWidth(true)
        editbox3:SetText(self.db.profile.reglas.regla4)
        editbox3:SetMaxLetters(255)
        editbox3:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid4 = editbox3:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid4 .. " añadida!");
            self.db.profile.reglas.regla4 = ruleRaid4
        end)

        local editbox4 = AceGUI:Create("EditBox")
=======
            ruleRaidFour = editbox3:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidFour .. " añadida!");
            self.db.profile.reglas.regla4 = ruleRaidFour
        end)

        local editbox4 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox4:SetFullWidth(true)
        editbox4:SetText(self.db.profile.reglas.regla5)
        editbox4:SetMaxLetters(255)
        editbox4:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid5 = editbox4:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid5 .. " añadida!");
            self.db.profile.reglas.regla5 = ruleRaid5
        end)

        local editbox5 = AceGUI:Create("EditBox")
=======
            ruleRaidFive = editbox4:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidFive .. " añadida!");
            self.db.profile.reglas.regla5 = ruleRaidFive
        end)

        local editbox5 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox5:SetFullWidth(true)
        editbox5:SetText(self.db.profile.reglas.regla6)
        editbox5:SetMaxLetters(255)
        editbox5:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid6 = editbox5:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid6 .. " añadida!");
            self.db.profile.reglas.regla6 = ruleRaid6
        end)

        local editbox6 = AceGUI:Create("EditBox")
=======
            ruleRaidSix = editbox5:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidSix .. " añadida!");
            self.db.profile.reglas.regla6 = ruleRaidSix
        end)

        local editbox6 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox6:SetFullWidth(true)
        editbox6:SetText(self.db.profile.reglas.regla7)
        editbox6:SetMaxLetters(255)
        editbox6:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid7 = editbox6:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid7 .. " añadida!");
            self.db.profile.reglas.regla7 = ruleRaid7
        end)

        local editbox7 = AceGUI:Create("EditBox")
=======
            ruleRaidSeven = editbox6:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidSeven .. " añadida!");
            self.db.profile.reglas.regla7 = ruleRaidSeven
        end)

        local editbox7 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox7:SetFullWidth(true)
        editbox7:SetText(self.db.profile.reglas.regla8)
        editbox7:SetMaxLetters(255)
        editbox7:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid8 = editbox7:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid8 .. " añadida!");
            self.db.profile.reglas.regla8 = ruleRaid8
        end)

        local editbox8 = AceGUI:Create("EditBox")
=======
            ruleRaidEight = editbox7:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidEight .. " añadida!");
            self.db.profile.reglas.regla8 = ruleRaidEight
        end)

        local editbox8 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox8:SetFullWidth(true)
        editbox8:SetText(self.db.profile.reglas.regla9)
        editbox8:SetMaxLetters(255)
        editbox8:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid9 = editbox8:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid9 .. " añadida!");
            self.db.profile.reglas.regla9 = ruleRaid9
        end)

        local editbox9 = AceGUI:Create("EditBox")
=======
            ruleRaidNine = editbox8:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidNine .. " añadida!");
            self.db.profile.reglas.regla9 = ruleRaidNine
        end)

        local editbox9 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox9:SetFullWidth(true)
        editbox9:SetText(self.db.profile.reglas.regla10)
        editbox9:SetMaxLetters(255)
        editbox9:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid10 = editbox9:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid10 .. " añadida!");
            self.db.profile.reglas.regla10 = ruleRaid10
        end)

        local editbox10 = AceGUI:Create("EditBox")
=======
            ruleRaidTen = editbox9:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidTen .. " añadida!");
            self.db.profile.reglas.regla10 = ruleRaidTen
        end)

        local editbox10 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox10:SetFullWidth(true)
        editbox10:SetText(self.db.profile.reglas.regla11)
        editbox10:SetMaxLetters(255)
        editbox10:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid11 = editbox10:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid11 .. " añadida!");
            self.db.profile.reglas.regla11 = ruleRaid11
        end)

        local editbox11 = AceGUI:Create("EditBox")
=======
            ruleRaidEleven = editbox10:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidEleven .. " añadida!");
            self.db.profile.reglas.regla11 = ruleRaidEleven
        end)

        local editbox11 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox11:SetFullWidth(true)
        editbox11:SetText(self.db.profile.reglas.regla12)
        editbox11:SetMaxLetters(255)
        editbox11:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid12 = editbox11:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid12 .. " añadida!");
            self.db.profile.reglas.regla12 = ruleRaid12
        end)

        local editbox12 = AceGUI:Create("EditBox")
=======
            ruleRaidTwelve = editbox11:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidTwelve .. " añadida!");
            self.db.profile.reglas.regla12 = ruleRaidTwelve
        end)

        local editbox12 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox12:SetFullWidth(true)
        editbox12:SetText(self.db.profile.reglas.regla13)
        editbox12:SetMaxLetters(255)
        editbox12:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid13 = editbox12:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid13 .. " añadida!");
            self.db.profile.reglas.regla13 = ruleRaid13
        end)

        local editbox13 = AceGUI:Create("EditBox")
=======
            ruleRaidThirteen = editbox12:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidThirteen .. " añadida!");
            self.db.profile.reglas.regla13 = ruleRaidThirteen
        end)

        local editbox13 = AceGUI:Create("MultiLineEditBox")
>>>>>>> origin/master
        editbox13:SetFullWidth(true)
        editbox13:SetText(self.db.profile.reglas.regla14)
        editbox13:SetMaxLetters(255)
        editbox13:SetCallback("OnEnterPressed", function() 
<<<<<<< HEAD
            ruleRaid14 = editbox13:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid14 .. " añadida!");
            self.db.profile.reglas.regla14 = ruleRaid14
        end)
        local editbox14 = AceGUI:Create("EditBox")
        editbox14:SetFullWidth(true)
        editbox14:SetText(self.db.profile.reglas.regla15)
        editbox14:SetMaxLetters(255)
        editbox14:SetCallback("OnEnterPressed", function() 
            ruleRaid15 = editbox14:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid15 .. " añadida!");
            self.db.profile.reglas.regla15 = ruleRaid15
        end)
        local editbox15 = AceGUI:Create("EditBox")
        editbox15:SetFullWidth(true)
        editbox15:SetText(self.db.profile.reglas.regla16)
        editbox15:SetMaxLetters(255)
        editbox15:SetCallback("OnEnterPressed", function() 
            ruleRaid16 = editbox15:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid16 .. " añadida!");
            self.db.profile.reglas.regla16 = ruleRaid16
        end)
        local editbox16 = AceGUI:Create("EditBox")
        editbox16:SetFullWidth(true)
        editbox16:SetText(self.db.profile.reglas.regla17)
        editbox16:SetMaxLetters(255)
        editbox16:SetCallback("OnEnterPressed", function() 
            ruleRaid17 = editbox16:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid17 .. " añadida!");
            self.db.profile.reglas.regla17 = ruleRaid17
        end)
        local editbox17 = AceGUI:Create("EditBox")
        editbox17:SetFullWidth(true)
        editbox17:SetText(self.db.profile.reglas.regla18)
        editbox17:SetMaxLetters(255)
        editbox17:SetCallback("OnEnterPressed", function() 
            ruleRaid18 = editbox17:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid18 .. " añadida!");
            self.db.profile.reglas.regla18 = ruleRaid18
        end)
        local editbox18 = AceGUI:Create("EditBox")
        editbox18:SetFullWidth(true)
        editbox18:SetText(self.db.profile.reglas.regla19)
        editbox18:SetMaxLetters(255)
        editbox18:SetCallback("OnEnterPressed", function() 
            ruleRaid19 = editbox18:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid19 .. " añadida!");
            self.db.profile.reglas.regla19 = ruleRaid19
        end)
        local editbox19 = AceGUI:Create("EditBox")
        editbox19:SetFullWidth(true)
        editbox19:SetText(self.db.profile.reglas.regla20)
        editbox19:SetMaxLetters(255)
        editbox19:SetCallback("OnEnterPressed", function() 
            ruleRaid20 = editbox19:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid20 .. " añadida!");
            self.db.profile.reglas.regla20 = ruleRaid20
        end)
        local editbox20 = AceGUI:Create("EditBox")
        editbox20:SetFullWidth(true)
        editbox20:SetText(self.db.profile.reglas.regla21)
        editbox20:SetMaxLetters(255)
        editbox20:SetCallback("OnEnterPressed", function() 
            ruleRaid21 = editbox20:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid21 .. " añadida!");
            self.db.profile.reglas.regla21 = ruleRaid21
        end)
        local editbox21 = AceGUI:Create("EditBox")
        editbox21:SetFullWidth(true)
        editbox21:SetText(self.db.profile.reglas.regla22)
        editbox21:SetMaxLetters(255)
        editbox21:SetCallback("OnEnterPressed", function() 
            ruleRaid22 = editbox21:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid22 .. " añadida!");
            self.db.profile.reglas.regla22 = ruleRaid22
        end)
        local editbox22 = AceGUI:Create("EditBox")
        editbox22:SetFullWidth(true)
        editbox22:SetText(self.db.profile.reglas.regla23)
        editbox22:SetMaxLetters(255)
        editbox22:SetCallback("OnEnterPressed", function() 
            ruleRaid23 = editbox22:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid23 .. " añadida!");
            self.db.profile.reglas.regla23 = ruleRaid23
        end)
        local editbox23 = AceGUI:Create("EditBox")
        editbox23:SetFullWidth(true)
        editbox23:SetText(self.db.profile.reglas.regla24)
        editbox23:SetMaxLetters(255)
        editbox23:SetCallback("OnEnterPressed", function() 
            ruleRaid24 = editbox23:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid24 .. " añadida!");
            self.db.profile.reglas.regla24 = ruleRaid24
        end)
        local editbox24 = AceGUI:Create("EditBox")
        editbox24:SetFullWidth(true)
        editbox24:SetText(self.db.profile.reglas.regla25)
        editbox24:SetMaxLetters(255)
        editbox24:SetCallback("OnEnterPressed", function() 
            ruleRaid25 = editbox24:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid25 .. " añadida!");
            self.db.profile.reglas.regla25 = ruleRaid25
        end)
        local editbox25 = AceGUI:Create("EditBox")
        editbox25:SetFullWidth(true)
        editbox25:SetText(self.db.profile.reglas.regla26)
        editbox25:SetMaxLetters(255)
        editbox25:SetCallback("OnEnterPressed", function() 
            ruleRaid26 = editbox25:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid26 .. " añadida!");
            self.db.profile.reglas.regla26 = ruleRaid26
        end)
        local editbox26 = AceGUI:Create("EditBox")
        editbox26:SetFullWidth(true)
        editbox26:SetText(self.db.profile.reglas.regla27)
        editbox26:SetMaxLetters(255)
        editbox26:SetCallback("OnEnterPressed", function() 
            ruleRaid27 = editbox26:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid27 .. " añadida!");
            self.db.profile.reglas.regla27 = ruleRaid27
        end)
        local editbox27 = AceGUI:Create("EditBox")
        editbox27:SetFullWidth(true)
        editbox27:SetText(self.db.profile.reglas.regla28)
        editbox27:SetMaxLetters(255)
        editbox27:SetCallback("OnEnterPressed", function() 
            ruleRaid28 = editbox27:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid28 .. " añadida!");
            self.db.profile.reglas.regla28 = ruleRaid28
        end)
        local editbox28 = AceGUI:Create("EditBox")
        editbox28:SetFullWidth(true)
        editbox28:SetText(self.db.profile.reglas.regla29)
        editbox28:SetMaxLetters(255)
        editbox28:SetCallback("OnEnterPressed", function() 
            ruleRaid29 = editbox28:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid29 .. " añadida!");
            self.db.profile.reglas.regla29 = ruleRaid29
        end)
        local editbox29 = AceGUI:Create("EditBox")
        editbox29:SetFullWidth(true)
        editbox29:SetText(self.db.profile.reglas.regla30)
        editbox29:SetMaxLetters(255)
        editbox29:SetCallback("OnEnterPressed", function() 
            ruleRaid30 = editbox29:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid30 .. " añadida!");
            self.db.profile.reglas.regla30 = ruleRaid30
        end)
        local editbox30 = AceGUI:Create("EditBox")
        editbox30:SetFullWidth(true)
        editbox30:SetText(self.db.profile.reglas.regla31)
        editbox30:SetMaxLetters(255)
        editbox30:SetCallback("OnEnterPressed", function() 
            ruleRaid31 = editbox30:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid31 .. " añadida!");
            self.db.profile.reglas.regla31 = ruleRaid31
        end)
        local editbox31 = AceGUI:Create("EditBox")
        editbox31:SetFullWidth(true)
        editbox31:SetText(self.db.profile.reglas.regla32)
        editbox31:SetMaxLetters(255)
        editbox31:SetCallback("OnEnterPressed", function() 
            ruleRaid32 = editbox31:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid32 .. " añadida!");
            self.db.profile.reglas.regla32 = ruleRaid32
        end)
        local editbox32 = AceGUI:Create("EditBox")
        editbox32:SetFullWidth(true)
        editbox32:SetText(self.db.profile.reglas.regla33)
        editbox32:SetMaxLetters(255)
        editbox32:SetCallback("OnEnterPressed", function() 
            ruleRaid33 = editbox32:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid33 .. " añadida!");
            self.db.profile.reglas.regla33 = ruleRaid33
        end)
        local editbox33 = AceGUI:Create("EditBox")
        editbox33:SetFullWidth(true)
        editbox33:SetText(self.db.profile.reglas.regla34)
        editbox33:SetMaxLetters(255)
        editbox33:SetCallback("OnEnterPressed", function() 
            ruleRaid34 = editbox33:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid34 .. " añadida!");
            self.db.profile.reglas.regla34 = ruleRaid34
        end)
        local editbox34 = AceGUI:Create("EditBox")
        editbox34:SetFullWidth(true)
        editbox34:SetText(self.db.profile.reglas.regla35)
        editbox34:SetMaxLetters(255)
        editbox34:SetCallback("OnEnterPressed", function() 
            ruleRaid35 = editbox34:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid35 .. " añadida!");
            self.db.profile.reglas.regla35 = ruleRaid35
        end)
        local editbox35 = AceGUI:Create("EditBox")
        editbox35:SetFullWidth(true)
        editbox35:SetText(self.db.profile.reglas.regla36)
        editbox35:SetMaxLetters(255)
        editbox35:SetCallback("OnEnterPressed", function() 
            ruleRaid36 = editbox35:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid36 .. " añadida!");
            self.db.profile.reglas.regla36 = ruleRaid36
        end)
        local editbox36 = AceGUI:Create("EditBox")
        editbox36:SetFullWidth(true)
        editbox36:SetText(self.db.profile.reglas.regla37)
        editbox36:SetMaxLetters(255)
        editbox36:SetCallback("OnEnterPressed", function() 
            ruleRaid37 = editbox36:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid37 .. " añadida!");
            self.db.profile.reglas.regla37 = ruleRaid37
        end)
        local editbox37 = AceGUI:Create("EditBox")
        editbox37:SetFullWidth(true)
        editbox37:SetText(self.db.profile.reglas.regla38)
        editbox37:SetMaxLetters(255)
        editbox37:SetCallback("OnEnterPressed", function() 
            ruleRaid38 = editbox37:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid38 .. " añadida!");
            self.db.profile.reglas.regla38 = ruleRaid38
        end)
        local editbox38 = AceGUI:Create("EditBox")
        editbox38:SetFullWidth(true)
        editbox38:SetText(self.db.profile.reglas.regla39)
        editbox38:SetMaxLetters(255)
        editbox38:SetCallback("OnEnterPressed", function() 
            ruleRaid39 = editbox38:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid39 .. " añadida!");
            self.db.profile.reglas.regla39 = ruleRaid39
        end)
        local editbox39 = AceGUI:Create("EditBox")
        editbox39:SetFullWidth(true)
        editbox39:SetText(self.db.profile.reglas.regla40)
        editbox39:SetMaxLetters(255)
        editbox39:SetCallback("OnEnterPressed", function() 
            ruleRaid40 = editbox39:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaid40 .. " añadida!");
            self.db.profile.reglas.regla40 = ruleRaid40
=======
            ruleRaidFourteen = editbox13:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidFourteen .. " añadida!");
            self.db.profile.reglas.regla14 = ruleRaidFourteen
>>>>>>> origin/master
        end)

        scroll:AddChild(editbox)
        scroll:AddChild(editbox1)
        scroll:AddChild(editbox2)
        scroll:AddChild(editbox3)
        scroll:AddChild(editbox4)
        scroll:AddChild(editbox5)
        scroll:AddChild(editbox6)
        scroll:AddChild(editbox7)
        scroll:AddChild(editbox8)
        scroll:AddChild(editbox9)
        scroll:AddChild(editbox10)
        scroll:AddChild(editbox11)
        scroll:AddChild(editbox12)
        scroll:AddChild(editbox13)
<<<<<<< HEAD
        scroll:AddChild(editbox14)
        scroll:AddChild(editbox15)
        scroll:AddChild(editbox16)
        scroll:AddChild(editbox17)
        scroll:AddChild(editbox18)
        scroll:AddChild(editbox19)
        scroll:AddChild(editbox20)
        scroll:AddChild(editbox21)
        scroll:AddChild(editbox22)
        scroll:AddChild(editbox23)
        scroll:AddChild(editbox24)
        scroll:AddChild(editbox25)
        scroll:AddChild(editbox26)
        scroll:AddChild(editbox27)
        scroll:AddChild(editbox28)
        scroll:AddChild(editbox29)
        scroll:AddChild(editbox30)
        scroll:AddChild(editbox31)
        scroll:AddChild(editbox32)
        scroll:AddChild(editbox33)
        scroll:AddChild(editbox34)
        scroll:AddChild(editbox35)
        scroll:AddChild(editbox36)
        scroll:AddChild(editbox37)
        scroll:AddChild(editbox38)
        scroll:AddChild(editbox39)
        scroll:AddChild(editbox40)

=======
>>>>>>> origin/master
    
  end
  --===============End first tab=================-- 

  --=============Start second tab================-- 

  function DrawGroup2(container)
    local btn = AceGUI:Create("Button")
    btn:SetFullWidth(true)
    btn:SetText("Lanzar reglas")
    btn:SetCallback("OnClick", function()
        addon:LanzarReglasSr()
    end
    )
    container:AddChild(btn)

    local desc = AceGUI:Create("Label")
    desc:SetText("Reglas para SR 25")
    desc:SetFullWidth(true)
    container:AddChild(desc)

    local scrollcontainer = AceGUI:Create("SimpleGroup") -- "InlineGroup" is also good
    scrollcontainer:SetFullWidth(true)
    scrollcontainer:SetFullHeight(true) -- probably?
    scrollcontainer:SetLayout("Fill") -- important!

    container:AddChild(scrollcontainer)

    local scroll = AceGUI:Create("ScrollFrame")
    scroll:SetLayout("Flow") -- probably?
    scrollcontainer:AddChild(scroll)



    local editboxsr1 = AceGUI:Create("MultiLineEditBox")
    editboxsr1:SetFullWidth(true)
    editboxsr1:SetText(self.db.profile.reglas.reglasr1)
    editboxsr1:SetMaxLetters(255)
    editboxsr1:SetCallback("OnEnterPressed", function() 
        ruleRaidSr1 = editboxsr1:GetText()
        DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidSr1 .. " añadida!");
        self.db.profile.reglas.reglasr1 = ruleRaidSr1
    end)

    local editboxsr2 = AceGUI:Create("MultiLineEditBox")
    editboxsr2:SetFullWidth(true)
    editboxsr2:SetText(self.db.profile.reglas.reglasr2)
    editboxsr2:SetMaxLetters(255)
    editboxsr2:SetCallback("OnEnterPressed", function() 
        ruleRaidSr2 = editboxsr2:GetText()
        DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidSr2 .. " añadida!");
        self.db.profile.reglas.reglasr2 = ruleRaidSr2
    end)

    local editboxsr3 = AceGUI:Create("MultiLineEditBox")
    editboxsr3:SetFullWidth(true)
    editboxsr3:SetText(self.db.profile.reglas.reglasr3)
    editboxsr3:SetMaxLetters(255)
    editboxsr3:SetCallback("OnEnterPressed", function() 
        ruleRaidSr3 = editboxsr3:GetText()
        DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidSr3 .. " añadida!");
        self.db.profile.reglas.reglasr3 = ruleRaidSr3
    end)

    scroll:AddChild(editboxsr1)
    scroll:AddChild(editboxsr2)
    scroll:AddChild(editboxsr3)

  end

  --==============End second tab================--

  --=============Start third tab================-- 

    function DrawGroup3(container)
        local btn = AceGUI:Create("Button")
        btn:SetFullWidth(true)
        btn:SetText("Lanzar Bufos")
        btn:SetCallback("OnClick", function()
        addon:LanzarBufos()
        end
        )
        container:AddChild(btn)

        local desc = AceGUI:Create("Label")
        desc:SetText("Bufos para la raid")
        desc:SetFullWidth(true)
        container:AddChild(desc)

        local scrollcontainer = AceGUI:Create("SimpleGroup") -- "InlineGroup" is also good
        scrollcontainer:SetFullWidth(true)
        scrollcontainer:SetFullHeight(true) -- probably?
        scrollcontainer:SetLayout("Fill") -- important!
    
        container:AddChild(scrollcontainer)
    
        local scroll = AceGUI:Create("ScrollFrame")
        scroll:SetLayout("Flow") -- probably?
        scrollcontainer:AddChild(scroll)

        local editboxbuf1 = AceGUI:Create("MultiLineEditBox")
        editboxbuf1:SetFullWidth(true)
        editboxbuf1:SetText(self.db.profile.bufos.bufs1)
        editboxbuf1:SetMaxLetters(255)
        editboxbuf1:SetCallback("OnEnterPressed", function() 
            bufos1 = editboxbuf1:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Bufos " .. bufos1 .. " añadido!");
            self.db.profile.bufos.bufs1 = bufos1
        end)
    
        local editboxbuf2 = AceGUI:Create("MultiLineEditBox")
        editboxbuf2:SetFullWidth(true)
        editboxbuf2:SetText(self.db.profile.bufos.bufs1)
        editboxbuf2:SetMaxLetters(255)
        editboxbuf2:SetCallback("OnEnterPressed", function() 
            bufos2 = editboxbuf2:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Bufos " .. bufos2 .. " añadido!");
            self.db.profile.bufos.bufs1 = bufos2
        end)
    
        scroll:AddChild(editboxbuf1)
        scroll:AddChild(editboxbuf2)

        


      end
    
    --==============End third tab================--

    --============Start fourth tab===============-- 

    function DrawGroup4(container)
        local desc = AceGUI:Create("Label")
        desc:SetText("Sistemas de comunicación")
        desc:SetFullWidth(true)
        container:AddChild(desc)
        
        
        local editboxrc = AceGUI:Create("EditBox")
        editboxrc:SetFullWidth(true)
        editboxrc:SetLabel("RaidCall")
        editboxrc:SetText(self.db.profile.voz.rc)
        editboxrc:SetMaxLetters(255)
        editboxrc:SetCallback("OnEnterPressed", function() 
            raidcall = editboxrc:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("RC " .. raidcall .. " añadido!");
            self.db.profile.voz.rc = raidcall
        end)
        container:AddChild(editboxrc)
        
        local btn = AceGUI:Create("Button")
        btn:SetFullWidth(true)
        btn:SetText("Lanzar RC")
        btn:SetCallback("OnClick", function()
        addon:LanzarRc()
        end
        )
        container:AddChild(btn)

        
        local editboxdisc = AceGUI:Create("EditBox")
        editboxdisc:SetFullWidth(true)
        editboxdisc:SetLabel("Discord")
        editboxdisc:SetText(self.db.profile.voz.disc)
        editboxdisc:SetMaxLetters(255)
        editboxdisc:SetCallback("OnEnterPressed", function() 
            discord = editboxdisc:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Discord " .. discord .. " añadido!");
            self.db.profile.voz.disc = discord
        end)
        container:AddChild(editboxdisc)
        
        local btndis = AceGUI:Create("Button")
        btndis:SetText("Lanzar Discord")
        btndis:SetFullWidth(true)
        btndis:SetCallback("OnClick", function()
        addon:LanzarDiscord()
        end
        )
        container:AddChild(btndis)

      end
    
    --=============End fourth tab===============--

    --============Start fiveth tab===============-- 

    function DrawGroup5(container)
        local desc = AceGUI:Create("Label")
        desc:SetText(manual1)
        desc:SetFullWidth(true)
        container:AddChild(desc)

        local desc1 = AceGUI:Create("Label")
        desc1:SetText(manual2)
        desc1:SetFullWidth(true)
        container:AddChild(desc1)

        local desc2 = AceGUI:Create("Label")
        desc2:SetText(manual3)
        desc2:SetFullWidth(true)
        container:AddChild(desc2)

        local desc3 = AceGUI:Create("Label")
        desc3:SetText(manual4)
        desc3:SetFullWidth(true)
        container:AddChild(desc3)

        local desc4 = AceGUI:Create("Label")
        desc4:SetText(manual5)
        desc4:SetFullWidth(true)
        container:AddChild(desc4)

        local desc5 = AceGUI:Create("Label")
        desc5:SetText(manual6)
        desc5:SetFullWidth(true)
        container:AddChild(desc5)

        local desc6 = AceGUI:Create("Label")
        desc6:SetText(manual7)
        desc6:SetFullWidth(true)
        container:AddChild(desc6)

        local desc7 = AceGUI:Create("Label")
        desc7:SetText(manual8)
        desc7:SetFullWidth(true)
        container:AddChild(desc7)

        local desc8 = AceGUI:Create("Label")
        desc8:SetText(manual9)
        desc8:SetFullWidth(true)
        container:AddChild(desc8)
        
        
      end
    
    --=============End fiveth tab===============--
  
  -- Callback function for OnGroupSelected
  function SelectGroup(container, event, group)
    container:ReleaseChildren()
    if group == "tab1" then
        DrawGroup1(container)
    elseif group == "tab2" then
        DrawGroup2(container)
    elseif group == "tab3" then
        DrawGroup3(container)
    elseif group == "tab4" then
        DrawGroup4(container)
    elseif group == "tab5" then
        DrawGroup5(container)
    end
  end
  
  -- Create the frame container
  local frame = AceGUI:Create("Frame")
  frame:SetTitle("Krilin Loot Rules")
  frame:SetWidth(400)
  frame:SetHeight(600)
<<<<<<< HEAD
  frame:SetStatusText("Krilin loot rules v-1.1.0")
=======
  frame:SetStatusText("Krilin loot rules v-1.0.0")
>>>>>>> origin/master
  frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
  -- Fill Layout - the TabGroup widget will fill the whole frame
  frame:SetLayout("Fill")
 


  -- Create the TabGroup
  local tab =  AceGUI:Create("TabGroup")
  tab:SetLayout("Flow")
  -- Setup which tabs to show
  tab:SetTabs({{text="ICC 25", value="tab1"}, {text="SR 25", value="tab2"}, {text="Buffs", value="tab3"}, {text="RC/D", value="tab4"}, {text="Info", value="tab5"}})
  -- Register callback
  tab:SetCallback("OnGroupSelected", SelectGroup)
  -- Set initial Tab (this will fire the OnGroupSelected callback)
  tab:SelectTab("tab1")
  
  -- add to the frame container
  frame:AddChild(tab)


end


--================Funciones Lanzar reglas=============--

function addon:LanzarReglasIcc()



  if IsRaidLeader() or IsRaidOfficer() then

  SendChatMessage( ruleStart, "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla1 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla2 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla3 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla4 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla5 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla6 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla7 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla8 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla9 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla10 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla11 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla12 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla13 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla14 , "RAID_WARNING" );
<<<<<<< HEAD
  SendChatMessage( self.db.profile.reglas.regla15 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla16 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla17 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla18 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla19 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla20 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla21 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla22 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla23 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla24 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla25 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla26 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla27 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla28 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla29 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla30 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla31 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla32 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla33 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla34 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla35 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla36 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla37 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla38 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla39 , "RAID_WARNING" );
  SendChatMessage( self.db.profile.reglas.regla40 , "RAID_WARNING" );
=======
>>>>>>> origin/master
  SendChatMessage( ruleEnd , "RAID_WARNING" );

  else

  -- Mensajes de error
      if (DEFAULT_CHAT_FRAME) then
      DEFAULT_CHAT_FRAME:AddMessage("Debes de ser lider de banda o ayudante para mandar alertas");
      else
      message("Debes de ser lider de banda o ayudante para mandar alertas");
      end
  end
end



function addon:LanzarReglasSr()


    if IsRaidLeader() or IsRaidOfficer() then
  
    SendChatMessage( ruleStart, "RAID_WARNING" );
    SendChatMessage( self.db.profile.reglas.reglasr1 , "RAID_WARNING" );
    SendChatMessage( self.db.profile.reglas.reglasr2 , "RAID_WARNING" );
    SendChatMessage( self.db.profile.reglas.reglasr3 , "RAID_WARNING" );
    SendChatMessage( ruleEnd , "RAID_WARNING" );
  
    else
  
    -- Mensajes de error
        if (DEFAULT_CHAT_FRAME) then
        DEFAULT_CHAT_FRAME:AddMessage("Debes de ser lider de banda o ayudante para mandar alertas");
        else
        message("Debes de ser lider de banda o ayudante para mandar alertas");
        end
    end
  end


  function addon:LanzarBufos()


    if IsRaidLeader() or IsRaidOfficer() then
  
    SendChatMessage( "BUFOS", "RAID_WARNING" );
    SendChatMessage( self.db.profile.bufos.bufs1 , "RAID_WARNING" );
    SendChatMessage( self.db.profile.bufos.bufs1 , "RAID_WARNING" );
  
    else
  
    -- Mensajes de error
        if (DEFAULT_CHAT_FRAME) then
        DEFAULT_CHAT_FRAME:AddMessage("Debes de ser lider de banda o ayudante para mandar alertas");
        else
        message("Debes de ser lider de banda o ayudante para mandar alertas");
        end
    end
  end


  function addon:LanzarRc()


    if IsRaidLeader() or IsRaidOfficer() then
  
    SendChatMessage( "ATENCIÓN RC", "RAID_WARNING" );
    SendChatMessage( self.db.profile.voz.rc , "RAID_WARNING" );
    SendChatMessage( "OBLIGATORIO" , "RAID_WARNING" );
  
    else
  
    -- Mensajes de error
        if (DEFAULT_CHAT_FRAME) then
        DEFAULT_CHAT_FRAME:AddMessage("Debes de ser lider de banda o ayudante para mandar alertas");
        else
        message("Debes de ser lider de banda o ayudante para mandar alertas");
        end
    end
  end

  function addon:LanzarDiscord()


    if IsRaidLeader() or IsRaidOfficer() then
  
    SendChatMessage( "ATENCIÓN DISCORD", "RAID_WARNING" );
    SendChatMessage( self.db.profile.voz.disc , "RAID_WARNING" );
    SendChatMessage( "OBLIGATORIO" , "RAID_WARNING" );
  
    else
  
    -- Mensajes de error
        if (DEFAULT_CHAT_FRAME) then
        DEFAULT_CHAT_FRAME:AddMessage("Debes de ser lider de banda o ayudante para mandar alertas");
        else
        message("Debes de ser lider de banda o ayudante para mandar alertas");
        end
    end
  end

















