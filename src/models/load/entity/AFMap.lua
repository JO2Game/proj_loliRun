
local AFMap = class("AFMap", gp.BaseNode)

function AFMap:ctor()
	AFMap.super.ctor(self)	
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(gd.VISIBLE_SIZE)

	self.bg1 = gp.Sprite:create("back_1_test.png")
	self:addChild(self.bg1)
	self.bg1:setAnchorPoint(cc.p(0,1))
	self.bg1:setPosition(cc.p(0,gd.VISIBLE_SIZE.height))
	local tmpObj = gp.Sprite:create("BackGround.png")
	self.bg1:addChild(tmpObj, 1)
	tmpObj:setAnchorPoint(cc.p(0,0))
	tmpObj:setPosition(cc.p(0,-124))

	self.bg2 = gp.Sprite:create("back_1_test.png")
	self:addChild(self.bg2)
	self.bg2:setAnchorPoint(cc.p(0,1))
	self.bg2:setPosition(cc.p(gd.VISIBLE_SIZE.width,gd.VISIBLE_SIZE.height))
	local tmpObj = gp.Sprite:create("BackGround.png")
	self.bg2:addChild(tmpObj, 1)
	tmpObj:setAnchorPoint(cc.p(0,0))
	tmpObj:setPosition(cc.p(0,-124))

end

function AFMap:bg1change( )
	self.bg1:setPosition(cc.p(gd.VISIBLE_SIZE.width*0.5,gd.VISIBLE_SIZE.height*0.5));
	self.bg1:runAction(cc.Sequence:create(cc.MoveBy:create(10,cc.p(-gd.VISIBLE_SIZE.width,0)),cc.CallFunc:create(function (  )
		self:bg1change()
	end)));
	self.bg1:removeChildByTag(3);
	self.bg1:removeChildByTag(4);
	
end

function AFMap:bg2change(  )
	self.bg2:setPosition(cc.p(gd.VISIBLE_SIZE.width*0.5,gd.VISIBLE_SIZE.height*0.5));
	self.bg2:runAction(cc.Sequence:create(cc.MoveBy:create(10,cc.p(-gd.VISIBLE_SIZE.width,0)),cc.CallFunc:create(function (  )
		self:bg2change()
	end)));
	self.bg2:removeChildByTag(3);
	self.bg2:removeChildByTag(4);
end

function AFMap:onEnter(  )
	AFMap.super.onEnter(self)
	self.bg1:runAction(cc.Sequence:create(cc.MoveBy:create(5,cc.p(-gd.VISIBLE_SIZE.width*0.5,0)),cc.CallFunc:create(function (  )
		self:bg1change()
	end)));
    self.bg2:runAction(cc.Sequence:create(cc.MoveBy:create(10,cc.p(-gd.VISIBLE_SIZE.width,0)),cc.CallFunc:create(function (  )
		self:bg2change()
	end)));

	self:createByRand(10, self.bg1)
	self:createByRand(10, self.bg2)

	self:initBackGroundEle_1(self.bg1)
	self:initBackGroundEle_2(self.bg2)
	
	self.curState = 0
end

--over write for sub class
function AFMap:createByRand( randmax, bg )
	local temp = math.random()%randmax+1
	--int temp = rand() % randmax + 1;  //获得的随机数
	
	local itemSprite = nil
	
	for i=1,temp do
		local idx = i%3+1
		if idx==1 then
			itemSprite = gp.Sprite:create("star_yellow_1.png")
		elseif idx==1 then
			itemSprite = gp.Sprite:create("star_blue_1.png")
		else
			itemSprite = gp.Sprite:create("star_red_1.png")
		end
		itemSprite:setContentSize(cc.size(30.5, 30.5));
		--星星距离至少150,否则判定会出现盲点
		itemSprite:setPosition(ccp(i * 30+ 100, 320+i%30+math.random()%3*20));
		itemSprite:setTag(3);
		local body = cc.PhysicsBody:createCircle(20,cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(9,9));
		body:setCategoryBitmask(17);
		body:setCollisionBitmask(0);
		body:setContactTestBitmask(0);
		itemSprite:setPhysicsBody(body);
		bg:addChild(itemSprite, 3, 3);
	end
end


function AFMap:initBackGroundEle_1(  )
	local bg1shu = MCLASS(MOD.LOAD, "MapData").bg1shu
	for i=1,7 do
		local roaddi = nil;
		local plant = nil;
		local flag = bg1shu[i]
		if (flag ~= -1) then
			local road = nil;
			if flag == 0 then
				plant = gp.Sprite:create("back_2.png");
				plant:setAnchorPoint(cc.p(0.5, 0));
				plant:setPosition(cc.p(128 * i + 64, 117));
				self.bg1:addChild(plant, 1);
				local body = cc.PhysicsBody:createBox(cc.size(128, 185), cc.PHYSICSBODY_MATERIAL_DEFAULT, cc.p(0, 0));
				body:setCategoryBitmask(16);
				body:setCollisionBitmask(0);
				body:setContactTestBitmask(0);
				body:setDynamic(false);
				road = gp.Sprite:create("road_2.png");
				road:setAnchorPoint(cc.p(0, 0));
				road:setPosition(cc.p(128 * i, 0));
				road:ignoreAnchorPointForPosition(true);
				road:setPhysicsBody(body);
				roaddi = gp.Sprite:create("road_3.png");
				roaddi:setAnchorPoint(cc.p(0, 1));
				roaddi:setPosition(cc.p(128 * i, 0));
				self.bg1:addChild(roaddi, 1);
			elseif flag == 1 then
				road = gp.Sprite:create("road_1.png");
				road:setAnchorPoint(cc.p(0, 0));
				road:setPosition(cc.p(26 + 128 * i, 0));
				road:ignoreAnchorPointForPosition(true);
				local body = cc.PhysicsBody:createBox(cc.size(40, 185), cc.PHYSICSBODY_MATERIAL_DEFAULT, cc.p(20, 0));
				body:setCategoryBitmask(16);
				body:setCollisionBitmask(0);
				body:setContactTestBitmask(0);
				body:setDynamic(false);
				road:setPhysicsBody(body);
				roaddi = gp.Sprite:create("road_4.png");
				roaddi:setAnchorPoint(cc.p(0, 1));
				roaddi:setPosition(cc.p(26 + 128 * i, 0));
				self.bg1:addChild(roaddi, 1);
			elseif flag == 2 then
				plant = gp.Sprite:create("enemy.png");
				plant:setAnchorPoint(cc.p(0.5, 0));
				plant:setPosition(cc.p(128 * i + 64, 112));
				self.bg1:addChild(plant, 1);
				road = gp.Sprite:create("road_1.png");
				road:ignoreAnchorPointForPosition(true);
				local body = cc.PhysicsBody:createBox(cc.size(40, 185), cc.PHYSICSBODY_MATERIAL_DEFAULT, cc.p(20, 0));
				body:setCategoryBitmask(16);
				body:setCollisionBitmask(0);
				body:setContactTestBitmask(0);
				body:setDynamic(false);
				road:setPhysicsBody(body);
				road:setFlipX(true);
				road:setAnchorPoint(cc.p(0, 0));
				road:setPosition(cc.p(128 * i, 0));
				roaddi = gp.Sprite:create("road_4.png");
				roaddi:setFlipX(true);
				roaddi:setAnchorPoint(cc.p(0, 1));
				roaddi:setPosition(cc.p(128 * i, 0));
				self.bg1:addChild(roaddi, 1);
			elseif flag == 3 then
				road = gp.Sprite:create("road_5.png");
				road:setAnchorPoint(cc.p(0, 0));
				road:setPosition(cc.p(128 * i, 0));
				road:ignoreAnchorPointForPosition(true);
				local body = cc.PhysicsBody:createBox(cc.size(40, 185), cc.PHYSICSBODY_MATERIAL_DEFAULT, cc.p(20, 0));
				body:setCategoryBitmask(16);
				body:setCollisionBitmask(0);
				body:setContactTestBitmask(0);
				body:setDynamic(false);
				road:setPhysicsBody(body);
			end		
			self.bg1:addChild(road, 1);
		end
	end
end

---[[
function AFMap:initBackGroundEle_2(  )
	local bg2shu = MCLASS(MOD.LOAD, "MapData").bg2shu
	for i=1,7 do
		local roaddi = nil;
		local plant = nil;
		local flag = bg2shu[i]
		if (flag ~= -1) then
			local road = nil;
			if flag == 0 then
				road1 = gp.Sprite:create("road_2.png");
				road1:setAnchorPoint(cc.p(0, 0));
				road1:setPosition(cc.p(128 * i, 0));
				roaddi = gp.Sprite:create("road_3.png");
				roaddi:setAnchorPoint(cc.p(0, 1));
				roaddi:setPosition(cc.p(128 * i, 0));
				self.bg2:addChild(roaddi, 1);
			elseif flag == 1 then
				plant = gp.Sprite:create("back_3.png");
				plant:setAnchorPoint(cc.p(0.5, 0));
				plant:setPosition(cc.p(128 * i + 128, 117));
				self.bg2:addChild(plant, 1);
				road1 = gp.Sprite:create("road_1.png");
				road1:setAnchorPoint(cc.p(0, 0));
				road1:setPosition(cc.p(26 + 128 * i, 0));
				roaddi = gp.Sprite:create("road_4.png");

				roaddi:setAnchorPoint(cc.p(0, 1));
				roaddi:setPosition(cc.p(26 + 128 * i, 0));
				self.bg2:addChild(roaddi, 1);
			elseif flag == 2 then
				road1 = gp.Sprite:create("road_1.png");
				road1:setFlipX(true);
				road1:setAnchorPoint(cc.p(0, 0));
				road1:setPosition(cc.p(128 * i, 0));
				roaddi = gp.Sprite:create("road_4.png");
				roaddi:setFlipX(true);
				roaddi:setAnchorPoint(cc.p(0, 1));
				roaddi:setPosition(cc.p(128 * i, 0));
				self.bg2:addChild(roaddi, 1);
			elseif flag == 3 then
				road1 = gp.Sprite:create("road_5.png");
				road1:setAnchorPoint(cc.p(0, 0));
				road1:setPosition(cc.p(128 * i, 0));
				road1:ignoreAnchorPointForPosition(true);
				local body = cc.PhysicsBody:createBox(cc.size(120, 20), cc.PHYSICSBODY_MATERIAL_DEFAULT, cc.p(60, 80));
				body:setCategoryBitmask(1);
				body:setCollisionBitmask(1);
				body:setContactTestBitmask(16);
				body:setDynamic(false);
				road1:setPhysicsBody(body);
			end
			self.bg2:addChild(road1, 1);
		end
	end
end
--]]
return AFMap

