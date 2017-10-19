
local FPlayer = class("FPlayer", MCLASS(MOD.FIGHT, "FBasePlane"))

function FPlayer:ctor()
	FPlayer.super.ctor(self)
	self:setCatchTouch(true)

	--移动偏移量
	self.mDeltaX = 0
	self.mDeltaY = 0
	--是否用户点击移动
	self.isHeroPlaneControl = false;

	self:startFire()
end

function FPlayer:onFire(  )
	local bullet = MCLASS(MOD.FIGHT, "FBaseBullet").new()
	bullet:setImg("bullet1.png")
	local x, y = self:getPosition()
	bullet:setPosition(cc.p(x, y+self.playerSize.height*0.5+2))
	GMODEL(MOD.FIGHT).bulletMgr:addPlayerBullet(bullet)
end

function FPlayer:onTouchBegan(touch, event)
	local ret = FPlayer.super.onTouchBegan(self, touch, event)
	if ret then
		self.isHeroPlaneControl = true;
		local mBeganPos = touch:getLocation()
		mBeganPos = self:getParent():convertToNodeSpace(mBeganPos)
		--mBeganPos = cc.Director:getInstance():convertToGL(mBeganPos);
		
		local x, y = self:getPosition()
		--計算偏移量
		self.mDeltaX = mBeganPos.x - x;
		self.mDeltaY = mBeganPos.y - y;
	end
	return ret
end

function FPlayer:onTouchMoved(touch, event)
	if self.isHeroPlaneControl then
		local mMovedPos = touch:getLocation()
		mMovedPos = self:getParent():convertToNodeSpace(mMovedPos)
		
		local x = mMovedPos.x - self.mDeltaX;--//記得減去偏移量
		local y = mMovedPos.y - self.mDeltaY;

		if x <= (self.playerSize.width*0.5 + self.zoneRect.x) then--//x到达屏幕左边界
			x = self.playerSize.width*0.5 + self.zoneRect.x;
		elseif x >= (self.zoneRect.width - self.playerSize.width*0.5) then--//x到达屏幕右边界
			x = self.zoneRect.width - self.playerSize.width*0.5;
		end
		if y <= (self.playerSize.height*0.5 + self.zoneRect.y) then--//y到达屏幕下边界
			y = self.playerSize.height*0.5 + self.zoneRect.y;
		elseif y >= (self.zoneRect.height - self.playerSize.height*0.5) then--//x到达屏幕上边界
			y = self.zoneRect.height - self.playerSize.height*0.5;
		end
		--//飞机跟随手指移动
		self:setPosition(cc.p(x,y))
	end
end

function FPlayer:onTouchEnded(touch, event)
	self.isHeroPlaneControl = false;
end


return FPlayer

