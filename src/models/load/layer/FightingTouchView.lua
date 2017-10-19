
local FightingTouchView = class("FightingTouchView", gp.BaseNode)

tagDirection = {
	rocker_STARY=0,
	rocker_RIGHT=1,
	rocker_UP=2,
	rocker_LEFT=3,
	rocker_DOWN=4,
	rocker_LEFT_UP=5,
	rocker_LEFT_DOWN=6,
	rocker_RIGHT_UP=7,
	rocker_RIGHT_DOWN=8
}


function FightingTouchView:ctor(m,n,map,boshu,yidongbi)--class中实现的时候多了一个参数，所以第二个位置才开始接收参数
	FightingTouchView.super.ctor(self)
	self:setCatchTouch(true)
	self:setContentSize(gd.VISIBLE_SIZE)
	self.boshu = boshu
	self.yidongbi = yidongbi
	self.hero = m
	self.diren = n
	-- dump(h)
	self.Map = map
	self.NoGoLayer = self.Map:getLayer("block") 
	print(m:getPositionX())
	self.move = 0

	--摇杆
	self:initRocker()
	--技能
	self:initSkills()

	local function _btnCall( sender )
		cc.Director:getInstance():pause()--暂停
		--to show pause view
	end
	local pauseBtn = gp.Button:create("anniu_zanting.png",_btnCall)
	self:addChild(pauseBtn)
	_VLP(pauseBtn, self, vl.IN_TR, cc.p(-50,-50))
	
	

	self.checkHitCallSn = nil
	
	
	self.rockerCallSn = nil--gp.TickMgr:loopCall( 0.1, 0.1, handler(self,self.rockerCall))

	self.skill1HitCallSn = nil
	self.skill2HitCallSn = nil
end

function FightingTouchView:skill2HitCall( )
	if self.hero.isPutSkills == false then
		gp.TickMgr:stopLoopCall(self.skill2HitCallSn)
		self.skill2HitCallSn = nil
	end
	-- print("敌人数组大小" .. #self.diren)
	for i=1,#self.diren do
		if self.diren[i].isDie then
			--敌人死亡了
		else
			if math.abs(self.hero:getPositionY()-self.diren[i]:getPositionY()) < 30 then
				if self.hero.isPutSkills == true then
					if self.shape4 ~= nil then
						self.shape4:removeFromParent()
						self.shape4 = nil
					end
					local bound = self.hero.jineng:getBoundingBox()
					local p = cc.p(bound.x,bound.y)
					-- dump(bound)
					local m = self.hero:convertToWorldSpace(p)
					local juxin1
					if self.hero:getScaleX() > 0 then
						juxin1 = cc.rect(m.x + 0.5*bound.width* math.abs(self.hero:getScaleX()) *0.5, m.y, bound.width* math.abs(self.hero:getScaleX()) *0.5, bound.height* math.abs(self.hero:getScaleY())*0.5)
					else
						juxin1 = cc.rect(m.x - 0.8*bound.width* math.abs(self.hero:getScaleX()), m.y, bound.width* math.abs(self.hero:getScaleX())*0.5 , bound.height* math.abs(self.hero:getScaleY()*0.5))
					end
					-- self.shape4 = display.newRect(juxin1,
				 --        {fillColor = cc.c4f(1,0,0,0.5), borderColor = cc.c4f(0,1,0,1), borderWidth = 1})
					-- self:addChild(self.shape4,50)
					local bound2 = self.diren[i].yixiong:getBoundingBox()
					local p2 = cc.p(bound2.x,bound2.y)
					local m2 = self.diren[i]:convertToWorldSpace(p2)
					local juxin2
					if self.diren[i]:getScaleX() > 0 then
						juxin2 = cc.rect(m2.x, m2.y, bound2.width*math.abs(self.diren[i]:getScaleX()), bound2.height*math.abs(self.diren[i]:getScaleY()))
					else
						juxin2 = cc.rect(m2.x - bound2.width*math.abs(self.diren[i]:getScaleX()), m2.y, bound2.width*math.abs(self.diren[i]:getScaleX()), bound2.height*math.abs(self.diren[i]:getScaleY()))
					end
					if cc.rectIntersectsRect(juxin1,juxin2) then
						print("碰撞")
						--敌人减血
						print("敌人减血")
						--打一次减十点血量
						self.diren[i].xueliang = self.diren[i].xueliang-10
						self.diren[i]:setXueLiang()--减血
						if self.diren[i].xueliang <= 0 then
							print("敌人死亡")
							self.diren[i].isDie = true
							self.diren[i]:doEvent("death")
							gp.MessageMgr:dispatchEvent00(gei.LOAD_FIGHT_TOUCH_MYNEW)
							--self:dispatchEvent({name="MY_NEWS"})
						else
							self.diren[i]:doEvent("injured")--被攻击动画，并且进去被攻击状态
							self.diren[i].beigongji = true
						end
					end
				end
			end
		end
	end
end

function FightingTouchView:skill1HitCall( )
	if self.hero.isPutSkills == false then
		gp.TickMgr:stopLoopCall(self.skill1HitCallSn)
		self.skill1HitCallSn = nil
	end
	-- print("敌人数组大小" .. #self.diren)
	for i=1,#self.diren do
		if self.diren[i].isDie then
			--敌人死亡了
		else
			if math.abs(self.hero:getPositionY()-self.diren[i]:getPositionY()) < 30 then
				print("yijineng")
				-- if self.shape4 ~= nil then
				-- 		self.shape4:removeFromParent()
				-- 		self.shape4 = nil
				-- end
				local bound = self.hero.yixiong:getBoundingBox()
				local p = cc.p(bound.x,bound.y)
				-- dump(bound)
				local m = self.hero:convertToWorldSpace(p)
				local juxin1
				if self.hero:getScaleX() > 0 then
					juxin1 = cc.rect(m.x - 0.2*bound.width* math.abs(self.hero:getScaleX()) *0.5, m.y + bound.height* math.abs(self.hero:getScaleY())*0.5, bound.width* math.abs(self.hero:getScaleX()) *0.5, bound.height* math.abs(self.hero:getScaleY())*0.5)
				else
					juxin1 = cc.rect(m.x - 0.5*bound.width* math.abs(self.hero:getScaleX()), m.y+bound.height* math.abs(self.hero:getScaleY())*0.5, bound.width* math.abs(self.hero:getScaleX())*0.5 , bound.height* math.abs(self.hero:getScaleY()*0.5))
				end
				-- self.shape4 = display.newRect(juxin1,
			 --        {fillColor = cc.c4f(1,0,0,0.5), borderColor = cc.c4f(0,1,0,1), borderWidth = 1})
				-- self:addChild(self.shape4,50)
				local bound2 = self.diren[i].yixiong:getBoundingBox()
				local p2 = cc.p(bound2.x,bound2.y)
				local m2 = self.diren[i]:convertToWorldSpace(p2)
				local juxin2
				if self.diren[i]:getScaleX() > 0 then
					juxin2 = cc.rect(m2.x, m2.y, bound2.width*math.abs(self.diren[i]:getScaleX()), bound2.height*math.abs(self.diren[i]:getScaleY()))
				else
					juxin2 = cc.rect(m2.x - bound2.width*math.abs(self.diren[i]:getScaleX()), m2.y, bound2.width*math.abs(self.diren[i]:getScaleX()), bound2.height*math.abs(self.diren[i]:getScaleY()))
				end
				if cc.rectIntersectsRect(juxin1,juxin2) then
					--敌人跟着英雄一起移动
					-- self.diren:setPosition(cc.p(self.))
					
					-- print("碰撞")
					-- 敌人减血
					print("敌人减血")
					--打一次减十点血量
					self.diren[i].xueliang = self.diren[i].xueliang-10
					self.diren[i]:setXueLiang()--减血
					if self.diren[i].xueliang <= 0 then
						print("敌人死亡")
						self.diren[i].isDie = true
						self.diren[i]:doEvent("death")
						gp.MessageMgr:dispatchEvent00(gei.LOAD_FIGHT_TOUCH_MYNEW)
						--self:dispatchEvent({name="MY_NEWS"})
					else
						self.diren[i]:doEvent("injured")--被攻击，并且进入被攻击状态
						self.diren[i].beigongji = true
					end
				end
			end
		end
	end
end


function FightingTouchView:isCanMove(p)
	-- if self.boshu * self.yidongbi then
		
	-- end
	print("width:"..self.Map:getTileSize().width.."   height:"..self.Map:getTileSize().height)
	local x = p.x/self.Map:getTileSize().width
	local y = self.Map:getMapSize().height - (p.y / self.Map:getTileSize().height)

	local currentPoint = cc.p(x,y)
	-- print("x = " .. x .. "y = " ..y)
	--判断是否在地图范围内
	if x ~= self.Map:getMapSize().width and self.Map:getMapSize().height ~= y then
		local tilegId = self.NoGoLayer:getTileGIDAt(currentPoint)
		local value = self.Map:getPropertiesForGID(tilegId)
		-- dump(value)
		if tilegId ~= nil then
			if value ~= 0 then
				-- self.he.isCanMove = false--人物不能移动
				return false--不能移动
			end
		end
		return true--可以移动
	end
end

function FightingTouchView:rockerCall( )		
	local move 
	local mintus = 0.1
	local buchang = 32
	local sc = 1--必须和创建时的缩放大小一样
	if self.move == tagDirection.rocker_STARY then
		--不动
		-- self.hero:doEvent("normal")
	elseif self.move == tagDirection.rocker_RIGHT then
		--向右移动
		self.hero:setScaleX(-sc)
		if self:isCanMove(cc.p(buchang+self.hero:getPositionX(),self.hero:getPositionY()+0)) then
			move = cc.MoveBy:create(mintus,cc.p(buchang,0))
		end
		-- self.hero:setPosition(self.hero:getPositionX() + 5,self.hero:getPositionY())
	elseif self.move == tagDirection.rocker_UP then
		--向上移动
		if self:isCanMove(cc.p(0+self.hero:getPositionX(),self.hero:getPositionY()+buchang)) then
			move = cc.MoveBy:create(mintus,cc.p(0,buchang))
		end
		
		-- self.hero:setPosition(self.hero:getPositionX(),self.hero:getPositionY() + 10)
	elseif self.move == tagDirection.rocker_LEFT then
		--向左移动
		self.hero:setScaleX(sc)
		if self:isCanMove(cc.p(-buchang+self.hero:getPositionX(),self.hero:getPositionY()+0)) then
			move = cc.MoveBy:create(mintus,cc.p(-buchang,0))
		end
		
		-- self.hero:setPosition(self.hero:getPositionX() - 5,self.hero:getPositionY())
	elseif self.move == tagDirection.rocker_DOWN then
		--向下移动
		if self:isCanMove(cc.p(0+self.hero:getPositionX(),self.hero:getPositionY()-buchang)) then
			move = cc.MoveBy:create(mintus,cc.p(0,-buchang))
		end
		-- self.hero:setPosition(self.hero:getPositionX(),self.hero:getPositionY() - 10)	
	elseif self.move == tagDirection.rocker_LEFT_UP then
		--向左下移动
		self.hero:setScaleX(sc)
		if self:isCanMove(cc.p(self.hero:getPositionX()-buchang*0.7,self.hero:getPositionY()+buchang*0.7)) then
			move = cc.MoveBy:create(mintus,cc.p(-buchang*0.7,buchang*0.7))
		end
		
		-- self.hero:setPosition(self.hero:getPositionX() - 3.5,self.hero:getPositionY() + 7)
	elseif self.move == tagDirection.rocker_LEFT_DOWN then
		--向左上移动
		self.hero:setScaleX(sc)
		if self:isCanMove(cc.p(-buchang*0.7+self.hero:getPositionX(),self.hero:getPositionY()-buchang*0.7)) then
			move = cc.MoveBy:create(mintus,cc.p(-buchang*0.7,-buchang*0.7))
		end
		
		-- self.hero:setPosition(self.hero:getPositionX() - 3.5,self.hero:getPositionY() - 7)
	elseif self.move == tagDirection.rocker_RIGHT_UP then
		--向右上移动
		self.hero:setScaleX(-sc)
		if self:isCanMove(cc.p(buchang*0.7+self.hero:getPositionX(),self.hero:getPositionY()+buchang*0.7)) then
			move = cc.MoveBy:create(mintus,cc.p(buchang*0.7,buchang*0.7))
		end
		
		-- self.hero:setPosition(self.hero:getPositionX() + 3.5,self.hero:getPositionY() + 7)
	elseif self.move == tagDirection.rocker_RIGHT_DOWN then
		--向右下移动
		self.hero:setScaleX(-sc)
		if self:isCanMove(cc.p(buchang*0.7+self.hero:getPositionX(),self.hero:getPositionY()-buchang*0.7)) then
			move = cc.MoveBy:create(mintus,cc.p(buchang*0.7,-buchang*0.7))
		end
		
		-- self.hero:setPosition(self.hero:getPositionX() + 3.5,self.hero:getPositionY() - 7)
	end
	-- self.hero:stopAllActions()
	if move~=nil then
		self.hero:runAction(move)
	end
	self.hero:doEvent("move2")
end

function FightingTouchView:checkHitCall( )
	if self.diren == nil then
		-- scheduler.unscheduleGlobal(self.ssssss)
		return
	end
	-- print("敌人数组大小 "..#self.diren)
	for i=1,#self.diren do
		if self.diren[i].isDie then
			--敌人死亡了
		else
			if self.hero.DengDaiGongJiJieSHu == true and self.hero.gongjiChengGong == false then
				if math.abs(self.hero:getPositionY()-self.diren[i]:getPositionY()) < 30 then
					--todo
					-- bone1 = self.hero.yixiong.findBone("root") 
					-- dump(bone1)
					-- if self.shape4 ~= nil then
					-- 	self.shape4:removeFromParent()
					-- 	self.shape4 = nil
					-- end
					-- if self.shape5 ~= nil then
					-- 	self.shape5:removeFromParent()
					-- 	self.shape5 = nil
					-- end
					local bound = self.hero.yixiong:getBoundingBox()
					local p = cc.p(bound.x,bound.y)
					-- dump(bound)
					local m = self.hero:convertToWorldSpace(p)
					-- print("英雄 x = " .. m.x .. "  y = " .. m.y)
					-- print("英雄 w = " .. bound.width .. "  h = " .. bound.height)

					local bound2 = self.diren[i].yixiong:getBoundingBox()
					local p2 = cc.p(bound2.x,bound2.y)
					local m2 = self.diren[i]:convertToWorldSpace(p2)
					-- print("敌人 x = " .. m2.x .. "  y = " .. m2.y)
					-- print("英雄 w = " .. bound2.width .. "  h = " .. bound2.height)

					local juxin1
					local juxin2
					if self.hero:getScaleX() > 0 then
						juxin1 = cc.rect(m.x, m.y, bound.width* math.abs(self.hero:getScaleX()) , bound.height* math.abs(self.hero:getScaleY()))
					else
						juxin1 = cc.rect(m.x - bound.width* math.abs(self.hero:getScaleX()), m.y, bound.width* math.abs(self.hero:getScaleX()) , bound.height* math.abs(self.hero:getScaleY()))
					end

					if self.diren[i]:getScaleX() > 0 then
						juxin2 = cc.rect(m2.x, m2.y, bound2.width*math.abs(self.diren[i]:getScaleX()), bound2.height*math.abs(self.diren[i]:getScaleY()))
					else
						juxin2 = cc.rect(m2.x - bound2.width*math.abs(self.diren[i]:getScaleX()), m2.y, bound2.width*math.abs(self.diren[i]:getScaleX()), bound2.height*math.abs(self.diren[i]:getScaleY()))
					end
					-- local juxin1 = cc.rect(m.x, m.y, bound.width* math.abs(self.hero:getScaleX()) , bound.height* math.abs(self.hero:getScaleY()) )
					-- local juxin2 = cc.rect(m2.x, m2.y, bound2.width*math.abs(self.diren:getScaleX()), bound2.height*math.abs(self.diren:getScaleY()))
					-- print(cc.rectIntersectsRect(juxin1,juxin2))
					if cc.rectIntersectsRect(juxin1,juxin2) then
						print("碰撞")
						self.hero.gongjiChengGong = true
						--敌人减血
						print("敌人减血")
						self.diren[i].xueliang = self.diren[i].xueliang-10
						self.diren[i]:setXueLiang()--减血
						if self.diren[i].xueliang <= 0 then
							self.diren[i].isDie = true
							self.diren[i]:doEvent("death")
							gp.MessageMgr:dispatchEvent00(gei.LOAD_FIGHT_TOUCH_MYNEW)
							--self:dispatchEvent({name="MY_NEWS"})
						else
							self.diren[i]:doEvent("injured")
							self.diren[i].beigongji = true
						end
					end
					-- if self:isRectCollision(juxin1,juxin2) then
					-- 	print("碰撞了")
					-- end
					--碰撞检测

					-- self.shape4 = display.newRect(juxin1,
				 --        {fillColor = cc.c4f(1,0,0,1), borderColor = cc.c4f(0,1,0,1), borderWidth = 1})
					-- self:addChild(self.shape4,50)
					-- self.shape5 = display.newRect(juxin2,
				 --        {fillColor = cc.c4f(0,1,0,1), borderColor = cc.c4f(0,0,1,1), borderWidth = 1})
					-- self:addChild(self.shape5,50)00
				end
			end
		end
		
	end
end

function FightingTouchView:onEnter(  )
	FightingTouchView.super.onEnter(self)
	gp.TickMgr:register(self)

	local function _hitEventHandle(eveId, dataCoder)

	end
	gp.MessageMgr:registerEvent(self.sn, gei.LOAD_SEL_HERO, _hitEventHandle)
end

function FightingTouchView:onExit(  )
	gp.TickMgr:stopLoopCall(self.checkHitCallSn)
	gp.TickMgr:stopLoopCall(self.rockerCallSn)
	self.checkHitCallSn = nil
	self.rockerCallSn = nil
	FightingTouchView.super.onExit(self)
end


function FightingTouchView:onTouchBegan(touch, event)
	print("0000000000")
	local ret = FightingTouchView.super.onTouchBegan(self, touch, event)
	if ret then
		if self.hero.isPutSkills==true then
			print("11111111")
			gp.TickMgr:stopLoopCall(self.rockerCallSn)
			self.rockerCallSn = nil
		else
			print("22222")
			self.rockerCallSn = gp.TickMgr:loopCall( 0.1, 0.1, self.rockerCall, self)
		end

	end
	return ret
end

function FightingTouchView:onTouchMoved(touch, event)
	local p = touch:getLocation()
	angle = math.acos(self:corea(p,self.rockerBGPos))--弧度制的
	-- math.acos()
	self:checkdirection(angle,p)

	if self:distance(p,self.rockerBGPos) > self.rockerBGR then
		local x = self.rockerBGR * math.cos(angle)
		local y = self.rockerBGR * math.sin(angle)
		if p.y >= self.rockerBGPos.x then
			self.rocker:setPosition(self.rockerBGPos.x+x,self.rockerBGPos.y+y)
		else
			self.rocker:setPosition(self.rockerBGPos.x+x,self.rockerBGPos.y-y)
		end
	else
		self.rocker:setPosition(p)
	end
	--更新英雄位置
	if self.rockerCallSn==nil and self.hero.isPutSkills == false then
		self.rockerCallSn = gp.TickMgr:loopCall( 0.1, 0.1, self.rockerCall, self)
	else
		-- print("有时间调度")
	end
end

function FightingTouchView:onTouchEnded(touch, event)
	self.move = 0
	--让点回到中心
	_VLP(self.rocker)
	
	--停止英雄的运动
	self.hero:stopAllActions()
	self.hero:doEvent("normal")
	gp.TickMgr:stopLoopCall(self.rockerCallSn)
	self.rockerCallSn = nil
end

function FightingTouchView:initRocker( )
	self.isChoose = 1
--加载主界面
	local rockerBG = gp.Sprite:create("caogan_waiyuan.png")

	self:addChild(rockerBG)
	
	--self.rockerBG:pos(self:getPositionX() + display.left + self.rockerBG:getContentSize().width/2 +30,self:getPositionY()+ display.bottom + self.rockerBG:getContentSize().width/2 + 30)
	self.rocker = gp.Sprite:create("caozuodian1.png")
	rockerBG:addChild(self.rocker)
	
	_VLP(rockerBG, self, vl.IN_BL, cc.p(30,30))
	_VLP(self.rocker, rockerBG, vl.CENTER)

	self.rockerBGPos = {}
	self.rockerBGPos.x = rockerBG:getPositionX()
	self.rockerBGPos.y = rockerBG:getPositionY()
	-- local s = self.rockerBG:getPos()
	-- print("x = "..self.rockerBGPos.y)
	self.rockerBGR = rockerBG:getContentSize().width*0.5

end

--求亮点之间的距离
function FightingTouchView:distance(p1,p2)
	return math.sqrt((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y))
end

function FightingTouchView:corea(p1,p2)
	return (p1.x - p2.x)/(self:distance(p1,p2))
end

function FightingTouchView:checkdirection(angle,p)

	if (p.x >= self.rockerBGPos.x) and (p.y >= self.rockerBGPos.y) then
		if (math.radian2angle(angle)>22.5) and (math.radian2angle(angle)<67.5) then
			--向上
			-- print("右上")
			self.move = tagDirection.rocker_RIGHT_UP
			return
		elseif math.radian2angle(angle)>67.5 then
			-- print("上")
			self.move = tagDirection.rocker_UP
			return
		elseif math.radian2angle(angle)<22.5 then
			-- print("右")
			self.move = tagDirection.rocker_RIGHT
			return
		end

	elseif (p.x < self.rockerBGPos.x) and (p.y > self.rockerBGPos.y) then
		if (math.radian2angle(angle)>112.5) and (math.radian2angle(angle)<152.5) then
			-- print("左上")
			self.move = tagDirection.rocker_LEFT_UP
			return
		elseif math.radian2angle(angle) < 112.5 then
			-- print("上")
			self.move = tagDirection.rocker_UP
			return
		elseif math.radian2angle(angle) > 152.5 then
			-- print("左")
			self.move = tagDirection.rocker_LEFT
			return
		end

	elseif (p.x < self.rockerBGPos.x) and (p.y <= self.rockerBGPos.y) then
		if (math.radian2angle(angle)>112.5) and (math.radian2angle(angle)<152.5) then
			-- print("左下")
			self.move = tagDirection.rocker_LEFT_DOWN
			return
		elseif math.radian2angle(angle)>112.5 then
			-- print("左")
			self.move = tagDirection.rocker_LEFT
			return
		elseif math.radian2angle(angle)<152.5 then
			-- print("下")
			self.move = tagDirection.rocker_DOWN
			return
		end

	elseif (p.x > self.rockerBGPos.x) and (p.y < self.rockerBGPos.y) then
		if (math.radian2angle(angle)>22.5) and (math.radian2angle(angle)<67.5) then
			-- print("右下")
			self.move = tagDirection.rocker_RIGHT_DOWN
			return
		elseif math.radian2angle(angle)>67.5 then
			-- print("下")
			self.move = tagDirection.rocker_DOWN
			return
		elseif math.radian2angle(angle)<22.5 then
			-- print("右")
			self.move = tagDirection.rocker_RIGHT
			return
		end
	end
end


function FightingTouchView:toloading(cd,sender)
	sender:setCatchTouch(false)

	local i = sender:getTag()%100


	local skill_loadingBar  --加载进度条
    local lab    --加载文本


	if i == 0 then
		skill_loadingBar = self.skill_loadingBar1
        lab = self.lab1
	elseif i==1 then
		skill_loadingBar = self.skill_loadingBar2
        lab = self.lab2
	elseif i==2 then
		skill_loadingBar = self.skill_loadingBar3
        lab = self.lab3
	end


    lab:setVisible(true)
    lab:setString(string.format("%0.1f", cd))  
    local time = cd

    skill_loadingBar:setVisible(true)
	skill_loadingBar:setPercentage(100)

    --设置一个定时器
	local handle
	local percent = 10/cd
   	local interval = 0.1
  	local index = 0
  	local sharedScheduler = cc.Director:getInstance():getScheduler()
  	handle = sharedScheduler:scheduleScriptFunc(function()
    	index = index + percent
    	skill_loadingBar:setPercentage(100-index)
        time = time-0.1
        lab:setString(string.format("%0.1f", time))
    	if index >= 100 then
   --  		if i == 1 then
			-- 	isskill1 = true
			-- elseif i==2 then
			-- 	isskill2 = true
			-- elseif i==3 then
			-- 	isskill3 = true
			-- end
            skill_loadingBar:setVisible(false)
            lab:setVisible(false)
            sender:setCatchTouch(true)
      		scheduler.unscheduleGlobal(handle)
    	end
  	end, interval, false)
   	
end

function FightingTouchView:initSkills(  )
	local saveData = GMODEL(MOD.LOAD):getSaveData()
	local s = nil
	for i=1,#Ref.HeroData.hero do
		if saveData.selectHero[1].id == Ref.HeroData.hero[i].id then
		 	s = Ref.HeroData.hero[i]
		 	break
		end 
	end

	if s==nil then return end

	self.updateSingleDelay = function (  )
		--单击
		if self.count == 1 and self.hero.DengDaiGongJiJieSHu == false then
			print("单击")
			self.hero.isGongJiCiShu = 1
			self.hero:doEvent("attack1")
			self.count = 0
			self.hero.DengDaiGongJiJieSHu = true
		end
	end
	self.updateDoubleDelay = function (  )
		--双击
		if self.count == 2 and self.hero.DengDaiGongJiJieSHu == false then
			print("双击")
			self.hero.isGongJiCiShu = 2
			self.hero:doEvent("attack1")
			self.count = 0
			self.hero.DengDaiGongJiJieSHu = true
		end
	end
	self.ThreeClicked = function (  )
		--三击
		if self.hero.DengDaiGongJiJieSHu == false then
			print("三击")
			self.hero.isGongJiCiShu = 3
			self.hero:doEvent("attack1")
			self.count = 0
			self.hero.DengDaiGongJiJieSHu = true--等待攻击结束
		end
	end

	local function _skillBtnCall( sender )
		local tag = sender:getTag()
		if tag==1 then
			self.hero.doEvent("skills1")
			if self.skill1HitCallSn~=nil then
				gp.TickMgr:stopLoopCall(self.skill1HitCallSn)
			end
			self.skill1HitCallSn = gp.TickMgr:loopCall(0.3,0.3, self.skill1HitCall, self)
			self:toloading(3,self.skillButton1)
		elseif tag==2 then
			self.hero.doEvent("skills2")
			if self.skill2HitCallSn~=nil then
				gp.TickMgr:stopLoopCall(self.skill2HitCallSn)
			end
			self.skill2HitCallSn = gp.TickMgr:loopCall(0.3,0.3, self.skill2HitCall, self)
			self:toloading(1,self.skillButton2)
		elseif tag==3 then
			self.hero.doEvent("skills3")
			self:toloading(10,self.skillButton3)
		elseif tag==5 then
			if self.count == 0 and self.hero.DengDaiGongJiJieSHu == false then--点击一次
    			gp.TickMgr:delayCall(0.3, self.updateSingleDelay, self)
    			self.count = self.count + 1
			elseif self.count == 1 and self.hero.DengDaiGongJiJieSHu == false then--双击
				gp.TickMgr:delayCall(0.3, self.updateDoubleDelay, self)
    			self.count = self.count + 1
			elseif self.count == 2 and self.hero.DengDaiGongJiJieSHu == false then
			 	--todo --三连击
				self.ThreeClicked()
    		end
		end
	end
	local btn1 = gp.Button:create(s.s1.."1.png",_skillBtnCall)
	self:addChild(btn1)
	btn1:setTag(1)
	_VLP(btn1, self, vl.IN_BR, cc.p(-270,100))

	local btn2 = gp.Button:create(s.s1.."2.png",_skillBtnCall)
	self:addChild(btn2)
	btn1:setTag(2)
	_VLP(btn2, self, vl.IN_BR, cc.p(-240,200))

	local btn3 = gp.Button:create(s.s1.."3.png",_skillBtnCall)
	self:addChild(btn3)
	btn1:setTag(3)
	_VLP(btn3, self, vl.IN_BR, cc.p(-150,270))

	local btn5 = gp.Button:create("pugong-up.png",_skillBtnCall)
	self:addChild(btn5)
	btn1:setTag(5)
	_VLP(btn5, self, vl.IN_BR, cc.p(-80,80))

	self.lab1 = gp.Label:create("5", 20, cc.c3b(255, 0, 0))
	self:addChild(self.lab1, 2)
	self.lab1:setVisible(false)
	_VLP(self.lab1, btn1, vl.CENTER, cc.p(-13,0))

	self.lab2 = gp.Label:create("5", 20, cc.c3b(255, 0, 0))
	self:addChild(self.lab2, 2)
	self.lab2:setVisible(false)
	_VLP(self.lab2, btn2, vl.CENTER, cc.p(-13,0))

	self.lab3 = gp.Label:create("5", 20, cc.c3b(255, 0, 0))
	self:addChild(self.lab3, 2)
	self.lab3:setVisible(false)
	_VLP(self.lab3, btn3, vl.CENTER, cc.p(-13,0))

	self.skill_loadingBar1 = cc.ProgressTimer:create(gp.Sprite:create("backpack_6.png", false))    
    self.skill_loadingBar1:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
    self.skill_loadingBar1:setScale(0.25)
    self.skill_loadingBar1:setPercentage(100)
    self.skill_loadingBar1:setReverseDirection(true)
    self.skill_loadingBar1:setVisible(false)
    self:addChild(self.skill_loadingBar1,1)
    _VLP(self.skill_loadingBar1, btn1)

    self.skill_loadingBar2 = cc.ProgressTimer:create(gp.Sprite:create("backpack_6.png"))
    self.skill_loadingBar2:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
    self.skill_loadingBar2:setScale(0.25)
    self.skill_loadingBar2:setPercentage(100)
    self.skill_loadingBar2:setReverseDirection(true)
    self.skill_loadingBar2:setVisible(false)
    self:addChild(self.skill_loadingBar2,1)
    _VLP(self.skill_loadingBar2, btn2)

    self.skill_loadingBar3 = cc.ProgressTimer:create(gp.Sprite:create("backpack_6.png"))
    self.skill_loadingBar3:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
    self.skill_loadingBar3:setScale(0.25)
    self.skill_loadingBar3:setPercentage(100)
    self.skill_loadingBar3:setReverseDirection(true)
    self.skill_loadingBar3:setVisible(false)
    self:addChild(self.skill_loadingBar3,1)
    _VLP(self.skill_loadingBar3, btn3)
end

return FightingTouchView

