
local GameMark = class("GameMark", gp.BaseNode)

function GameMark:ctor()
	GameMark.super.ctor(self)

	self:_initUI()
end

function GameMark:_initUI()
	self.scoreLable = gp.Sprite:create("score.png", false)
	self.scoreLable:setAnchorPoint(cc.p(1, 1));
	--该Postion是以父节点的描点作为参考原点 
	self.scoreLable:setPosition(cc.p(-150, 0));
	self:addChild(self.scoreLable,1);
	_VLP(self.scoreLable)

	self.charMap = gp.Label:create()
	local tmpSpr = gp.Sprite:create("shu.png")
	self.charMap:setCharMap(tmpSpr:getTexture(),26, 31, '0')
	self.charMap:setAnchorPoint(cc.p(1, 1));
	self.charMap:setPosition(cc.p(0, 0));
	self.charMap:setString("0");	
	self:addChild(self.charMap,1);

	self.progress_BG = gp.Sprite:create("Pg_br_1.png");
	self.progress_BG:setScale(0.4);
	self.progress_BG:setAnchorPoint(cc.p(1, 1));
	self.progress_BG:setPosition(cc.p(-140, -250));
	--self.progress_BG:setBlendFunc({ GL_SRC_ALPHA, GL_ONE })
	self.progress_BG:setBlendFunc({ GL_SRC_ALPHA, GL_DST_ALPHA });
	self:addChild(self.progress_BG, 1);
	--进度条
	self.progress = cc.ProgressTimer:create(gp.Sprite:create("Pg_br_2.png", false));
	self.progress:setType(cc.PROGRESS_TIMER_TYPE_BAR);
	--Progress:setType(kCCProgressTimerTypeRadial);//扇形图标的方式
	--Progress:setReverseProgress(true);以倒计时的方式
	self.progress:setScale(0.4);
	self.progress:setAnchorPoint(cc.p(1, 1));
	self.progress:setPosition(cc.p(-140, -257));
	self.progress:setMidpoint(cc.p(0, 1));
	self.progress:setPercentage(0);
  	self.progress:setBarChangeRate(cc.p(1, 0));
	self:addChild(self.progress,1,3);

	self.totalMark = 0;
	self.progressTotal = 0;
end

function GameMark:onEnter()
	GameMark.super.onEnter(self)
end

function GameMark:onExit()
	GameMark.super.onExit(self)
end

function GameMark:addMark(mark)
	self.totalMark=self.totalMark+mark
	self.charMap:setString(self.totalMark)
end

function GameMark:addProgress( progressInt )
	self.progressTotal=self.progressTotal+progressInt
	if self.progressTotal>100 then
		self.progressTotal = 100
	end
	local to1 = cc.ProgressTo:create(1.0, self.progressTotal);
	self.progress:runAction(to1)
	if self.progressTotal>=100 then
		self.progressTotal = 0
		return true
	end
	return false
end


return GameMark

