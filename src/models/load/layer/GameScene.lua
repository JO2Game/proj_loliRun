
local FightingTouchLayer = MCLASS(MOD.LOAD, "FightingTouchView")
local HeroClass = MCLASS(MOD.LOAD, "AFHero")
local Enemy = MCLASS(MOD.LOAD, "AFEnemy")

local GameScene = class("GameScene", gp.BaseNode)


function GameScene:ctor()
	GameScene.super.ctor(self)
	self.map = MCLASS(MOD.LOAD, "AFMap").new()
	self.map:setAnchorPoint(cc.p(0,1))
	self.map:setPosition(cc.p(0, gd.VISIBLE_SIZE.height))
	self:addChild(self.map)

	self.hero = MCLASS(MOD.LOAD, "AFHero").new()
	self.hero:setPosition(cc.p(100, 185))
	self.hero:setAnchorPoint(cc.p(0,0))
	self.hero:setTag(3)

	local body = cc.PhysicsBody:createBox(cc.size(75, 95),cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(-20,-30));--//最后的参数为偏移量
	body:setCategoryBitmask(1);
	body:setCollisionBitmask(17);
	body:setContactTestBitmask(1);
	self.hero:setPhysicsBody(body);
	self:addChild(self.hero, 2,1);

	--开启计分功能(默认大小应该与屏幕大小相当)
	self.gamemark = MCLASS(MOD.LOAD, "GameMark").new()
	self.gamemark:setAnchorPoint(cc.p(1,1));
	self.gamemark:setPosition(gd.VISIBLE_SIZE.width, gd.VISIBLE_SIZE.height);
	self:addChild(self.gamemark, 1);

	self.gameover = gp.Sprite:create("gameover.png")
	self.gameover:setAnchorPoint(cc.p(0.5, 0.5));
	self.gameover:setPosition(cc.p(gd.VISIBLE_SIZE.width / 2, gd.VISIBLE_SIZE.height / 2 + 70));
	self.gameover:setVisible(false);
	--self.gameover:setScale(0.5);
	self:addChild(self.gameover, 5);

	local function _closeCall(  )
		JOWinMgr:Instance():showWin(MCLASS(MOD.LOAD, "MainScene").new(), gd.LAYER_SCENE)
	end
	self.closeBtn = gp.Button:create("back.png", _closeCall)
	self:addChild(self.closeBtn)
	_VLP(self.closeBtn, self, vl.CENTER, cc.p(0,-50))
	self.closeBtn:setVisible(false)
	self.isover = false
end

function GameScene:setover( )
	self.gameover:setVisible(true)
	self.closeBtn:setVisible(true)
	self.gameover:setScale(0)
	self.closeBtn:setScale(0)
	self.gameover:runAction(cc.ScaleTo:create(0.5, 1))
	self.closeBtn:runAction(cc.ScaleTo:create(0.5, 1))
	self.isover = true
end

function GameScene:tick()
	if self.hero.curState==0 then

	end
end


function GameScene:onEnter(  )
	GameScene.super.onEnter(self)
	gp.TickMgr:register(self)

	local listener = cc.EventListenerPhysicsContact:create()
	local function _contactBegin( contact )
		local spriteA = contact:getShapeA():getBody():getNode();
		local spriteB = contact:getShapeB():getBody():getNode();

		if (spriteA:getTag() == 3) then
			spriteA:setVisible(false);
			spriteA:getPhysicsBody():setEnable(false);
			self.gamemark:addMark(200);
			self.gamemark:setTag(4);
			if (self.gamemark:addProgress(2)) then
				--if ((self.hero:getItem_state() & 0x01) == 1) then
				--	return true;
				--end
				local protect_layer = gp.Sprite:create("HeroStatus_64x64_1.png");
				protect_layer:setBlendFunc({GL_SRC_ALPHA,GL_DST_ALPHA});
				protect_layer:setScale(3.5);
				protect_layer:setPosition(cc.p(0,-10));
				self.hero:addChild(protect_layer, 2);
				self.hero:setItem_state(1);
			end
			return true;
		end

		if (spriteB:getTag() == 3) then
			spriteB:setVisible(false);
			spriteB:getPhysicsBody():setEnable(false);
			self.gamemark:addMark(200);
			self.gamemark:setTag(4);
			if (self.gamemark:addProgress(2)) then --//加入保护层
				--if ((hero:getItem_state() & 0x01) == 1)
				--	return true;
				local protect_layer = gp.Sprite:create("HeroStatus_64x64_1.png");
				protect_layer:setBlendFunc({ GL_SRC_ALPHA, GL_DST_ALPHA });
				protect_layer:setScale(3.5);
				protect_layer:setPosition(cc.p(0, -10));
				self.hero:addChild(protect_layer, 2);
				self.hero:setItem_state(1);
			end
			return true;
		end
		return true;
	end

	listener:registerScriptHandler(_contactBegin,cc.Handler.EVENT_PHYSICS_CONTACT_BEGIN )
	local eventDispatcher = self:getEventDispatcher()
	eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
end

function GameScene:onExit(  )
	gp.TickMgr:unRegister(self)
	GameScene.super.onExit(self)
end

return GameScene

