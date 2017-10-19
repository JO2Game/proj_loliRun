
local AFHero = class("AFHero", gp.BaseNode)

function AFHero:ctor()
	AFHero.super.ctor(self)	
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(cc.size(85,90))

	local tmpObj = gp.Sprite:create("s_hurt.png")
	self.m_hurtTex = tmpObj:getTexture()
	tmpObj = gp.Sprite:create("s_jump.png")
	self.m_jumpTex = tmpObj:getTexture()
	self.mainSprite = gp.Sprite:create("s_1.png", false)
    self:addChild(self.mainSprite)
    _VLP(self.mainSprite)

	
	self.curState = 0
end

function AFHero:onDestroy()
	if self.m_runAction then
		self.m_runAction:release()
		self.m_runAction = nil
	end
end

function AFHero:setState(var)
	if(self.curState == var) then
		return
	end
	self.curState = var
	if self.curState==1 then
		self:stopAllActions();
		self.mainSprite:stopAllActions();
		self.mainSprite:setTexture(self.m_jumpTex);
		self:runAction(cc.Sequence:create(cc.JumpBy:create(2.5, cc.p(0, 0), 100, 1), cc.CallFunc:create(function ( )
			self:jumpend()
		end)))
	elseif self.curState==2 then
		self:stopAllActions();
		self.mainSprite:stopAllActions();
		self.mainSprite:setTexture(self.m_hurtTex);
		self:runAction(cc.Sequence:create(cc.Blink:create(3, 10), cc.CallFunc:create(function ( )
			self:hurtend()
		end)))
	elseif self.curState==0 then
		self:stopAllActions();
		self.mainSprite:stopAllActions();
		
		local s2Spr = gp.Sprite:create("s_2.png")
		local sfc = cc.SpriteFrameCache:getInstance()
		local animation = cc.Animation:create();
	    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_1.png"));
	    animation:addSpriteFrameWithTexture(s2Spr:getTexture(), cc.rect(0,0, s2Spr:getContentSize().width, s2Spr:getContentSize().height));
	    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_3.png"));
	    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_4.png"));
	    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_5.png"));
	    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_6.png"));
	    animation:setDelayPerUnit(0.1);
	    animation:setRestoreOriginalFrame(true);
	    aniAction = cc.RepeatForever:create(cc.Animate:create(animation))    
	    self.mainSprite:runAction(aniAction)
	end
end

function AFHero:jumpend()
	self:setState(0)
end

function AFHero:hurtend()
	self:setState(0)
end

function AFHero:onTouchBegan(touch, event)
	local ret = AFHero.super.onTouchBegan(touch, event)
	if ret==true then
		self:setState(1)
	end
end


function AFHero:onEnter(  )
	AFHero.super.onEnter(self)

	local s2Spr = gp.Sprite:create("s_2.png")
	local sfc = cc.SpriteFrameCache:getInstance()
	local animation = cc.Animation:create();
    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_1.png"));
    animation:addSpriteFrameWithTexture(s2Spr:getTexture(), cc.rect(0,0, s2Spr:getContentSize().width, s2Spr:getContentSize().height));
    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_3.png"));
    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_4.png"));
    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_5.png"));
    animation:addSpriteFrame(sfc:getSpriteFrameByName("s_6.png"));
    animation:setDelayPerUnit(0.1);
    animation:setRestoreOriginalFrame(true);
    aniAction = cc.RepeatForever:create(cc.Animate:create(animation))    
    self.mainSprite:runAction(aniAction)
end

function AFHero:onExit(  )
	
	AFHero.super.onExit(self)
end


return AFHero

