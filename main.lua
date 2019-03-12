local addon = LibStub("AceAddon-3.0"):NewAddon("KrilinLootRules", "AceConsole-3.0", "AceEvent-3.0")
local AceGUI = LibStub("AceGUI-3.0")


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
LootRules_Version = "1.0.0";

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




            local editbox = AceGUI:Create("MultiLineEditBox")
        editbox:SetFullWidth(true)
        editbox:SetText(self.db.profile.reglas.regla1)
        editbox:SetMaxLetters(255)
        editbox:SetCallback("OnEnterPressed", function() 
            ruleRaidOne = editbox:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidOne .. " añadida!");
            self.db.profile.reglas.regla1 = ruleRaidOne
        end)

        local editbox1 = AceGUI:Create("MultiLineEditBox")
        editbox1:SetFullWidth(true)
        editbox1:SetText(self.db.profile.reglas.regla2)
        editbox1:SetMaxLetters(255)
        editbox1:SetCallback("OnEnterPressed", function() 
            ruleRaidTwo = editbox1:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidTwo .. " añadida!");
            self.db.profile.reglas.regla2 = ruleRaidTwo
        end)

        local editbox2 = AceGUI:Create("MultiLineEditBox")
        editbox2:SetFullWidth(true)
        editbox2:SetText(self.db.profile.reglas.regla3)
        editbox2:SetMaxLetters(255)
        editbox2:SetCallback("OnEnterPressed", function() 
            ruleRaidThree = editbox2:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidThree .. " añadida!");
            self.db.profile.reglas.regla3 = ruleRaidThree
        end)

        local editbox3 = AceGUI:Create("MultiLineEditBox")
        editbox3:SetFullWidth(true)
        editbox3:SetText(self.db.profile.reglas.regla4)
        editbox3:SetMaxLetters(255)
        editbox3:SetCallback("OnEnterPressed", function() 
            ruleRaidFour = editbox3:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidFour .. " añadida!");
            self.db.profile.reglas.regla4 = ruleRaidFour
        end)

        local editbox4 = AceGUI:Create("MultiLineEditBox")
        editbox4:SetFullWidth(true)
        editbox4:SetText(self.db.profile.reglas.regla5)
        editbox4:SetMaxLetters(255)
        editbox4:SetCallback("OnEnterPressed", function() 
            ruleRaidFive = editbox4:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidFive .. " añadida!");
            self.db.profile.reglas.regla5 = ruleRaidFive
        end)

        local editbox5 = AceGUI:Create("MultiLineEditBox")
        editbox5:SetFullWidth(true)
        editbox5:SetText(self.db.profile.reglas.regla6)
        editbox5:SetMaxLetters(255)
        editbox5:SetCallback("OnEnterPressed", function() 
            ruleRaidSix = editbox5:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidSix .. " añadida!");
            self.db.profile.reglas.regla6 = ruleRaidSix
        end)

        local editbox6 = AceGUI:Create("MultiLineEditBox")
        editbox6:SetFullWidth(true)
        editbox6:SetText(self.db.profile.reglas.regla7)
        editbox6:SetMaxLetters(255)
        editbox6:SetCallback("OnEnterPressed", function() 
            ruleRaidSeven = editbox6:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidSeven .. " añadida!");
            self.db.profile.reglas.regla7 = ruleRaidSeven
        end)

        local editbox7 = AceGUI:Create("MultiLineEditBox")
        editbox7:SetFullWidth(true)
        editbox7:SetText(self.db.profile.reglas.regla8)
        editbox7:SetMaxLetters(255)
        editbox7:SetCallback("OnEnterPressed", function() 
            ruleRaidEight = editbox7:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidEight .. " añadida!");
            self.db.profile.reglas.regla8 = ruleRaidEight
        end)

        local editbox8 = AceGUI:Create("MultiLineEditBox")
        editbox8:SetFullWidth(true)
        editbox8:SetText(self.db.profile.reglas.regla9)
        editbox8:SetMaxLetters(255)
        editbox8:SetCallback("OnEnterPressed", function() 
            ruleRaidNine = editbox8:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidNine .. " añadida!");
            self.db.profile.reglas.regla9 = ruleRaidNine
        end)

        local editbox9 = AceGUI:Create("MultiLineEditBox")
        editbox9:SetFullWidth(true)
        editbox9:SetText(self.db.profile.reglas.regla10)
        editbox9:SetMaxLetters(255)
        editbox9:SetCallback("OnEnterPressed", function() 
            ruleRaidTen = editbox9:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidTen .. " añadida!");
            self.db.profile.reglas.regla10 = ruleRaidTen
        end)

        local editbox10 = AceGUI:Create("MultiLineEditBox")
        editbox10:SetFullWidth(true)
        editbox10:SetText(self.db.profile.reglas.regla11)
        editbox10:SetMaxLetters(255)
        editbox10:SetCallback("OnEnterPressed", function() 
            ruleRaidEleven = editbox10:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidEleven .. " añadida!");
            self.db.profile.reglas.regla11 = ruleRaidEleven
        end)

        local editbox11 = AceGUI:Create("MultiLineEditBox")
        editbox11:SetFullWidth(true)
        editbox11:SetText(self.db.profile.reglas.regla12)
        editbox11:SetMaxLetters(255)
        editbox11:SetCallback("OnEnterPressed", function() 
            ruleRaidTwelve = editbox11:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidTwelve .. " añadida!");
            self.db.profile.reglas.regla12 = ruleRaidTwelve
        end)

        local editbox12 = AceGUI:Create("MultiLineEditBox")
        editbox12:SetFullWidth(true)
        editbox12:SetText(self.db.profile.reglas.regla13)
        editbox12:SetMaxLetters(255)
        editbox12:SetCallback("OnEnterPressed", function() 
            ruleRaidThirteen = editbox12:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidThirteen .. " añadida!");
            self.db.profile.reglas.regla13 = ruleRaidThirteen
        end)

        local editbox13 = AceGUI:Create("MultiLineEditBox")
        editbox13:SetFullWidth(true)
        editbox13:SetText(self.db.profile.reglas.regla14)
        editbox13:SetMaxLetters(255)
        editbox13:SetCallback("OnEnterPressed", function() 
            ruleRaidFourteen = editbox13:GetText()
            DEFAULT_CHAT_FRAME:AddMessage("Regla " .. ruleRaidFourteen .. " añadida!");
            self.db.profile.reglas.regla14 = ruleRaidFourteen
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
  frame:SetStatusText("Krilin loot rules v-1.0.0")
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

















