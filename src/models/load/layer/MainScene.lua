
local MainScene = class("MainScene", gp.BaseNode)



function MainScene:ctor()
	MainScene.super.ctor(self)
	gp.AudioMgr:playMusic("pub/audio/music/a_chooselevel.mp3", true)
	
	self:_initUI()

end

function MainScene:_initUI( )
--加载主界面
	local bg = gp.Sprite:create("MainMenu.png")
	self:addChild(bg)
	_VLP(bg)

	self.funcBtnList = {}

	self.moreClose = true
	local function _btnCall( sender )
		local tag = sender:getTag()
		if tag == 1 then
			JOWinMgr:Instance():showWin(MCLASS(MOD.LOAD, "GameScene").new(), gd.LAYER_SCENE)
		end
	end
	local actionNode = gp.BaseNode.new()
	actionNode:setAnchorPoint(cc.p(0.5,0.5))
	self:addChild(actionNode)
	_VLP(actionNode)

	local btn1 = gp.Button:create("newgameA.png",_btnCall)
	btn1:setTag(1)
	actionNode:addChild(btn1)
	local btn2 = gp.Button:create("continueA.png",_btnCall)
	btn2:setTag(2)
	actionNode:addChild(btn2)
	local btn3 = gp.Button:create("aboutA.png",_btnCall)
	btn3:setTag(3)
	actionNode:addChild(btn3)
	local btn4 = gp.Button:create("sound-off-A.png",_btnCall)
	btn4:setTag(4)
	actionNode:addChild(btn4)
	self.actionNode = actionNode
	
	_VLP(btn1, self, vl.CENTER, cc.p(20,-20))
	_VLP(btn2, btn1, vl.OUT_B, cc.p(0,-20))
	_VLP(btn3, btn2, vl.OUT_B, cc.p(0,-20))
	_VLP(btn4, bg, vl.IN_BR, cc.p(-20,20))

end

function MainScene:onEnter()
	MainScene.super.onEnter(self)
	self.actionNode:setScale(0)
	self.actionNode:runAction(cc.ScaleTo:create(0.5,1));
end

return MainScene

