
--[[
=================================
文件名：LoadModel.lua
作者：James Ou
=================================
]]
gp.ModelMgr:modelSubLua( MOD.LOAD, "models/load/ctrl/MapData" )

gp.ModelMgr:modelSubLua( MOD.LOAD, "models/load/entity/AFHero" )
gp.ModelMgr:modelSubLua( MOD.LOAD, "models/load/entity/AFMap" )
gp.ModelMgr:modelSubLua( MOD.LOAD, "models/load/layer/GameMark" )

gp.ModelMgr:modelSubLua( MOD.LOAD, "models/load/layer/MainScene" )
gp.ModelMgr:modelSubLua( MOD.LOAD, "models/load/layer/GameScene" )

--[[
gp.ModelMgr:modelSubLua( MOD.LOAD, "models/load/layer/FightingTouchView" )
gp.ModelMgr:modelSubLua( MOD.LOAD, "models/load/entity/AFEnemy" )

--]]


local LoadModel = LoadModel or class("LoadModel", gp.BaseModel)


function LoadModel:onInitData()
	
	--local csb = cc.CSLoader:getInstance():createNodeWithFlatBuffersFile("pub/csb/MainScene.csb")
	--local csb = cc.CSLoader:createNode("MainScene.csb")
	--local csb = ccs.GUIReader:getInstance():widgetFromJsonFile("pub/csb/MainScene.csb")
	--[[
	if csb==nil then
		LOG_ERROR("","csb is nil")
	else
		JOWinMgr:Instance():showWin(csb, gd.LAYER_SCENE)
	end
	--]]
	local scene = cc.Scene:createWithPhysics();--开启物理碰撞
	scene:getPhysicsWorld():setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL);
	scene:getPhysicsWorld():setGravity(cc.p(0, -2));
	JOWinMgr:Instance():init(scene)
	cc.Director:getInstance():replaceScene(scene);
end

function LoadModel:onInitEvent()
	
end


function LoadModel:onDelete( )
	--析构UI

	--析构MGR及其它对象
	
	--析构父类
	LoadModel.super.onDelete(self)
end

--数据相关----------------------------------------------------------------------------
function LoadModel:getSaveData(  )
	return self.saveData
end

--ui相关----------------------------------------------------------------------------
function LoadModel:showLoadLayer( )
	JOWinMgr:Instance():showWin(MCLASS(MOD.LOAD, "MainScene").new(), gd.LAYER_SCENE)
end

--消息相关----------------------------------------------------------------------------

--[[
--成功错误码处理----------------------------------------------------------------------------
function LoadModel:handleErrorCode(errorData)

end

function LoadModel:handleSuccessCode(successData)

end
--]]

return LoadModel