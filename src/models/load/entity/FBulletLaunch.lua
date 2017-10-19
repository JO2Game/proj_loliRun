
local FBulletLaunch = class("FBulletLaunch")

function FBulletLaunch:ctor()
	FBulletLaunch.super.ctor(self)	
	self.interval = 0
	self.delayTime = 0
	self.sn = 0

	self.intervalCall = function ( ... )
		
	end
end
--设置图形，以后可能换为序列帧
function FBulletLaunch:setImg( img )
	self.bullet:setKey(img, false)
	self.bulletSize = self.bullet:getContentSize()
	self:setContentSize(self.bulletSize)
end
--设置活动区域
function FBulletLaunch:setZoneOfAction( rect )
	self.zoneRect = rect
end
--设置子弹发射器
function FBulletLaunch:setSenderId( senderId )
	self.senderId = senderId
end


return FBulletLaunch

