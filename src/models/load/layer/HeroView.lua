local HeroView = class("HeroView", gp.BaseNode)

function HeroView:ctor()
	HeroView.super.ctor(self)
	self:setCatchTouch(true)
	self:_initUI()
end

function HeroView:onEnter(  )
	gp.TickMgr:register(self)
end

function HeroView:onExit(  )
	gp.TickMgr:unRegister(self)
end

function HeroView:_initUI(  )
	local nameBg = gp.Sprite:create("login_kuang-1.png")
	nameBg:setScale(0.7)
	self:addChild(nameBg)
	_VLP(nameBg, self, vl.CENTER, cc.p(300,250))

	local nameBg2 = gp.Sprite:create("login_dadikuang.png")
	self:addChild(nameBg2)
	_VLP(nameBg2, self, vl.CENTER, cc.p(300,120))

	self.num = 1
	self.label2 = gp.Label:create("", 20)
	self:addChild(self.label2,3)
	--self.label2:setAnchorPoint(cc.p(0,0.5))
	_VLP(self.label2, self, vl.CENTER, cc.p(300,250))
	self.label5 = gp.Label:create("", 20)
	self:addChild(self.label5,3)
	self.label5:setAnchorPoint(cc.p(0,1))
	_VLP(self.label5, self, vl.CENTER, cc.p(300,120))
	self.label5:setDimensions(160,0)

	self.proBarList = {}

	local function _btn1Click( sender )
		local tag = sender:getTag()
		if tag==1001 then
			GMODEL(MOD.LOAD):getSaveData().selectHero[1] = {zhiwei = 1 , id = 6,level = 1, jinyan = 5,yifu = 0,wuqi = 0,kuzi = 0,shoutao = 0,xianglian = 0,xiezi = 0}
			JOWinMgr:Instance():showWin(MCLASS(MOD.LOAD, "MainScene").new(), gd.LAYER_SCENE)
			JOWinMgr:Instance():removeWin(self)
		elseif tag==1002 then
			JOWinMgr:Instance():showWin(MCLASS(MOD.LOAD, "StartGameView").new(), gd.LAYER_SCENE)
			JOWinMgr:Instance():removeWin(self)
			-- to StartGame
		elseif tag==1003 then			
			self.num=self.num-1
			if self.num<1 then
				self.num=4
			end
			self:selHero()
		elseif tag==1004 then
			-- self.label2:setVisible(false)
			-- self.label5:setVisible(false)
			self.num=self.num+1
			if self.num>4 then
				self.num=1
			end
			self:selHero()
		end
	end
	self.okBtn = gp.Button:create("login_anniu1.png",_btn1Click)
	self.okBtn:setScale(0.7)
	self:addChild(self.okBtn)
	_VLP(self.okBtn, self, vl.CENTER, cc.p(0,-200))
	self.okBtn:setTag(1001)
	self.okBtn:setCatchTouch(false)

	self.okLabel = gp.Label:create("确认", 20)
	self:addChild(self.okLabel)
	_VLP(self.okLabel, self, vl.CENTER, cc.p(0,-200))

	local backBtn = gp.Button:create("login_anniu-bing_fanhuiover.png",_btn1Click)
	self:addChild(backBtn)
	_VLP(backBtn, self, vl.CENTER, cc.p(-360,240))
	backBtn:setTag(1002)	

	local leftBtn = gp.Button:create("login_qiehuanjian2.png",_btn1Click)
	self:addChild(leftBtn)
	_VLP(leftBtn, self, vl.CENTER, cc.p(-180,0))
	leftBtn:setTag(1003)

	local rightBtn = gp.Button:create("login_qiehuanjian.png",_btn1Click)
	self:addChild(rightBtn)
	_VLP(rightBtn, self, vl.CENTER, cc.p(180,0))
	rightBtn:setTag(1004)

	local tab={"力量","体质","敏捷","专注","智力"}
	for i=1,5 do
		local label = gp.Label:create(tab[i], 20)
		self:addChild(label, 3)
		_VLP(label, self, vl.CENTER, cc.p(-450,-30*i))

		local bar = gp.ScaleLoadingBar.new("login_xuetiao-di.png", "login_xuetiao.png")
		
		self:addChild(bar, 3)
		_VLP(bar, self, vl.CENTER, cc.p(-450+130,-30*i))
		table.insert(self.proBarList, bar)
	end

	self:selHero()
end

function HeroView:selHero(  )	

	local ailichakaduo={20,30,50,40,90}
	local jishucao={70,40,30,60,50}
	local shanshiji={90,40,50,40,20}
	local lvzai={80,70,20,50,30}

	

	local rennumid = 0
	if self.num==1 then
		rennumid = 5
		local dataCoder = JODataPool:Instance():getDataCoder()
		dataCoder:putInt(self.num)
		gp.MessageMgr:dispatchEvent(gei.LOAD_SEL_HERO, dataCoder)
		self.okBtn:setCatchTouch(false)
		self.okLabel:setString("请购买")
		for i,v in ipairs(self.proBarList) do
			v:setPercent(ailichakaduo[i])
		end
		
	elseif self.num==2 then
		rennumid = 6
		local dataCoder = JODataPool:Instance():getDataCoder()
		dataCoder:putInt(self.num)
		gp.MessageMgr:dispatchEvent(gei.LOAD_SEL_HERO, dataCoder)
		self.okBtn:setCatchTouch(true)
		self.okLabel:setString("确认")
		for i,v in ipairs(self.proBarList) do
			v:setPercent(jishucao[i])
		end
	elseif self.num==3 then	
		rennumid = 4
		local dataCoder = JODataPool:Instance():getDataCoder()
		dataCoder:putInt(self.num)
		gp.MessageMgr:dispatchEvent(gei.LOAD_SEL_HERO, dataCoder)
		self.okBtn:setCatchTouch(false)
		self.okLabel:setString("请购买")
		for i,v in ipairs(self.proBarList) do
			v:setPercent(lvzai[i])
		end
	elseif self.num==4 then
		rennumid = 8
		local dataCoder = JODataPool:Instance():getDataCoder()
		dataCoder:putInt(self.num)
		gp.MessageMgr:dispatchEvent(gei.LOAD_SEL_HERO, dataCoder)
		self.okBtn:setCatchTouch(false)
		self.okLabel:setString("请购买")
		for i,v in ipairs(self.proBarList) do
			v:setPercent(shanshiji[i])
		end
	end
	if Ref.HeroData.hero then
		for i,v in ipairs(Ref.HeroData.hero) do
			if v.id == rennumid then
				self.label5:setString(v.IntelligenceDevelopment)
				self.label2:setString(v.name)
				break
			end
		end
	end

end

return HeroView

