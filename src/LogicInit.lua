
local LogicInit = class("LogicInit")

function LogicInit:ctor()
	self:onInit()
end

function LogicInit:onInit()
	self:_initFrameWork()
	--self:_initUIConfig()

	self:_initEventDef();
		
	self:_initPlatform();
	self:_initLogicDef()
	---[[
	self:_initGameui();
	self:_initRegisterDef();
	--]]
	--gp.AudioMgr:playMusic(_RM("Cant-Smile-Without-You.mp3"))
end

function LogicInit:onDelete()
	
	_gei = nil
	_gai = nil
	_gview = nil
end

function LogicInit:_initFrameWork(  )
	gp.RefMgr:setPubPath("pub/ref/")
	gp.ResConfigMgr:setFontPubPath("pub/font/")
	gp.ResConfigMgr:setMusicPubPath("pub/audio/music/")
	gp.ResConfigMgr:setSoundPubPath("pub/audio/sound/")
	gp.ResConfigMgr:setTextPubPath("pub/language/")
	gp.JOCsbLuaMgr:setPubPath("pub/csb/")

	local function _resetResLanguage( language )
		JOResConfig:Instance():clear()
		JOResConfig:Instance():loadSrcConfig("pub/img.cof", "pub/image/");
		JOResConfig:Instance():addAniBasePath("pub/ani/")

		--JOResConfig:Instance():loadSrcConfig(language.."/img.cof", language.."/image/");
		--JOResConfig:Instance():addAniBasePath(language.."/ani/")
		--JOResConfig:Instance():description()

		gp.JOCsbLuaMgr:clearLan()		
		gp.JOCsbLuaMgr:AddLanPath(language.."/csb/")

		gp.ResConfigMgr:clearLanFont()
		gp.ResConfigMgr:addFontLanPath(language.."/font/")

		gp.ResConfigMgr:clearLanMusic()
		gp.ResConfigMgr:addMusicLanPath(language.."/audio/music/")

		gp.ResConfigMgr:clearLanSound()
		gp.ResConfigMgr:addSoundLanPath(language.."/audio/sound/")

		gp.ResConfigMgr:clearLanText()
		gp.ResConfigMgr:addTextLanPath(language.."/language/")
		
		gp.RefMgr:clearLanRefs()
		gp.RefMgr:addRefLanPath(language.."/ref/")
		--refresh ui
	end

	gp.LanguageMgr:AddCall(_resetResLanguage)
	gp.LanguageMgr:setLanguage("zh")
	

	JOShaderMgr:Instance():clearShaderSearchPath()
	JOShaderMgr:Instance():addShaderSearchPath("baseLua/shader/")
	JOShaderMgr:Instance():setDefaultVsh("default")
	JOShaderMgr:Instance():setDefaultOriginal("original")

end


function LogicInit:_initUIConfig(  )
	gp.Label:setDefaultBase(24, _FP("DroidSansFallback.ttf"), gd.FCOLOR.c12)
	gp.Label:setDefaultOutline(2, gd.FCOLOR.c9)
	gp.Label:setDefaultShadow(cc.p(0,0), gd.FCOLOR.c9)

	gp.RichLabel.TTF = _FP("DroidSansFallback.ttf")
	
	--gp.Button:setDefaultBase(gd.BTN_ZOOM_BIG)
	gp.Button:setDefaultTitleBase(24, _FP("DroidSansFallback.ttf"), gd.FCOLOR.c12)
	gp.Button:setDefaultTitleOutline(2, gd.FCOLOR.c9)

	--TIPS
	local opt = gp.Factory.TIPS_OPT
	opt.t_bgKey="pic_xinxidikuang2.png"
	opt.t_subKey="pic_wenzikuang.png"
	opt.t_titleStr="标题"
	opt.t_tfSize=30
	opt.t_fSize=30

	--NOICE
	opt = gp.Factory.NOICE_OPT
	opt.n_bgKey = "pic_xinxidikuang2.png"	
	opt.n_fcolor = gd.FCOLOR.c9

	--ALERT
	opt = gp.Factory.ALERT_OPT
	opt.a_bgKey="pic_xinxidikuang2.png"
	opt.a_subKey="pic_wenzikuang.png"
	opt.a_tfColor=gd.FCOLOR.c17--nil
	opt.a_tfOColor=gd.FCOLOR.c9
	opt.a_fSize=30-- nil
	opt.a_fColor=gd.FCOLOR.c17-- nil
	opt.a_onlyClick=false--是否在有按键的情况下，也可以点空白处关闭(true为可以， 默认false)
	opt.a_btnStdTitile = {"确定", "取消", "其他"}
	local btnOpt1 = {
			key = "btn_anniuzi.png",
			fsize = 30,
			fname = nil,
			fcolor = gd.FCOLOR.c9,
			focolor = nil
		}
	local btnOpt2 = {
			key = "btn_anniuhui.png",
			fsize = 30,
			fname = nil,
			fcolor = gd.FCOLOR.c9,
			focolor = nil
		}
	local btnOpt3 = {
			key = "btn_anniuzi.png",
			fsize = 30,
			fname = nil,
			fcolor = gd.FCOLOR.c9,
			focolor = nil
		}
	opt.a_btnOpts = {}
	table.insert(opt.a_btnOpts, btnOpt1)
	table.insert(opt.a_btnOpts, btnOpt2)
	table.insert(opt.a_btnOpts, btnOpt3)
	
	--WAIT
	opt = gp.Factory.WAIT_OPT
	opt.w_key = "icon_daojishi2.png"
 	
end

function LogicInit:_initEventDef()
	gei = loadLuaFile("event/EventDefines")
	gai = loadLuaFile("event/ActionDefines")
end

function LogicInit:_initPlatform()
	ToGame = loadLuaFile("platform/ToGame")
	ToShell = loadLuaFile("platform/ToShell")

	if _up and _up.ToGame then
		local function toGameCallback_(key, jsonParam)
			ToGame:_onCallback(key, jsonParam)
		end
		_up.ToGame:setLogicCallback(toGameCallback_)
	end
end


function LogicInit:_initGameui()
	--_EFactory = loadLuaFile("factory/EffectFactory")
	_gview = {}

end

function LogicInit:_initLogicDef()
	_gdef = {}
	--glg.DC = loadLuaFile("def/DCDef")
end

function LogicInit:_initRegisterDef()
	loadLuaFile("register/RegisterModelDef").register()
	loadLuaFile("register/RegisterWaitIdDef").register()
end

return LogicInit
