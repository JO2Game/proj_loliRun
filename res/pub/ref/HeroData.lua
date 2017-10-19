
Ref = Ref or {}

local HeroData = {}
Ref.HeroData = HeroData

HeroData.HaveHero = {
	{DuiZhang = {id=3,name = "佐小弟"}},
	{ChengYuan1 = {id=5,name = "艾利查卡多" }}
}

HeroData.hero={
	{id=3,s1 = "heiyanjineng",name="山石姬",iconName="touxiang-heiyan",model="sp-heiyan",textureName="skeletion",start=1,qualityLevel=1,artType=3,objType=1,scale=0.8,effectTextureName="skeletion_effect",quality=98,cubage=1,forwardForce=30000,forwardWeakFric=300,jumpForce=13000,secondJumpForce=1000,ThrowForceId=11,IfThrow=1,roleExtEffect="remote_changzidan#remote_daodan",EnemyBeRaisePosition="31-183",DownGetPA=3,DownGetPATime=3,InitialForce=13,InitialConstitution=6,InitialAgility=7,InitialIntelligence=3,InitialFocus=5,InitialBlood=2800,TimeRecoveryBlood=0.2,InitialMagic=100,TimeRecoveryMagic=3,MagicUpperLimit=100,InitialPhysicalAttack=23.4,InitialPhysicalDefense=0,InitialMagicAttack=41.4,InitialMagicDefense=9,InitialHit=30,InitialDodge=12,InitialCritical=16,InitialCriticalResistance=21,InitialCriticalStrikes=150,PhysicalPenetration=2.7,MagicPenetration=1.2,ForceDevelopment=1.4,ConstitutionDevelopment=0.6,AgilityDevelopment=1.1,IntelligenceDevelopment="职业：炮姬\n属性：火\n身高：170cm\n故乡：幻隐城\n宣言：难道你以为这是剑？幼稚…",FocusDevelopment="简介：幻隐城最有名的远攻没有之一，意念世界传说中的北天杀神。\n\n其实我没有怪你的意思，当初是我自己选择离开的，况且我也已经习惯了",Introduction="——致那只傻傻的领主",dialog="1#2#3#4",fateskill="1#2#3#4",RoleGetDes="副本有概率掉落、商店有几率出售"},

	{id=4,s1 = "lvjurenjineng",name="绿仔",iconName="touxiang-lvjuren",model="sp-lvjuren",textureName="skeletion",start=1,qualityLevel=1,artType=1,objType=1,scale=0.8,effectTextureName="skeletion_effect",quality=102,cubage=1,forwardForce=30000,forwardWeakFric=300,jumpForce=13000,secondJumpForce=1000,ThrowForceId=45,IfThrow=1,roleExtEffect="dimiankeng",EnemyBeRaisePosition="77-270",DownGetPA=3,DownGetPATime=3,InitialForce=12,InitialConstitution=10,InitialAgility=2,InitialIntelligence=5,InitialFocus=7,InitialBlood=2600,TimeRecoveryBlood=0.2,InitialMagic=100,TimeRecoveryMagic=3,MagicUpperLimit=100,InitialPhysicalAttack=24.4,InitialPhysicalDefense=0.5,InitialMagicAttack=35.4,InitialMagicDefense=6,InitialHit=33,InitialDodge=3,InitialCritical=20,InitialCriticalResistance=6,InitialCriticalStrikes=150,PhysicalPenetration=2.3,MagicPenetration=2,ForceDevelopment=0.4,ConstitutionDevelopment=1,AgilityDevelopment=1.3,IntelligenceDevelopment="职业：巨力\n属性：风\n身高：200cm\n故乡：巨人森林\n宣言：是谁在作死！",FocusDevelopment="简介：近战肉搏开创者，连续六年稳居世界霸主首位，打死的恶灵连起来可以环绕地球两周。\n\n我发誓，我跟奶茶一点关系也没有……\n",Introduction="——致奶茶",dialog="5#6#7#8",fateskill="5#6#7#8",RoleGetDes="副本有概率掉落、商店有几率出售"},

	{id=5,s1 = "liandaojineng",name="艾利查卡多",iconName="touxiang-sishen",model="sp-liandao",textureName="skeletion",start=1,qualityLevel=1,artType=5,objType=1,scale=0.8,effectTextureName="skeletion_effect",quality=98,cubage=1,forwardForce=30000,forwardWeakFric=300,jumpForce=13000,secondJumpForce=1000,ThrowForceId=55,IfThrow=1,roleExtEffect="remote_liandao-wuqi",EnemyBeRaisePosition="20-188",DownGetPA=3,DownGetPATime=3,InitialForce=4,InitialConstitution=5,InitialAgility=8,InitialIntelligence=13,InitialFocus=6,InitialBlood=2800,TimeRecoveryBlood=0.2,InitialMagic=100,TimeRecoveryMagic=3,MagicUpperLimit=100,InitialPhysicalAttack=40.4,InitialPhysicalDefense=8.5,InitialMagicAttack=23.4,InitialMagicDefense=0,InitialHit=31,InitialDodge=13,InitialCritical=18,InitialCriticalResistance=23,InitialCriticalStrikes=150,PhysicalPenetration=0.8,MagicPenetration=1,ForceDevelopment=1.5,ConstitutionDevelopment=2.5,AgilityDevelopment=1.2,IntelligenceDevelopment="法师\n属性：冰\n身高：170cm\n故乡：未知\n宣言：你的血很好吃哎，草莓味的吧!",FocusDevelopment="简介：镰刀上封印着强大魔法的神秘少女，无人知晓她为何而战。\n\n再看我，再看我小心我把你喝了！\n ",Introduction="——致玩游戏的你",dialog="9#10#11#12",fateskill="9#10#11#12",RoleGetDes="副本有概率掉落、商店有几率出售"},

	{id=6,s1 = "caotijingjineng",name="技术草",iconName="touxiang-caotijing",model="sp-caotijing",textureName="skeletion",start=1,qualityLevel=1,artType=3,objType=1,scale=0.8,effectTextureName="skeletion_effect",quality=99,cubage=1,forwardForce=30000,forwardWeakFric=300,jumpForce=13000,secondJumpForce=1000,ThrowForceId=64,IfThrow=1,roleExtEffect="......",EnemyBeRaisePosition="23-195",DownGetPA=3,DownGetPATime=3,InitialForce=10,InitialConstitution=6,InitialAgility=5,InitialIntelligence=7,InitialFocus=8,InitialBlood=2800,TimeRecoveryBlood=0.2,InitialMagic=100,TimeRecoveryMagic=3,MagicUpperLimit=100,InitialPhysicalAttack=26.4,InitialPhysicalDefense=1.5,InitialMagicAttack=33.4,InitialMagicDefense=5,InitialHit=37,InitialDodge=9,InitialCritical=23,InitialCriticalResistance=15,InitialCriticalStrikes=150,PhysicalPenetration=1.9,MagicPenetration=1.2,ForceDevelopment=1,ConstitutionDevelopment=1.4,AgilityDevelopment=1.5,IntelligenceDevelopment="职业：拳师\n属性：火\n身高：175cm\n故乡：拳皇城\n宣言：据说八神写了一本叫做万菊抄的书，我得去看看……\n",FocusDevelopment="简介：特级拳师，少年时代梦想着自己能够成为一个手艺超群的厨子。\n\n你看，并不是每个人的梦想都能实现\n",Introduction="——致没能实现少年梦想的每一个人",dialog="13#14#15#16",fateskill="13#14#15#16",RoleGetDes="副本有概率掉落、商店有几率出售"},

	{id=7,s1 = "zuozhujineng",name="佐小弟",iconName="touxiang-zuozhu",model="sp-zuozhu",textureName="skeletion",start=3,qualityLevel=1,artType=4,objType=1,scale=0.8,effectTextureName="skeletion_effect",quality=99,cubage=1,forwardForce=30000,forwardWeakFric=300,jumpForce=13000,secondJumpForce=1000,ThrowForceId=70,IfThrow=1,roleExtEffect="remote_renzhefeibiao",EnemyBeRaisePosition="22-189",DownGetPA=3,DownGetPATime=3,InitialForce=12,InitialConstitution=5,InitialAgility=8,InitialIntelligence=4,InitialFocus=6,InitialBlood=2800,TimeRecoveryBlood=0.2,InitialMagic=100,TimeRecoveryMagic=3,MagicUpperLimit=100,InitialPhysicalAttack=20,InitialPhysicalDefense=0,InitialMagicAttack=34,InitialMagicDefense=7,InitialHit=32,InitialDodge=13,InitialCritical=19,InitialCriticalResistance=22,InitialCriticalStrikes=150,PhysicalPenetration=2.4,MagicPenetration=1,ForceDevelopment=1.45,ConstitutionDevelopment=0.9,AgilityDevelopment=1.25,IntelligenceDevelopment="职业：忍者\n属性：火\n身高：175cm\n故乡：未知\n宣言：白痴……\n",FocusDevelopment="简介：意念世界深度无口患者之一，有着多重身份的忍者，有关他的故事此处省略一万字……\n\n他什么都没说，只是一脸鄙视地望着你",Introduction="——.....",dialog="17#18#19#20",fateskill="17#18#19#20",RoleGetDes="超值礼包可以获得，商店有几率出售"},

	{id=8,s1 = "lufeijineng",name="吃货一郎",iconName="touxiang-lufei",model="sp-lufei",textureName="skeletion",start=2,qualityLevel=1,artType=2,objType=1,scale=0.8,effectTextureName="skeletion_effect",quality=99,cubage=1,forwardForce=30000,forwardWeakFric=300,jumpForce=13000,secondJumpForce=1000,ThrowForceId=105,IfThrow=1,roleExtEffect="ammdimianshui",EnemyBeRaisePosition="20-180",DownGetPA=3,DownGetPATime=3,InitialForce=5,InitialConstitution=5,InitialAgility=5,InitialIntelligence=5,InitialFocus=5,InitialBlood=2800,TimeRecoveryBlood=0.2,InitialMagic=100,TimeRecoveryMagic=3,MagicUpperLimit=100,InitialPhysicalAttack=33,InitialPhysicalDefense=6,InitialMagicAttack=32,InitialMagicDefense=5.5,InitialHit=31,InitialDodge=13,InitialCritical=18,InitialCriticalResistance=23,InitialCriticalStrikes=150,PhysicalPenetration=0.8,MagicPenetration=1,ForceDevelopment=1.5,ConstitutionDevelopment=2.5,AgilityDevelopment=1.2,IntelligenceDevelopment="职业：美食家\n属性：木\n身高：175cm\n故乡：跃马港\n宣言：你看我的皮肤可以弹~弹~弹~\n",FocusDevelopment="简介：著名美食家、旅行家、航海家以及职业加油打气热血沸腾家。最擅长的事是吃饭。\n\n然而，我就是那个怎么吃都不会胖的瘦子！\n",Introduction="——致一吃就会胖的绿崽",dialog="21#22#23#24",fateskill="21#22#23#24",RoleGetDes="商店有几率出售"},

	{id=9,s1 = "ammjineng",name="僵sir",iconName="touxiang-amumu",model="sp-amm",textureName="skeletion",start=2,qualityLevel=1,artType=2,objType=1,scale=0.8,effectTextureName="skeletion_effect",quality=99,cubage=1,forwardForce=30000,forwardWeakFric=300,jumpForce=13000,secondJumpForce=1000,ThrowForceId=80,IfThrow=1,roleExtEffect=".....",EnemyBeRaisePosition="30-190",DownGetPA=3,DownGetPATime=3,InitialForce=7,InitialConstitution=11,InitialAgility=7,InitialIntelligence=5,InitialFocus=7,InitialBlood=2600,TimeRecoveryBlood=0.2,InitialMagic=100,TimeRecoveryMagic=3,MagicUpperLimit=100,InitialPhysicalAttack=29,InitialPhysicalDefense=5,InitialMagicAttack=32,InitialMagicDefense=6.5,InitialHit=35,InitialDodge=13,InitialCritical=21,InitialCriticalResistance=21,InitialCriticalStrikes=150,PhysicalPenetration=1.3,MagicPenetration=2.1,ForceDevelopment=1.3,ConstitutionDevelopment=1,AgilityDevelopment=1.3,IntelligenceDevelopment="职业：Costume\n属性：木\n身高：170cm\n故乡：就算全世界反对你的梦想，也要努力去证明自己是对的！\n",FocusDevelopment="简介：万众瞩目的人气王，因为高超的僵尸cosplay吸引了众多眼球，是当下红极一时的漫联社新星。\n就算全世界反对你的梦想，也要努力去证明自己是对的！\n",Introduction="——致僵尸",dialog="25#26#27#28",fateskill="25#26#27#28",RoleGetDes="商店有几率出售"},


	{id=10,s1 = "mianhuatangjineng",name="糯米团子",iconName="touxiang-mianhuatang",model="sp-mianhuatang",textureName="skeletion",start=4,qualityLevel=1,artType=5,objType=1,scale=0.8,effectTextureName="skeletion_effect",quality=101,cubage=1,forwardForce=30000,forwardWeakFric=300,jumpForce=13000,secondJumpForce=1000,ThrowForceId=94,IfThrow=1,roleExtEffect=".....",EnemyBeRaisePosition="20-220",DownGetPA=3,DownGetPATime=3,InitialForce=6,InitialConstitution=10,InitialAgility=2,InitialIntelligence=11,InitialFocus=7,InitialBlood=2600,TimeRecoveryBlood=0.2,InitialMagic=100,TimeRecoveryMagic=3,MagicUpperLimit=100,InitialPhysicalAttack=31,InitialPhysicalDefense=5,InitialMagicAttack=22,InitialMagicDefense=1,InitialHit=35,InitialDodge=4,InitialCritical=21,InitialCriticalResistance=6,InitialCriticalStrikes=150,PhysicalPenetration=1.2,MagicPenetration=2,ForceDevelopment=0.4,ConstitutionDevelopment=2.1,AgilityDevelopment=1.3,IntelligenceDevelopment="职业：守护者\n属性：冰\n身高：200cm\n故乡：北疆\n宣言：你能帮我把这支玫瑰送给山顶上的女王吗？\n",FocusDevelopment="简介：北疆雪山幻化出的守护神，每当月亮升起的晴朗的夜晚，他都会前往风之女王的宫殿为她唱歌。\n如果你愿意，我们可以从诗词歌赋谈到人生哲学\n",Introduction="——致我的女王",dialog="29#30#31#32",fateskill="29#30#31#32",RoleGetDes="开启圣王宝箱有几率获得"}
}

--]]
HeroData.level = {
	10,
	15,
	20,
	25,
	30,
	40,
	50,
	60,
	70,
	80,
	100,
	120,
	10,
	160,
	180,
	210,
	240,
	270,
	300,
	330
}
--equipPosition那个位置
--增加什么属性
--SellPrice出售价格
HeroData.equipment={
	{id=10001,icon="wuqi1-icon",name="开荒剑",quality=1,equipPosition=1,equipType=1,FragmentID=10,FragmentNumber=1,SellPrice=10001,AttrID=20001,HideAttr1=30001,HideAttr2=40001,HideAttr3=50001,HideAttr4=1},

	{id=10002,icon="yifu1-icon",name="后街T恤",quality=1,equipPosition=2,equipType=1,FragmentID=10,FragmentNumber=2,SellPrice=10002,AttrID=20002,HideAttr1=30002,HideAttr2=40002,HideAttr3=50001,HideAttr4=1},

	{id=10003,icon="shoutao1-icon",name="牛仔手套",quality=1,equipPosition=3,equipType=1,FragmentID=10,FragmentNumber=3,SellPrice=10003,AttrID=20003,HideAttr1=30003,HideAttr2=40003,HideAttr3=50003,HideAttr4=1},


	{id=10004,icon="xiezi1-icon",name="学者板鞋",quality=1,equipPosition=4,equipType=1,FragmentID=10,FragmentNumber=4,SellPrice=10004,AttrID=20004,HideAttr1=30004,HideAttr2=40004,HideAttr3=50004,HideAttr4=1},

	{id=10005,icon="xianglian1-icon",name="防御项链",quality=1,equipPosition=5,equipType=1,FragmentID=10,FragmentNumber=5,SellPrice=10005,AttrID=20005,HideAttr1=30005,HideAttr2=40005,HideAttr3=50005,HideAttr4=1},

	{id=10006,icon="kuzi1-icon",name="力量长裤",quality=1,equipPosition=6,equipType=1,FragmentID=10,FragmentNumber=6,SellPrice=10006,AttrID=20006,HideAttr1=30006,HideAttr2=40006,HideAttr3=50006,HideAttr4=1},

	{id=10007,icon="wuqi1-icon",name="长剑",quality=2,equipPosition=1,equipType=1,FragmentID=10,FragmentNumber=7,SellPrice=10007,AttrID=20007,HideAttr1=30007,HideAttr2=40007,HideAttr3=50007,HideAttr4=1},

	{id=10008,icon="yifu1-icon",name="巨木T恤",quality=2,equipPosition=2,equipType=1,FragmentID=10,FragmentNumber=8,SellPrice=10008,AttrID=20008,HideAttr1=30008,HideAttr2=40008,HideAttr3=50008,HideAttr4=1},


	{id=10009,icon="shoutao1-icon",name="战阵手套",quality=2,equipPosition=3,equipType=1,FragmentID=10,FragmentNumber=9,SellPrice=10009,AttrID=20009,HideAttr1=30009,HideAttr2=40009,HideAttr3=50009,HideAttr4=1},

	{id=10010,icon="xiezi1-icon",name="言武板鞋",quality=2,equipPosition=4,equipType=1,FragmentID=10,FragmentNumber=10,SellPrice=10010,AttrID=20010,HideAttr1=30010,HideAttr2=40010,HideAttr3=50010,HideAttr4=1},

	{id=10011,icon="xianglian1-icon",name="流云项链",quality=2,equipPosition=5,equipType=1,FragmentID=10,FragmentNumber=11,SellPrice=10011,AttrID=20011,HideAttr1=30011,HideAttr2=40011,HideAttr3=50011,HideAttr4=1},

	{id=10012,icon="kuzi1-icon",name="行者长裤",quality=2,equipPosition=6,equipType=1,FragmentID=10,FragmentNumber=12,SellPrice=10012,AttrID=20012,HideAttr1=30012,HideAttr2=40012,HideAttr3=50012,HideAttr4=1},

	{id=10013,icon="wuqi2-icon",name="暗·临风斩",quality=5,equipPosition=1,equipType=1,FragmentID=10,FragmentNumber=13,SellPrice=10013,AttrID=20013,HideAttr1=30013,HideAttr2=40013,HideAttr3=50013,HideAttr4=1},

	{id=10014,icon="yifu2-icon",name="暗·沧澜外套",quality=5,equipPosition=2,equipType=1,FragmentNumber=14,SellPrice=10014,AttrID=20014,HideAttr1=30014,HideAttr2=40014,HideAttr3=50014,HideAttr4=1},

	{id=10015,icon="xiezi2-icon",name="暗·奥斯皮靴",quality=5,equipPosition=4,equipType=1,FragmentNumber=15,SellPrice=10015,AttrID=20015,HideAttr1=30015,HideAttr2=40015,HideAttr3=50015,HideAttr4=1},

	{id=10016,icon="yifu3-icon",name="掣·幻燚外套",quality=6,equipPosition=2,equipType=1,FragmentNumber=16,SellPrice=10016,AttrID=20016,HideAttr1=30016,HideAttr2=40016,HideAttr3=50016,HideAttr4=1},

	{id=10017,icon="wuqi4-icon",name="炽·灼炎斩",quality=7,equipPosition=1,equipType=1,FragmentID=10,FragmentNumber=17,SellPrice=10017,AttrID=20017,HideAttr1=30017,HideAttr2=40017,HideAttr3=50017,HideAttr4=1},

	{id=10018,icon="xiezi4-icon",name="炽·归云靴",quality=7,equipPosition=4,equipType=1,FragmentNumber=18,SellPrice=10018,AttrID=20018,HideAttr1=30018,HideAttr2=40018,HideAttr3=50018,HideAttr4=1},

	{id=10019,icon="yifu1-icon",name="后街T恤拼图",quality=1,equipPosition=2,equipType=2,FragmentID=2,FragmentNumber=10,HideAttr4=999},

	{id=10020,icon="yifu1-icon",name="巨木T恤拼图",quality=2,equipPosition=2,equipType=2,FragmentID=5,FragmentNumber=10,HideAttr4=999},

	{id=10021,icon="shoutao1-icon",name="助攻手套拼图",quality=3,equipPosition=3,equipType=2,FragmentID=10,HideAttr4=999},

	{id=10022,icon="shoutao1-icon",name="疾速手套拼图",quality=4,equipPosition=3,equipType=2,FragmentID=10,HideAttr4=999},

	{id=10023,icon="kuzi4-icon",name="炽·白焰长裤拼图",quality=7,equipPosition=6,equipType=2,FragmentID=10,HideAttr4=999},

	{id=10024,icon="kuzi5-icon",name="禁·苍月长裤拼图",quality=8,equipPosition=6,equipType=2,FragmentID=10,HideAttr4=999},


}
