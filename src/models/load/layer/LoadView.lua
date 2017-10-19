
local LoadView = class("LoadView", gp.BaseNode)



function LoadView:ctor()
	LoadView.super.ctor(self)

	self:_initUI()

end

function LoadView:_initUI(  )
	local bg = gp.Sprite:create("load.png")
	self:addChild(bg)
	_VLP(bg)

	self.bar = gp.ScaleLoadingBar.new("jindutiaoBG.png", "jindutiao.png")
	self.bar:setMinMaxVal(0, 14)
	self:addChild(self.bar)
	_VLP(self.bar, self, vl.CENTER, cc.p(0, -260))

	self.count = 0
end

function LoadView:tick(  )
	self.count = self.count+1
	self.bar:setCurVal(self.count)
	if self.count == 2 then
        gp.AudioMgr.preloadMusic("pub/audio/music/a_chooselevel.mp3")
    elseif self.count == 4 then
        audio.preloadMusic("pub/audio/music/a_chuangjue.mp3")
    elseif self.count == 6 then
        audio.preloadMusic("pub/audio/music/a_gulangyumusic.mp3")
    elseif self.count == 8 then
        audio.preloadMusic("pub/audio/music/a_shamomusic.mp3")
    elseif self.count == 10 then
        audio.preloadMusic("pub/audio/music/a_yechangmusic.mp3")
    elseif self.count == 12 then
    	loadLuaFile("pub/ref/HeroData")
        loadLuaFile("pub/ref/TMXData")
        loadLuaFile("pub/ref/ShenJiData")
    elseif self.count == 14 then
        audio.preloadMusic("pub/audio/music/a_yueyemusic.mp3")
       	
        JOWinMgr:Instance():showWin(MCLASS(MOD.LOAD, "StartGameView").new(), gd.LAYER_SCENE)

        --[[
        if #SaveData.selectHero == 0 then
            local docpath = cc.FileUtils:getInstance():getWritablePath() .. "hero.txt"
            if cc.FileUtils:getInstance():isFileExist(docpath)==false then
                local scene = StartGame.new()
                cc.Director:getInstance():replaceScene(scene)
            else
                local scene = MainScene.new()
                local turn = cc.TransitionPageTurn:create(1, scene, false)
                cc.Director:getInstance():replaceScene(turn)
            end
        end
        --]]
        self.count = 0
        gp.TickMgr:unRegister(self)
    end
end

function LoadView:onEnter(  )
	LoadView.super.onEnter(self)
	gp.TickMgr:register(self)
end

function LoadView:onExit(  )
	gp.TickMgr:unRegister(self)
	LoadView.super.onExit(self)
end
--[[
function LoadView:_initLayer(  )
	local layer = MCLASS(MOD.FIGHT, "FightBgBaseLayer").new()
	layer:setBgImg("back1_1.png", "back1_2.png")
	layer:setSpeed(100)
	self:setLayer(layer, 1)
	layer = MCLASS(MOD.FIGHT, "FightBgBaseLayer").new()
	layer:setBgImg("back2_1.png", "back2_2.png")
	layer:setSpeed(40)
	self:setLayer(layer, 2)
	layer = MCLASS(MOD.FIGHT, "FightBgBaseLayer").new()
	layer:setBgImg("back3_1.png", "back3_2.png")
	layer:setSpeed(60)
	layer:setIsUp(true)
	self:setLayer(layer, 3)

	GMODEL(MOD.FIGHT).bulletMgr:setBulletParent(self)
end

function LoadView:setSpeedWithLayer(speed, layerId)	
	local tmpLayer = self.layerMap[layerId]
	if tmpLayer then
		tmpLayer:setSpeed(speed)
	end	
end

function LoadView:setLayer(layer, layerId)
	local tmpLayer = self.layerMap[layerId]
	if tmpLayer then
		tmpLayer:removeFromParent()
	end
	if layer then
		self.layerMap[layerId] = layer
		self:addChild(layer, BACKGROUND_LAYER_TAG)
		_VLP(layer, self)
	end
end
--]]
return LoadView

