
; POWER CHARGE
[Statedef 730]
type=S
physics=S
movetype=I
anim = 730;IfElse(var(0) = 75,750,730)
velset=0,0
ctrl=0


[State 8330, Snd]
type=playsnd
trigger1= !time
value=50,17
channel = 0
volume = 255


[State 730, power]
type=poweradd
triggerall= power<const(data.power) && power<powermax
trigger1= var(59)<=0 && (command="hold_z")
trigger2= var(59)>=1
value=2+ifelse(time<60,0,(time-60)/12)

;[State 730, flash]
;type=palfx
;trigger1= 1
;time=1
;add=75+ceil(sin(time/-6.0*pi)*75),25+ceil(sin(time/-6.0*pi)*25),0

[State 730, FX]
type=helper
trigger1= !numhelper(8330)
helpertype=normal
stateno=8330
ID=8330
name="Power Charge"
postype=p1
pausemovetime=65535
supermovetime=65535
ownpal=1

[State 730, FX]
type=helper
trigger1= !numhelper(8331)
helpertype=normal
stateno=8331
ID=8331
name="Particles"
postype=p1
pausemovetime=65535
supermovetime=65535
ownpal=1

[State -2, LifeAdd]
type = LIFEAdd
trigger1 = ((GameTime%25) = 0)
value = 1
kill = 0
absolute = 150
ignorehitpause = 1
persistent = 1

[State 1200, Flames]
type = Explod
trigger1 = time >= 10
trigger1 = Timemod = 3, 2
anim = 8221
pos = 0,-30
random = 50,50
sprpriority = 10
ownpal = 1
accel = -0.2,-0.05
velocity = 3,-2

[State 1200, Flames]
type = Explod
trigger1 = time >= 10
trigger1 = Timemod = 3, 2
anim = 8221
pos = 0,-50
random = 50,50
sprpriority = 10
ownpal = 1
accel = 0.2,-0.05
velocity = -3,-2

[State 730, End]
type=changestate
trigger1=  roundstate!=2
trigger2= var(59)<=0 && (command!="hold_z")
trigger3= var(59)>=1 && inguarddist; || p2bodydist x<=120)
value=731
ctrl=1

[state 731, maxpower]
type = changestate
trigger1= power>=const(data.power) || power >= powermax
trigger2= var(59)<=0 && (command!="hold_z")
trigger3= var(59)>=1 && inguarddist; || p2bodydist x<=120)
value = 760
ctrl = 1

;---END---
[Statedef 731]
type=S
physics=S
movetype=I
anim = 731;IfElse(var(0) = 75,751,731)
velset=0,0
ctrl=1

[State 731, stopsnd]
type=stopsnd
trigger1= !time
channel=0

[State 730, Snd]
type=playsnd
trigger1= !time && power>=const(data.power)
value=6,7
channel=0
persistent=0

[State 730, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1


;----------------------------------------------------------------------------
; do not touch
[Statedef 8330]
type=A
physics=N
movetype=I
anim=8330
ctrl=0
velset=0,0

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow

[State 8330, Bind]
type=bindtoroot
trigger1= (root,stateno=730)
pos=-7,0

[State 8330, Snd]
type=playsnd
trigger1= !time
value=0,730
channel=0

[State 1200, Flames]
type = Playsnd
trigger1 = Time = 0
Value = 7,8

[State 1200, Flames]
type = Playsnd
trigger1 = Timemod = 100,50
Value = 7,9

[State 8330, Aura]
type=explod
trigger1= !numexplod(8330)
ID=8330
anim=8330
sprpriority=3
postype=p1
bindtime=-1
removetime=-1
scale=.5,.5
pausemovetime=-1
supermovetime=-1
ownpal=1

[State 8330, Dust]
type=explod
trigger1= !(time%6)
anim=8105
sprpriority=-3
postype=p1
pos=0,-ceil(pos y)
scale=.5,.5
pausemovetime=-1
supermovetime=-1
ownpal=1

[State 8330, FX]
type=modifyexplod
trigger1= numexplod(8330) && root,power<3000
ID=8330
scale= .5, .1 + .4*(root,power/3000.0)

[State 8330, FX]
type=modifyexplod
trigger1= numexplod(8330) && root,power>=3000
ID=8330
scale= .5, .5

[State 8330, End]
type=stopsnd
trigger1= root,stateno!=730
channel=0
channel=1

[State 8330, End]
type=removeexplod
trigger1= root,stateno!=730

[State 8330, End]
type=destroyself
trigger1= root,stateno!=730

;---Particles---
[Statedef 8331]
type=A
physics=N
movetype=I
anim=8331
ctrl=0
velset=0,0

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow

[State 8331, Bind]
type=bindtoroot
trigger1= !(time%8)
pos=ceil(-151+(random/3.125)),ceil(98-(random/3.125))

[State 8331, Particle]
type=explod
trigger1= (time%8)=1
anim=8331
sprpriority=ifelse(random<750,5,-1)
postype=p1
vel= ((rootdist x+9)/32.0), ((rootdist y-62)/32.0)
scale= ifelse(random<500,.5,-.5), ifelse(random<500,.5,-.5)
pausemovetime=-1
supermovetime=-1
ownpal=1

[State 8331, End]
type=removeexplod
trigger1= root,stateno!=730


[State 8331, End]
type=destroyself
trigger1= root,stateno!=730


;----------------------------------------------------------------------------

;-------------------------------------------------------------------------
;power max aura
[Statedef 760]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
anim = 760
ctrl = 0
sprpriority = 2

[State 2000, NHB]
type = nothitby
trigger1 = time = 0
value = SCA, NA, SA, NP, SA
time = 15

[State 2000, NHB]
type = hitby
trigger1 = time = 0
value = SCA, HA, HP, AT
time = 15

;[State 2000, Sound]
;type = PlaySnd
;trigger1 = AnimElem = 1
;value = 2000, 0
;channel = 0

[State 2000, Sound]
type = PlaySnd
trigger1 = AnimElem = 5;16
value = 2000, 1

[State 2000, NoPush]
; Kikyo Can't be pushed back when using
type = PlayerPush
trigger1 = 1
value = 0

[State 2000, Aura]
type = Helper
trigger1 = AnimElem = 15;16
helpertype = normal
name = "aura"
ID = 20001
pos = 0,-54
postype = p1
facing = 1
stateno = 20001
anim=1401

[State 2000, I Pity Da Foo Who Gets Pushed Back By Dis]
; Now we just need a glass of milk
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 125,30
animtype = back
guardflag = MA
hitflag = MAF-
pausetime = 10,8
hitsound = s1, 1
guardsound = S2, 0
sparkxy = -42,-54
ground.type = High
ground.slidetime = 30
ground.hittime = 60
ground.velocity = ifelse(p2dist x>=0,-10,10),-1
airguard.velocity = ifelse(p2dist x>=0,-4,4),-1
air.velocity = ifelse(p2dist x>=0,-5,5),-4
air.hittime = 60
fall = 1
air.fall = 1
fall.yvelocity = 0
fall.recover = 0
getpower = 120,50
givepower = 20, 15

;[State -2, Varset]
;type = Varadd
;trigger1 = movehit
;v = 48
;value = 6
;persistent = 0
;ignorehitpause = 1

[State 2000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------
;必殺技
;--------------------------------------------------------------------

;---------------------------------------------------------------------------
;dengeki
[Statedef 1000]
type     = S
movetype = A
physics  = N
juggle   = 10
ctrl     = 0
anim     = 1000
poweradd = 0
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 32


[State 200]
type = Helper
trigger1 = time = 0
pos = -55,-44
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1003
stateNo = 1003
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200]
type = Helper
trigger1 = time = 14
pos = 110,-68
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1004
stateNo = 1004
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = time = 4
value = 4,1

[State 6000, 速度]
type = Velset
trigger1 = time = 15 && var(9)=0
x = 10

[State 6000, 速度]
type = Velset
trigger1 = time = 15 && var(9)!=0
x = 20

[State 6000, 速度]
type = Veladd
trigger1 = time >= 15 && vel X > 0
x = -1

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0,9

[State 200, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4&&var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 95,  25
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -60
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -8 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -8 -ceil(HitCount*0.25)
air.type = High
air.velocity = -4 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19

[State 200, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4&&var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 195,  45
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -60
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -8 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -8 -ceil(HitCount*0.25)
air.type = High
air.velocity = -4 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 120

[State 240, ステート変更]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;dengeki
[Statedef 1001]
type     = S
movetype = A
physics  = N
juggle   = 10
ctrl     = 0
anim     = 1001
poweradd = 0
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[state -2,補正]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 24

[State 200]
type = Helper
trigger1 = time = 0
pos = -55,-44
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1003
stateNo = 1003
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200]
type = Helper
trigger1 = time = 17
pos = 110,-68
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1004
stateNo = 1004
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = time = 4
value = 4,1


[State 6000, 速度]
type = Velset
trigger1 = time = 18 && var(9)=0
x = 12

[State 6000, 速度]
type = Velset
trigger1 = time = 18 && var(9)!=0
x = 24

[State 6000, 速度]
type = Veladd
trigger1 = time >= 18 && vel X > 0
x = -1

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0,9

[State 200, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 105,  30
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -60
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 24
ground.hittime  = 24
ground.velocity = -9 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -9 -ceil(HitCount*0.25)
air.type = High
air.velocity = -6 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19

[State 200, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 205,  60
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -60
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 24
ground.hittime  = 24
ground.velocity = -9 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -9 -ceil(HitCount*0.25)
air.type = High
air.velocity = -6 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 150

[State 240, ステート変更]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;dengeki
[Statedef 1002]
type     = S
movetype = A
physics  = N
juggle   = 10
ctrl     = 0
anim     = 1002
poweradd = 0
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 17

[State 200]
type = Helper
trigger1 = time = 0
pos = -55,-44
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1003
stateNo = 1003
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200]
type = Helper
trigger1 = time = 21
pos = 110,-68
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1004
stateNo = 1004
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = time = 4
value = 4,1


[State 6000, 速度]
type = Velset
trigger1 = time = 22 && var(9)=0
x = 16

[State 6000, 速度]
type = Velset
trigger1 = time = 22 && var(9)!=0
x = 32

[State 6000, 速度]
type = Veladd
trigger1 = time >= 22 && vel X > 0
x = -1

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0,9

[State 200, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 110,  35
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -60
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 29
ground.hittime  = 29
ground.velocity = -11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -11 -ceil(HitCount*0.25)
air.type = High
air.velocity = -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19

[State 200, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 210,  65
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -60
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 29
ground.hittime  = 29
ground.velocity = -11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -11 -ceil(HitCount*0.25)
air.type = High
air.velocity = -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 180

[State 240, ステート変更]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------


[Statedef 1003]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6020
ctrl = 0
hitdefpersist = 1 
sprpriority = 3

[State 240, 特殊]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1
pos = -55,-39

[State 240, 特殊]
type = Trans
trigger1 = time < 8
trans = addalpha
alpha = time*30,256

[State 240, 特殊]
type = Trans
trigger1 = time >= 8
trans = addalpha
alpha = 256,256

[State 240, 特殊]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240, ]
type = AngleDraw
trigger1 = 1
scale = 1.25,1.25
value = 30

[State 200, 消滅]
type = DestroySelf
trigger1 = root,stateno = [1000,1002]
trigger1 = root,animelem = 3
trigger2 = root,Movetype = H

;---------------------------------------------------------------------------


[Statedef 1004]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6020
ctrl = 0
hitdefpersist = 1 
sprpriority = 3

[State 240, 特殊]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1
pos = 110,-63

[State 240, 特殊]
type = Trans
trigger1 = time <= 8
trans = addalpha
alpha = 256,256

[State 240, 特殊]
type = Trans
trigger1 = time >= 8
trans = addalpha
alpha = 256-(time-8)*60,256

[State 240, 特殊]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240, ]
type = AngleDraw
trigger1 = 1
scale = 1.25,1.25
value = 180

[State 200, 消滅]
type = DestroySelf
trigger1 = time = 12
trigger2 = root,Movetype = H

;---------------------------------------------------------------------------
;blade
[Statedef 1100]
type     = S
movetype = A
physics  = S
juggle   = 10
ctrl     = 0
anim     = 1100
poweradd = 0
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = animelem = 2
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 2
pos = 10,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 1105
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = animelem = 2&&var(9)!=0
value = 1320,0

[State 1200,***]
type = helper
trigger1=animelem=2&&var(9)!=0
name = "b2"
id = 1421
pos = 50,0
postype = p1
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 130

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = time = 4
value = 0,9

[State 240, ステート変更]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;blade
[Statedef 1101]
type     = S
movetype = A
physics  = S
juggle   = 10
ctrl     = 0
anim     = 1101
poweradd = 0
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = animelem = 2
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 2
pos = 50,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 1105
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = animelem = 2&&var(9)!=0
value = 1320,0

[State 1200,***]
type = helper
trigger1=animelem=2&&var(9)!=0
name = "b2"
id = 1421
pos = 90,0
postype = p1
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 170

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = time = 4
value = 0,9

[State 240, ステート変更]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;blade
[Statedef 1102]
type     = S
movetype = A
physics  = S
juggle   = 10
ctrl     = 0
anim     = 1102
poweradd = 0
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = animelem = 2
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 2
pos = 80,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 1105
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = animelem = 2&&var(9)!=0
value = 1320,0

[State 1200,***]
type = helper
trigger1=animelem=2&&var(9)!=0
name = "b2"
id = 1421
pos = 120,0
postype = p1
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 200

[State 240, 音を鳴らす]
type = PlaySnd
trigger1 = time = 4
value = 0,9

[State 240, ステート変更]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------

[Statedef 1105]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6030
ctrl = 0
hitdefpersist = 1 
sprpriority = 3

[State 240, 特殊]
type = Trans
trigger1 = time <= 20
trans = addalpha
alpha = 256,156

[State 240, 特殊]
type = Trans
trigger1 = time >= 20
trans = addalpha
alpha = 256-(time-20)*60,256

[state -2,補正]
type = Parentvaradd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 16

[State 200, ヒット定義]
type = HitDef
triggerall = root,fvar(1) != 100
trigger1 = time = 0
attr = S, SA ;立ち通常打撃（Standing, Normal Attack）
damage = Floor(90*0.01*(100-root,fvar(1))),  20
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 0, 10
sparkno = S6004
guard.sparkno     = -1
sparkxy = 5, -70
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 26
ground.hittime  = 26
ground.velocity = -1 -ceil(HitCount*0.25),-6
ground.cornerpush.veloff = 0
air.type = High
air.velocity = -1 -ceil(HitCount*0.25),-5
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19
fall = 1
fall.recovertime = 20

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 80

[State 240, エフェクト]
type = Explod
trigger1 = time = 20
anim = 6031
ID = 6031
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = -2
scale = 0.5,0.5
sprpriority = 4

[State 240, 特殊]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240, ]
type = AngleDraw
trigger1 = time <= 3
scale = 0.125*time,0.125*time

[State 240, ]
type = AngleDraw
trigger1 = time > 3
scale = 0.5,0.5

[State 200, 消滅]
type = DestroySelf
trigger1 = time = 36
trigger2 = root,Movetype = H

;---------------------------------------------------------------------------
;cure
[Statedef 1150]
type     = S
movetype = A
physics  = N
juggle   = 10
ctrl     = 0
anim     = 1150
poweradd = -250
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[State 240, エフェクト]
type = Explod
trigger1 = time = 5
anim = 6032
ID = 6032
pos = 0,-40
postype = P1
facing = 1
bindtime = 1
removetime = -2
scale = 0.5,0.5
sprpriority = 4

[State 0, Helper]
type = Helper
trigger1 = time = 34
helpertype = normal ;player
name = "regain"
ID = 6032
stateno = 6032
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .25
size.yscale = .25

[state -2]
type = varadd
trigger1 = time = 34
persistent = 0
ignorehitpause = 1
var(5) = 300

[State 240]
type = PlaySnd
trigger1 = time = 5
value = 6,0
volume = 50

[State 240, ステート変更]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;------------------------------------------------------------------------


;------------------------------------------------
;two inch
[statedef 1300]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
poweradd = -500
anim = 13000

[State 0, PalFX]
type = PalFX
trigger1 = time = 0
time = 0
add = 0,0,0
mul = 256,256,256
invertall = 0
color = 256

;[State 0, VarSet]
;type = VarSet
;triggerall = var(58) = 1
;trigger1 = time = 0
;v = 58
;value = 0
[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 100

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11110
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11111
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11112
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 9111
ID = 9111
pos = 0,-70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1
removeongethit = 1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 5
value = S1001,3

[State 1400]
type = HitDef
trigger1 = Animelem = 2
attr = A, SA
animtype  = diagup
damage    = 30,2
guardflag = MA
hitflag = MAF
pausetime = 10,5
sparkno = -1
guard.sparkno = S4620
sparkxy = -30,-70
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 23
ground.hittime = 22
ground.velocity = -5,-5
guard.velocity = -10
airguard.velocity = -4.0,-3.0
air.velocity = -5,-5
juggle = 1
air.juggle = 1
fall = 1
fall.recover = 0

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 1201
ID = 1201
pos = 10,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 40
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 9106
ID = 9106
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 708
ID = 708
pos = -50,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 709
ID = 709
pos = 50,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 2
value = 255,255,255
time = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1000,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S9100,2

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
time = 10
freq = 75
ampl = 3

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------------------------------------------------
[statedef 1301]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
poweradd = -650
anim = 13000

[State 0, PalFX]
type = PalFX
trigger1 = time = 0
time = 0
add = 0,0,0
mul = 256,256,256
invertall = 0
color = 256

;[State 0, VarSet]
;type = VarSet
;triggerall = var(58) = 1
;trigger1 = time = 0
;v = 58
;value = 0
[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 100

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11110
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11111
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11112
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11113
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 9111
ID = 9111
pos = 0,-70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1
removeongethit = 1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 5
value = S1001,3

[State 1400]
type = HitDef
trigger1 = Animelem = 2
attr = A, SA
animtype  = diagup
damage    = 30,2
guardflag = MA
hitflag = MAF
pausetime = 10,5
sparkno = -1
guard.sparkno = S4620
sparkxy = -30,-70
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 23
ground.hittime = 22
ground.velocity = -5,-5
guard.velocity = -10
airguard.velocity = -4.0,-3.0
air.velocity = -5,-5
juggle = 1
air.juggle = 1
fall = 1
fall.recover = 0

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 1201
ID = 1201
pos = 10,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 40
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 9106
ID = 9106
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 708
ID = 708
pos = -50,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 709
ID = 709
pos = 50,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 2
value = 255,255,255
time = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1000,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S9100,2

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
time = 10
freq = 75
ampl = 3

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------------------------------------------------
[statedef 1302]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
poweradd = -800
anim = 13000

[State 0, PalFX]
type = PalFX
trigger1 = time = 0
time = 0
add = 0,0,0
mul = 256,256,256
invertall = 0
color = 256

;[State 0, VarSet]
;type = VarSet
;triggerall = var(58) = 1
;trigger1 = time = 0
;v = 58
;value = 0
[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 100

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11110
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11111
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11112
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11113
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 1101]
type = Helper
trigger1 = time = 5
helpertype = normal
name = "sprite"
postype = p1
pos = 0,-70
stateno = 11114
id = 1110
keyctrl = 0
ownpal = 1
facing = 1
sprpriority = 2

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 9111
ID = 9111
pos = 0,-70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1
removeongethit = 1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 5
value = S1001,3

[State 1400]
type = HitDef
trigger1 = Animelem = 2
attr = A, SA
animtype  = diagup
damage    = 30,2
guardflag = MA
hitflag = MAF
pausetime = 10,5
sparkno = -1
guard.sparkno = S4620
sparkxy = -30,-70
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 23
ground.hittime = 22
ground.velocity = -5,-5
guard.velocity = -10
airguard.velocity = -4.0,-3.0
air.velocity = -5,-5
juggle = 1
air.juggle = 1
fall = 1
fall.recover = 0

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 1201
ID = 1201
pos = 10,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 40
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 9106
ID = 9106
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 708
ID = 708
pos = -50,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 709
ID = 709
pos = 50,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -2
ownpal = 1

[State 0, EnvColor]
type = EnvColor
trigger1 = animelem = 2
value = 255,255,255
time = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1000,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S9100,2

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
time = 10
freq = 75
ampl = 3

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------------------------------------------------

[Statedef 11110]
type = A
movetype = A
physics = N
anim = 1110
velset = -5,-5
sprpriority = 7

[State 0, Explod]
type = Explod
trigger1 = time = [0,50]
anim = 9700
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
random = 60,105
removetime = -2
scale = 0.5,0.5
sprpriority = -2
ownpal = 1
removeongethit = 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 9200
ID = 9200
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25,0.25
sprpriority = 9999999999
ownpal = 1

[State 1110]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X< 0
trigger1 = Vel X >= -6
x = -0.3

[State 1110]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X > 0
trigger1 = Vel X <= 6
x = 0.3

[State 1110]
type = veladd
trigger1 = 1
y = 0.2

[State 1110]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1113]
type = HitDef
trigger1 = animelem = 1
attr = S, SP
animtype = Hard
damage = 0,0
pausetime = 0, 5
guardflag = MA
hitflag = MAFP
priority = 7
sprpriority = 7
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
hitsound  = -1
guardsound = -1

[State 1113]
type = ChangeState
trigger1 = Pos Y >= 0
trigger2 = movecontact = 1
value = 11120


[Statedef 11111]
type = A
movetype = A
physics = N
anim = 1110
velset = 0,-7
sprpriority = 7

[State 0, Explod]
type = Explod
trigger1 = time = [0,50]
anim = 9700
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
random = 60,105
removetime = -2
scale = 0.5,0.5
sprpriority = -2
ownpal = 1
removeongethit = 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 9200
ID = 9200
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25,0.25
sprpriority = 9999999999
ownpal = 1

[State 1111]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X< 0
trigger1 = Vel X >= -6
x = -0.3

[State 1111]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X > 0
trigger1 = Vel X <= 6
x = 0.3

[State 1111]
type = veladd
trigger1 = 1
y = 0.2

[State 1111]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1113]
type = HitDef
trigger1 = animelem = 1
attr = S, SP
animtype = Hard
damage = 0,0
pausetime = 0, 5
guardflag = MA
hitflag = MAFP
priority = 7
sprpriority = 7
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
hitsound  = -1
guardsound = -1

[State 1113]
type = ChangeState
trigger1 = Pos Y >= 0
trigger2 = movecontact = 1
value = 11120

;--------------------------------------------------------------

[Statedef 11112]
type = A
movetype = A
physics = N
anim = 1110
velset = 5,-5
sprpriority = 7

[State 0, Explod]
type = Explod
trigger1 = time = [0,50]
anim = 9700
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
random = 60,105
removetime = -2
scale = 0.5,0.5
sprpriority = -2
ownpal = 1
removeongethit = 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 9200
ID = 9200
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25,0.25
sprpriority = 9999999999
ownpal = 1

[State 1112]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X< 0
trigger1 = Vel X >= -6
x = -0.3

[State 1112]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X > 0
trigger1 = Vel X <= 6
x = 0.3

[State 1112]
type = veladd
trigger1 = 1
y = 0.3

[State 1112]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1113]
type = HitDef
trigger1 = animelem = 1
attr = S, SP
animtype = Hard
damage = 0,0
pausetime = 0, 5
guardflag = MA
hitflag = MAFP
priority = 7
sprpriority = 7
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
hitsound  = -1
guardsound = -1

[State 1113]
type = ChangeState
trigger1 = Pos Y >= 0
trigger2 = movecontact = 1
value = 11120

;------------------------------------------------------

[Statedef 11113]
type = A
movetype = A
physics = N
anim = 1110
velset = 6,-7
sprpriority = 7

[State 0, Explod]
type = Explod
trigger1 = time = [0,50]
anim = 9700
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
random = 60,105
removetime = -2
scale = 0.5,0.5
sprpriority = -2
ownpal = 1
removeongethit = 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 9200
ID = 9200
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25,0.25
sprpriority = 9999999999
ownpal = 1

[State 1112]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X< 0
trigger1 = Vel X >= -6
x = -0.3

[State 1112]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X > 0
trigger1 = Vel X <= 6
x = 0.3

[State 1112]
type = veladd
trigger1 = 1
y = 0.3

[State 1112]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1113]
type = HitDef
trigger1 = animelem = 1
attr = S, SP
animtype = Hard
damage = 0,0
pausetime = 0, 5
guardflag = MA
hitflag = MAFP
priority = 7
sprpriority = 7
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
hitsound  = -1
guardsound = -1

[State 1113]
type = ChangeState
trigger1 = Pos Y >= 0
trigger2 = movecontact = 1
value = 11120

;------------------------------------------------------

[Statedef 11114]
type = A
movetype = A
physics = N
anim = 1110
velset = -3,-8
sprpriority = 7

[State 0, Explod]
type = Explod
trigger1 = time = [0,50]
anim = 9700
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
random = 60,105
removetime = -2
scale = 0.5,0.5
sprpriority = -2
ownpal = 1
removeongethit = 0

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 9200
ID = 9200
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.25,0.25
sprpriority = 9999999999
ownpal = 1

[State 1112]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X< 0
trigger1 = Vel X >= -6
x = -0.3

[State 1112]
type = veladd
trigger1 = time >= 10
trigger1 = p2bodydist X > 0
trigger1 = Vel X <= 6
x = 0.3

[State 1112]
type = veladd
trigger1 = 1
y = 0.3

[State 1112]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1113]
type = HitDef
trigger1 = animelem = 1
attr = S, SP
animtype = Hard
damage = 0,0
pausetime = 0, 5
guardflag = MA
hitflag = MAFP
priority = 7
sprpriority = 7
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
hitsound  = -1
guardsound = -1

[State 1113]
type = ChangeState
trigger1 = Pos Y >= 0
trigger2 = movecontact = 1
value = 11120

;------------------------------------------------------

[statedef 11120]
type = S
physics = S
velset = 0,0
anim = -1

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 9200

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S1000,4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S1003,2

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 20
freq = 75
ampl = 5

[State 0, EnvColor]
type = EnvColor
trigger1 = time = 0
value = 255,255,255
time = 3

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 9553
ID = 9553
pos = 0,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = 9999999999
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 9112
ID = 9112
pos = 0,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = 99999999
ownpal = 1

[State 1001, 3]
type = Projectile
trigger1 = time = 0
projanim = 9552
projhitanim = 9552
projremovetime = 0;-2
offset = 0,5
velocity = 0,0
postype = p1
projpriority = 99999999
attr = S, HA
damage = 40,10
givepower = 0,0
getpower = 5,5
animtype = diagup
hitflag = MAF
guardflag = M
pausetime = 0,3
sparkno = -1
hitsound = -1;S666,31
guard.sparkno = -1
guardsound = -1;S150,0
ground.type = low
ground.slidetime = 25
ground.hittime  = 25
ground.Velocity = -6,-8
guard.velocity = -7.5
air.Velocity = -6,-8
fall = 1
fall.recover = 0
palfx.time = 50
palfx.color = 0
palfx.add = 0,0,0
palfx.invertall = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 0
;--------------------------------------------------------------------

;---------------------------------------------------------------------
;Shoryuuken A
[Statedef 1365]
type = S
physics = N
movetype = A
anim = 1300
poweradd = 70
velset = 10, 0
ctrl = 0
juggle = 4

[State 1365, 1]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0
z = 0

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0, 5

[State 1365, PosAdd]
type = PosAdd
trigger1 = Animelem = 2
trigger2 = Animelem = 3
x = 1
y = 0

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 10

[State 1365, 1st Hit]
type = HitDef
trigger1 = animelem = 4 && var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6004
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 1
air.velocity = 1,-1

[State 1365, 1st Hit]
type = HitDef
trigger1 = animelem = 4 && var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6004
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 1
air.velocity = 1,-1

[state 1000]
type = playsnd
trigger1 = animelem = 15 && movehit
value = S449,1

[State 1365, 2st Hit]
type = HitDef
trigger1 = animelem = 14 && var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-6
air.velocity = 0,-6

[State 1365, 2st Hit]
type = HitDef
trigger1 = animelem = 14 && var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-6
air.velocity = 0,-6

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8

[State 1365, Change]
type = ChangeState
trigger1 = AnimTime = 0 && movehit
value = 1370

[State 1365, Change]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl=1

;(Rising)
[Statedef 1370]
type = A
movetype = A
physics = A
anim = 1310
ctrl = 0
velset = -7,-11;6,-8.5


[state 1000,4]
type = posadd
trigger1 = time = 1
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 0
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

;[State 1370, Snd]
;type = PlaySnd
;trigger1 = Time = 1
;value = S0,12

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 5

[State 1370, 0]
type = VelAdd
trigger1 = Time != 1
x = -.2

[State 1370, Hitdef]
type = HitDef
triggerall = p2name = "Symbiote Onslaught"
trigger1 = AnimElem = 3
attr = A, SA
damage = 35,5
animtype = Back
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 11,11
sparkno = s6005
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
air.juggle = 4
ground.type = Low
ground.slidetime = 4
ground.hittime = 15
ground.velocity = -9,-14
air.velocity = -9,-14
ground.cornerpush.veloff = 0
yaccel = .5
fall.recovertime = 32
fall = 1
fall.yvelocity = -.2
p2facing = 1

[State 1370, Hitdef]
type = HitDef
triggerall = p2name != "Symbiote Onslaught"
trigger1 = AnimElem = 3 &&var(9)=0
trigger2 = AnimElem = 4 &&var(9)=0
trigger3 = AnimElem = 5 &&var(9)=0
attr = A, SA
damage = 35,5
animtype = Back
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 11,11
sparkno = s6005
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
air.juggle = 4
ground.type = Low
ground.slidetime = 4
ground.hittime = 15
ground.velocity = -9,-14
air.velocity = -9,-14
ground.cornerpush.veloff = 0
yaccel = .5
fall.recovertime = 32
fall = 1
fall.yvelocity = -.2
p2facing = 1

[State 1370, Hitdef]
type = HitDef
triggerall = p2name != "Symbiote Onslaught"
trigger1 = AnimElem = 3 &&var(9)!=0
trigger2 = AnimElem = 4 &&var(9)!=0
trigger3 = AnimElem = 5 &&var(9)!=0
attr = A, SA
damage = 55,10
animtype = Back
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 11,11
sparkno = s6005
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
air.juggle = 4
ground.type = Low
ground.slidetime = 4
ground.hittime = 15
ground.velocity = -9,-14
air.velocity = -9,-14
ground.cornerpush.veloff = 0
yaccel = .5
fall.recovertime = 32
fall = 1
fall.yvelocity = -.2
p2facing = 1

[State 1370, Change]
type = ChangeState
trigger1 = Vel Y >= 0
value = 50

;---------------------------------------------------------------------

;Shoryuuken B
[Statedef 1366]
type = S
physics = N
movetype = A
anim = 1300
poweradd = 70
velset = 10, 0
ctrl = 0
juggle = 4

[State 1365, 1]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0
z = 0

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 10

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0, 5

[State 1365, PosAdd]
type = PosAdd
trigger1 = Animelem = 2
trigger2 = Animelem = 3
x = 1
y = 0

[State 1365, 1st Hit]
type = HitDef
trigger1 = animelem = 4 &&var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6004
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 1
air.velocity = 1,-1

[State 1365, 1st Hit]
type = HitDef
trigger1 = animelem = 4 &&var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6004
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 1
air.velocity = 1,-1

[state 1000]
type = playsnd
trigger1 = animelem = 15 && movehit
value = S449,1

[State 1365, 2st Hit]
type = HitDef
trigger1 = animelem = 14 && var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-6
air.velocity = 0,-6

[State 1365, 2st Hit]
type = HitDef
trigger1 = animelem = 14 && var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-6
air.velocity = 0,-6

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8

[State 1365, Change]
type = ChangeState
trigger1 = AnimTime = 0 && movehit
value = 1371

[State 1365, Change]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl=1

;(Rising)
[Statedef 1371]
type = A
movetype = A
physics = A
anim = 1310
ctrl = 0
velset = -7,-11;6,-8.5

[state 1000,4]
type = posadd
trigger1 = time = 1
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 0
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

;[State 1370, Snd]
;type = PlaySnd
;trigger1 = Time = 1
;value = S0,12

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 5

[State 1370, 0]
type = VelAdd
trigger1 = Time != 1
x = -.2

[State 1370, Hitdef]
type = HitDef
triggerall = p2name = "Symbiote Onslaught"
trigger1 = AnimElem = 3
attr = A, SA
damage = 35,5
animtype = Back
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 11,11
sparkno = s6005
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
air.juggle = 4
ground.type = Low
ground.slidetime = 4
ground.hittime = 15
ground.velocity = -9,-14
air.velocity = -9,-14
ground.cornerpush.veloff = 0
yaccel = .5
fall.recovertime = 32
fall = 1
fall.yvelocity = -.2
p2facing = 1

[State 1370, Hitdef]
type = HitDef
triggerall = p2name != "Symbiote Onslaught"
trigger1 = AnimElem = 3 &&var(9)=0
trigger2 = AnimElem = 4 &&var(9)=0
trigger3 = AnimElem = 5 &&var(9)=0
attr = A, SA
damage = 35,5
animtype = Back
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 11,11
sparkno = s6005
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
air.juggle = 4
ground.type = Low
ground.slidetime = 4
ground.hittime = 15
ground.velocity = -9,-14
air.velocity = -9,-14
ground.cornerpush.veloff = 0
yaccel = .5
fall.recovertime = 32
fall = 1
fall.yvelocity = -.2
p2facing = 1

[State 1370, Hitdef]
type = HitDef
triggerall = p2name != "Symbiote Onslaught"
trigger1 = AnimElem = 3 &&var(9)!=0
trigger2 = AnimElem = 4 &&var(9)!=0
trigger3 = AnimElem = 5 &&var(9)!=0
attr = A, SA
damage = 55,10
animtype = Back
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 11,11
sparkno = s6005
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
air.juggle = 4
ground.type = Low
ground.slidetime = 4
ground.hittime = 15
ground.velocity = -9,-14
air.velocity = -9,-14
ground.cornerpush.veloff = 0
yaccel = .5
fall.recovertime = 32
fall = 1
fall.yvelocity = -.2
p2facing = 1

[State 1370, Change]
type = ChangeState
trigger1 = Vel Y >= 0
value = 1375

;---------------------------------------------------------------------

;Shoryuuken C
[Statedef 1367]
type = S
physics = N
movetype = A
anim = 1300
poweradd = 70
velset = 10, 0
ctrl = 0
juggle = 4

[State 1365, 1]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0
z = 0

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 10

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0, 5

[State 1365, PosAdd]
type = PosAdd
trigger1 = Animelem = 2
trigger2 = Animelem = 3
x = 1
y = 0

[State 1365, 1st Hit]
type = HitDef
trigger1 = animelem = 4 &&var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6004
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 1
air.velocity = 1,-1

[State 1365, 1st Hit]
type = HitDef
trigger1 = animelem = 4 &&var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6004
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 1
air.velocity = 1,-1

[state 1000]
type = playsnd
trigger1 = animelem = 15 && movehit
value = S449,1

[State 1365, 2st Hit]
type = HitDef
trigger1 = animelem = 14 && var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-6
air.velocity = 0,-6

[State 1365, 2st Hit]
type = HitDef
trigger1 = animelem = 14 && var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-6
air.velocity = 0,-6

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 8

[State 1365, Change]
type = ChangeState
trigger1 = AnimTime = 0 && movehit
value = 1372

[State 1365, Change]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl=1

;(Rising)
[Statedef 1372]
type = A
movetype = A
physics = A
anim = 1310
ctrl = 0
velset = -7,-11;6,-8.5

[state 1000,4]
type = posadd
trigger1 = time = 1
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 0
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

;[State 1370, Snd]
;type = PlaySnd
;trigger1 = Time = 1
;value = S0,12

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 5

[State 1370, 0]
type = VelAdd
trigger1 = Time != 1
x = -.2

[State 1370, Hitdef]
type = HitDef
triggerall = p2name = "Symbiote Onslaught"
trigger1 = AnimElem = 3
attr = A, SA
damage = 35,5
animtype = Back
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 11,11
sparkno = s6005
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
air.juggle = 4
ground.type = Low
ground.slidetime = 4
ground.hittime = 15
ground.velocity = -9,-14
air.velocity = -9,-14
ground.cornerpush.veloff = 0
yaccel = .5
fall.recovertime = 32
fall = 1
fall.yvelocity = -.2
p2facing = 1

[State 1370, Hitdef]
type = HitDef
triggerall = p2name != "Symbiote Onslaught"
trigger1 = AnimElem = 3 &&var(9)=0
trigger2 = AnimElem = 4 &&var(9)=0
trigger3 = AnimElem = 5 &&var(9)=0
attr = A, SA
damage = 39,8
animtype = Back
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 11,11
sparkno = s6005
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
air.juggle = 4
ground.type = Low
ground.slidetime = 4
ground.hittime = 15
ground.velocity = -9,-14
air.velocity = -9,-14
ground.cornerpush.veloff = 0
yaccel = .5
fall.recovertime = 32
fall = 1
fall.yvelocity = -.2
p2facing = 1


[State 1370, Hitdef]
type = HitDef
triggerall = p2name != "Symbiote Onslaught"
trigger1 = AnimElem = 3 &&var(9)!=0
trigger2 = AnimElem = 4 &&var(9)!=0
trigger3 = AnimElem = 5 &&var(9)!=0
attr = A, SA
damage = 59,16
animtype = Back
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 11,11
sparkno = s6005
sparkxy = -20,-40
hitsound = S1,4
guardsound = S8500,0
air.juggle = 4
ground.type = Low
ground.slidetime = 4
ground.hittime = 15
ground.velocity = -9,-14
air.velocity = -9,-14
ground.cornerpush.veloff = 0
yaccel = .5
fall.recovertime = 32
fall = 1
fall.yvelocity = -.2
p2facing = 1

[State 1370, Change]
type = ChangeState
trigger1 = Vel Y >= 0
value = 1380

;-----------------------------------------------------------------------

[statedef 1375]
type=A
movetype=A
physics=A
anim=615

[state 1000,4]
type = posadd
trigger1 = time = 12
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 30
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

[state 1000]
type = playsnd
trigger1 = time = 11
value = S449,1

[State 200]
type = PlaySnd
trigger1 = AnimElem = 3
persistent = 0
value = s0, 9

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 7

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 4&&var(9)=0
attr              = A, NA
damage            = 42, 3
getpower = 62*3
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 17,14
sparkno           = S6005
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
;ground.velocity   = -2,4
air.velocity      = -2,60
guard.dist = 120
fall = 1
fall.recovertime = 60
fall.damage =50

[State 400, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 4&&var(9)!=0
attr              = A, NA
damage            = 53, 18
getpower = 7
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 17,14
sparkno           = S6020
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
;ground.velocity   = -2,4
air.velocity      = -2,60
guard.dist = 120
fall = 1
fall.recovertime = 60
fall.damage = 50

[state 1375]
type=changestate
trigger1=animtime=0
value=50

;----------------------------------------------------------------------

[statedef 1380]
type=A
movetype=A
physics=A
anim=605

[state 1000,4]
type = posadd
trigger1 = time = 8
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 0
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

[state 1000]
type = playsnd
trigger1 = time = 8
value = S449,1

[State 200]
type = PlaySnd
trigger1 = AnimElem = 5
persistent = 0
value = s0, 4

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 3

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = Animelem = 5 && var(9)=0
attr              = A, NA
damage            = 38, 2
getpower = 38*3
animtype          = Medium
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 12,12
sparkno           = S6003
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,1
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 18
ground.hittime    = 18
ground.velocity   = -1.6
guard.hittime = 8
guard.ctrltime = 8
air.hittime    = 19
air.velocity      = -5,-2.5
ground.cornerpush.veloff = -6-ceil(HitCount*0.75)
airguard.cornerpush.veloff = -6-ceil(HitCount*0.75)
p1stateno = 1375

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = Animelem = 5 && var(9)!=0
attr              = A, NA
damage            = 47, 12
getpower = 4
animtype          = Medium
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 12,12
sparkno           = S6020
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,1
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 18
ground.hittime    = 18
ground.velocity   = -1.6
guard.hittime = 8
guard.ctrltime = 8
air.hittime    = 19
air.velocity      = -7,-2.5
ground.cornerpush.veloff = -6-ceil(HitCount*0.75)
airguard.cornerpush.veloff = -6-ceil(HitCount*0.75)
p1stateno = 1375

[state 1375]
type=changestate
trigger1=animtime=0
value=50

;---------------------------------------------------------------------------
;fire
[Statedef 1400]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= -300
velset = 0,0
anim = 1100
ctrl = 0
sprpriority = 2


[State 1200,***]
type = helper
trigger1=animelem=3
name = "fire3"
id = 1402
pos = 0,0
postype = p2
stateno = 1402
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[State 1100, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
[Statedef 1402]
movetype= A
anim = 1450
sprpriority = 5

[State 410, 1]
type = velset
trigger1 = 1
x=0
y=0

[State 410, 1]
type = posset
trigger1 = 1
y=0

[State 410, 1]
type = PlaySnd
trigger1 = Time = 1
value = 12, 9

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow

[State 1000]
type = NotHitBy
trigger1 = animelem=4
value = ,SA,NA,HA,ST,NT,HT
time = 200

[State 210, 1]
type = statetypeset
trigger1 = MoveContact
movetype = I

[State 3000,5]
type = hitdef
trigger1 =animelem=1
trigger2 =animelem=2
trigger3 =animelem=3
trigger4 =animelem=4
trigger5 =animelem=5
trigger6 =animelem=6
trigger7 =animelem=7
trigger8 =animelem=8
attr = S, HP
animtype =hard
damage = 130,60
guardflag =MA
pausetime =0,0
hitflag=MAFD
getpower =0
sparkno =-1
sparkxy =0,0
hitsound = -1
ground.type = High
ground.slidetime = 11
ground.hittime  = 20
ground.velocity = 0,-9;-6,-3
air.velocity = 0,-9;-8,-7
fall.recover=0
fall=1
palfx.time =60
palfx.sinadd =110,55,85,5;00,50,0,5
palfx.add = 240,50,0
palfx.mul = 250,224,120
palfx.invertall =1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 2000, Override]
type = HitOverride
trigger1 = animelem=4
attr = SCA,AP
slot = 1
stateno = 252
time = 200

;[State 410, 1]
;type = parentvarset
;trigger1 = Time =1
;var(2)=0

;[State 410, 1]
;type = parentvaradd
;trigger1 = Time >22
;var(2)=40

;[State 3000, Width]
;type = trans
;trigger1 = time >22
;trans = addalpha
;alpha = 256-root,var(2), 256

[State 1201,end]
type = Destroyself
trigger1 = time = 33

;---------------------------------------------------------------------------
;airfire
[Statedef 1403]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= -300
velset = 0,0
anim = 610
ctrl = 0
sprpriority = 2


[State 1200,***]
type = helper
trigger1=animelem=3
name = "fire3"
id = 1402
pos = 0,0
postype = p2
stateno = 1402
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[State 1100, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;ice
[Statedef 1410]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= -340
velset = 0,0
anim = 1100
ctrl = 0
sprpriority = 2



[State 1200,***]
type = helper
trigger1=animelem=3
name = "ice3"
id = 1411
pos = 0,-40
postype = p2
stateno = 1411
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[State 1100, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
[Statedef 1411]
movetype= A
anim = 1470
sprpriority = 5

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow

[State 410, 1]
type = PlaySnd
trigger1 = Time = 1
value = 2600,0

[State 410, 1]
type = PlaySnd
trigger1 = Time = 36
value = 3,4



[State 1000]
type = NotHitBy
trigger1 = animelem=4
value = ,SA,NA,HA,ST,NT,HT
time = 200



[State 3000,5]
type = hitdef
trigger1 =time=0
attr = S, HP
animtype =hard
damage = 110,70
guardflag =M
pausetime =0,0
getpower =0
sparkno =-1
sparkxy =0,0
hitsound = -1
ground.type = High
ground.slidetime = 11
ground.hittime  = 90
ground.velocity = 0,0
air.velocity = 0,-8
fall.recover=0
air.fall=1
palfx.time =90
palfx.add = 160,160,210
palfx.invertall =1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 2000, Override]
type = HitOverride
trigger1 = animelem=4
attr = SCA,AP
slot = 1
stateno = 252
time = 200



;[State 410, 1]
;type = parentvarset
;trigger1 = Time =1
;var(2)=0

;[State 410, 1]
;type = parentvaradd
;trigger1 = Time >84
;var(2)=40

;[State 3000, Width]
;type = trans
;trigger1 = time >85
;trans = addalpha
;alpha = 256-root,var(2), 256

[State 1201,end]
type = Destroyself
trigger1 = time = 58


;------------------------------------------------------------------------

;airice
[Statedef 1413]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= -340
velset = 0,0
anim = 610
ctrl = 0
sprpriority = 2


[State 1200,***]
type = helper
trigger1=animelem=3
name = "ice3"
id = 1411
pos = 0,-40
postype = p2
stateno = 1411
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[State 1100, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1
;----------------------------------------------------------------------

;lightning
[Statedef 1420]; サンダガ
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= -400
velset = 0,0
anim = 1100
ctrl = 0
sprpriority = 2


[State 1200,***]
type = helper
trigger1=animelem=3
name = "lightning3"
id = 1421
pos = 0,0
postype = p2
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=animelem=3 && var(9)!=0
name = "lightning33"
id = 1425
pos = 0,0
postype = p2
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[State 1100, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
[Statedef 1421]
movetype= A
anim = 1460
sprpriority = 5

[State 5110, 7]
type = Envcolor
trigger1 = time=0
value = 255,255,255
time = 1
under = 1

[State 0, PosSet]
type = PosSet
trigger1 =1
y = -100


[State 210, 3]
type = Turn
trigger1 = root,facing=1
trigger2 = root,facing=-1
persistent = 0

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow

[State 410, 1]
type = PlaySnd
trigger1 = Time = 1
value = 1320, 0

[State 410, 1]
type = PlaySnd
trigger1 = Time = 10
value = 1420, 1

[State 1000]
type = NotHitBy
trigger1 = animelem=1
value = ,SA,NA,HA,ST,NT,HT
time = 200


[State 600]
type = Explod
trigger1 =time=28;12
anim =1421
id =1421
pos =-10,100
postype = p1
sprpriority =3
bindtime =1
ownpal =1
scale=.15,.15
removeongethit =1
supermovetime =999
pausemovetime =999

[State 600]
type = Explod
trigger1 =time=26;12
anim =1421
id =1425
pos =-10,50
postype = p1
sprpriority =3
bindtime =1
ownpal =1
scale = .15,.15
removeongethit =1
supermovetime =999
pausemovetime =999

[State 600]
type = Explod
trigger1 =time=24;12
anim =1421
id =1425
pos =-10,0
postype = p1
sprpriority =3
bindtime =1
ownpal =1
scale = .15,.15
removeongethit =1
supermovetime =999
pausemovetime =999

[State 600]
type = Explod
trigger1 =time=22;12
anim =1421
id =1421
pos =-10,-50
postype = p1
sprpriority =3
bindtime =1
ownpal =1
scale=.15,.15
removeongethit =1
supermovetime =999
pausemovetime =999

[State 210, 1]
type = statetypeset
trigger1 = MoveContact
movetype = I

[State 3000,5]
type = hitdef
trigger1 =animelem=1;4
trigger2 =animelem=2;5
trigger3 =animelem=3;6
;trigger4 =animelem=7
;trigger5 =animelem=8
;trigger6 =animelem=9
attr = S, HP
animtype =hard
damage = 125,60
guardflag =M
hitflag=MADF
pausetime =0,0
getpower =0
sparkno =-1
sparkxy =0,0
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime  = 20
ground.velocity = -4,-5
air.velocity = -4,-3
fall.recover=0
fall=1
palfx.time =40
palfx.sinadd =-80,-80,-80,5;80,80,0,5
palfx.add = 100,100,180
palfx.mul = 256,256,256
palfx.invertall =1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 2000, Override]
type = HitOverride
trigger1 = animelem=1
attr = SCA,AP
slot = 1
stateno = 252
time = 200

[State 1201,end]
type = Destroyself
trigger1 = time = 28

;------------------------------------------------------------------------
;air lightning
[Statedef 1423]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= -400
velset = 0,0
anim = 610
ctrl = 0
sprpriority = 2


[State 1200,***]
type = helper
trigger1=animelem=3 && var(9)=0
name = "lightning3"
id = 1421
pos = 0,0
postype = p2
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=animelem=3 && var(9)!=0
name = "lightning33"
id = 1425
pos = 0,0
postype = p2
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[State 1100, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1
;---------------------------------------------------------------------------
[Statedef 1425]
movetype= A
anim = 8260
sprpriority = 5

[State 5110, 7]
type = Envcolor
trigger1 = time=0
value = 255,255,255
time = 1
under = 1

[State 0, PosSet]
type = PosSet
trigger1 =1
y = 0


[State 210, 3]
type = Turn
trigger1 = root,facing=1
trigger2 = root,facing=-1
persistent = 0

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow

[State 410, 1]
type = PlaySnd
trigger1 = Time = 1
value = 1420, 0

[State 410, 1]
type = PlaySnd
trigger1 = Time = 10
value = 1420, 1

[State 1000]
type = NotHitBy
trigger1 = animelem=1
value = ,SA,NA,HA,ST,NT,HT
time = 200

[State 600]
type = Explod
trigger1 =time=28;12
anim =1421
pos =-10,0
postype = p1
sprpriority =3
bindtime =1
ownpal =1
scale=.15,.15
removeongethit =1
supermovetime =999
pausemovetime =999

[State 600]
type = Explod
trigger1 =time=26;12
anim =1421
pos =-10,-50
postype = p1
sprpriority =3
bindtime =1
ownpal =1
scale = .15,.15
removeongethit =1
supermovetime =999
pausemovetime =999

[State 600]
type = Explod
trigger1 =time=24;12
anim =1421
pos =-10,-100
postype = p1
sprpriority =3
bindtime =1
ownpal =1
scale = .15,.15
removeongethit =1
supermovetime =999
pausemovetime =999

[State 600]
type = Explod
trigger1 =time=22;12
anim =1421
pos =-10,-150
postype = p1
sprpriority =3
bindtime =1
ownpal =1
scale=.15,.15
removeongethit =1
supermovetime =999
pausemovetime =999

[State 210, 1]
type = statetypeset
trigger1 = MoveContact
movetype = I

[State 3000,5]
type = hitdef
trigger1 =animelem=1;4
trigger2 =animelem=2;5
trigger3 =animelem=3;6
trigger4 =animelem=4||animelem=5||animelem=6||animelem=7
;trigger5 =animelem=8
;trigger6 =animelem=9
attr = S, HP
animtype =hard
damage = 165,80
guardflag =M
hitflag=MADF
pausetime =0,0
getpower =0
sparkno =-1
sparkxy =0,0
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime  = 20
ground.velocity = -4,-5
air.velocity = -4,-3
fall.recover=0
fall=1
palfx.time =80
palfx.sinadd =-80,-80,-80,5;80,80,0,5
palfx.add = 100,100,180
palfx.mul = 256,256,256
palfx.invertall =1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 2000, Override]
type = HitOverride
trigger1 = animelem=1
attr = SCA,AP
slot = 1
stateno = 252
time = 200

[State 1201,end]
type = Destroyself
trigger1 = time = 34

;----------------------------------------------------------------------
[Statedef 252]
anim = 252


[State 1201,end]
type = Destroyself
trigger1 = animtime=0
;---------------------------------------------------------------------
; teleportback
[Statedef 1430]
type     = S
movetype = I
physics  = S
juggle   = 0
poweradd = -10
ctrl     = 0
anim     = 1430
velset   = 0,0

[State 1430, 1]
type          = AfterImage
trigger1      = time = 0
time          = 20
trans         = add1
TimeGap       = 1
FrameGap      = 4
length        = 20
PalBright     = 12,12,12
PalContrast   = 225,225,225
palpostbright = 0,0,0
paladd        = 0,0,0
PalMul        = 1,1,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S1400,4



[State 1430, 1]
type     = NotHitBy
trigger1 = Time >= 0
value    = SCA
time     = 1

[State 1430, 2]
type          = AfterImage
trigger1      = time = 0
time          = 999
TimeGap  = 4
FrameGap = 1
length = 12
PalBright   = 100,-20,-20
PalContrast = 0,0,100
Trans = add
ignorehitpause = 1

[State 1430, 3]
type     = Velset
trigger1 = time = 0
x        = -3

[State 1430, 4]
type     = Velset
trigger1 = AnimElem = 1
x        = 3

[State 1430, 5]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 1431

;---------------------------------------------------------------------------

; teleportback
[Statedef 1431]
type     = S
movetype = I
physics  = N
juggle   = 0
poweradd = 0
ctrl     = 0
anim     = 1431
velset   = -9,0

[State 1431, 1]
type     = Width
trigger1 = Time >= 0
value    = 10,0

[State 1431, 2]
type     = Playsnd
trigger1 = Time = 0
value    = s8,11

;[State 1431, 3]
;type     = Changeanim
;trigger1 = p2bodydist x < -30
;value    = 1401

[State 1431, 4]
type     = Sprpriority
trigger1 = time >= 0
value    = 1

[State 1431, 5]
type     = PlayerPush
trigger1 = Time >= 0
value    = 0

[State 1431, 6]
type     = Velmul
trigger1 = Time  >= 25
trigger1 = Vel X < 0
x        = .92

[State 1431, 7]
type     = NotHitBy
trigger1 = Time >= 0
value    = SCA
time     = 1

[State 1431, 8]
type     = Velset
trigger1 = Time          = 45
trigger2 = frontedgedist = 10
x        = 0

;[State 1431, 9]
;type     = Turn
;trigger1 = Time = 45
;trigger1 = anim = 1401

[State 1431, 10]
type     = AfterImageTime
trigger1 = time          = 33
trigger2 = frontedgedist = 10
trigger3 = backedgedist  = 0
Time     = 0

[State 1431, 11]
type     = Sprpriority
trigger1 = time          = 33
trigger2 = frontedgedist = 10
trigger3 = backedgedist  = 0
trigger3 = time          > 4
value    = 0


[State 1431, 12]
type     = ChangeState
trigger1 = Time          = 45
trigger2 = frontedgedist = 10
value    = 0
ctrl     = 1

;[State 1431, 13]
;type     = Turn
;trigger1 = frontedgedist = 10
;trigger1 = anim          = 1401

[State 1431, 14]
type     = ChangeState
trigger1 = backedgedist = 0
trigger1 = time         > 4
value    = 0
ctrl     = 1

;----------------------------------------------------------------------

; teleportforward
[Statedef 1432]
type     = S
movetype = I
physics  = S
juggle   = 0
poweradd = -50
ctrl     = 0
anim     = 1432
velset   = 0,0

[State 1410, 1]
type     = NotHitBy
trigger1 = Time >= 0
value    = SCA
time     = 1

[State 0, LifeAdd]
type = LifeAdd
trigger1 = power<50
value = -1
kill = 0
absolute = 1


[state 1000]
type = playsnd
trigger1 = time = 1
value = S449,1

[state 1000,4]
type = posadd
trigger1 = time = 12
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 0
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

[State 1410, 5]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl =1

;---------------------------------------------------------------------------


;----------------------------------------------------------------------

; air teleportback
[Statedef 1440]
type     = S
movetype = I
physics  = S
juggle   = 0
poweradd = -10
ctrl     = 0
anim     = 1430
velset   = 0,0

[State 1430, 1]
type          = AfterImage
trigger1      = time = 0
time          = 20
trans         = add1
TimeGap       = 1
FrameGap      = 4
length        = 20
PalBright     = 12,12,12
PalContrast   = 225,225,225
palpostbright = 0,0,0
paladd        = 0,0,0
PalMul        = 1,1,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S1400,4

[State 1430, 1]
type     = NotHitBy
trigger1 = Time >= 0
value    = SCA
time     = 1

[State 1430, 2]
type          = AfterImage
trigger1      = time = 0
time          = 999
TimeGap  = 4
FrameGap = 1
length = 12
PalBright   = 400,-20,-20
PalContrast = 0,0,200
Trans = add
ignorehitpause = 1

[State 1430, 3]
type     = Velset
trigger1 = time = 0
x        = -3

[State 1430, 4]
type     = Velset
trigger1 = AnimElem = 1
x        = 3

[State 1430, 5]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 1441

;---------------------------------------------------------------------------

; air teleportback
[Statedef 1441]
type     = S
movetype = I
physics  = N
juggle   = 0
poweradd = 0
ctrl     = 0
anim     = 1431
velset   = -9,0

[State 1431, 1]
type     = Width
trigger1 = Time >= 0
value    = 10,0

[State 1431, 2]
type     = Playsnd
trigger1 = Time = 0
value    = s8,11

;[State 1431, 3]
;type     = Changeanim
;trigger1 = p2bodydist x < -30
;value    = 1401

[State 1431, 4]
type     = Sprpriority
trigger1 = time >= 0
value    = 1

[State 1431, 5]
type     = PlayerPush
trigger1 = Time >= 0
value    = 0

[State 1431, 6]
type     = Velmul
trigger1 = Time  >= 25
trigger1 = Vel X < 0
x        = .92

[State 1431, 7]
type     = NotHitBy
trigger1 = Time >= 0
value    = SCA
time     = 1

[State 1431, 8]
type     = Velset
trigger1 = Time          = 45
trigger2 = frontedgedist = 10
x        = 0

;[State 1431, 9]
;type     = Turn
;trigger1 = Time = 45
;trigger1 = anim = 1401

[State 1431, 10]
type     = AfterImageTime
trigger1 = time          = 33
trigger2 = frontedgedist = 10
trigger3 = backedgedist  = 0
Time     = 0

[State 1431, 11]
type     = Sprpriority
trigger1 = time          = 33
trigger2 = frontedgedist = 10
trigger3 = backedgedist  = 0
trigger3 = time          > 4
value    = 0



[State 1431, 12]
type     = ChangeState
trigger1 = Time          = 45
trigger2 = frontedgedist = 10
value    = 50
ctrl     = 1

;[State 1431, 13]
;type     = Turn
;trigger1 = frontedgedist = 10
;trigger1 = anim          = 1401

[State 1431, 14]
type     = ChangeState
trigger1 = backedgedist = 0
trigger1 = time         > 4
value    = 50
ctrl     = 1

;----------------------------------------------------------------------

; air teleportforward
[Statedef 1442]
type     = S
movetype = I
physics  = S
juggle   = 0
poweradd = -50
ctrl     = 0
anim     = 1442
velset   = 0,0

[State 1410, 1]
type     = NotHitBy
trigger1 = Time >= 0
value    = SCA
time     = 1

[State 0, LifeAdd]
type = LifeAdd
trigger1 = power<50
value = -1
kill = 0
absolute = 1



[state 1000]
type = playsnd
trigger1 = time = 1
value = S449,1

[state 1000,4]
type = posadd
trigger1 = time = 13
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 20
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

[State 1410, 5]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 50
ctrl =1




;-----------------------------------------------------------------------
;Hadoken1
[Statedef 1510]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 215
poweradd = -100

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 3.5, 0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projshadow = -1
offset = 85,-55
velocity = 3.5, 0
attr = S, SP
damage   = 65,30
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
projsprpriority = 3
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1010, 2]
type = ChangeState
trigger1= AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------

;Hadoken2
[Statedef 1520]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 215
poweradd = -100

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 5.5, 0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projshadow = -1
offset = 85,-55
velocity = 5.5, 0
attr = S, SP
damage   = 65,30
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
projsprpriority = 3
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1010, 2]
type = ChangeState
trigger1= AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------

;Hadoken3
[Statedef 1530]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 215
poweradd = -100

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 7.5, 0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projshadow = -1
offset = 85,-55
velocity = 7.5, 0
attr = S, SP
damage   = 65,30
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
projsprpriority = 3
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1010, 2]
type = ChangeState
trigger1= AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;3xhadouken1
[Statedef 1550]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 215
poweradd = -250

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 7.5, 0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projsprpriority = 3
projshadow = -1
offset = 85,-55
velocity = 7.5, 0
attr = S, SP
damage   = 80,40
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 8.5, 0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projsprpriority = 3
projshadow = -1
offset = 85,-55
velocity = 8.5, 0
attr = S, SP
damage   = 80,40
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 9.5, 0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projsprpriority = 3
projshadow = -1
offset = 85,-55
velocity = 9.5, 0
attr = S, SP
damage   = 80,40
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1010, 2]
type = ChangeState
trigger1= AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;3xhadouken2
[Statedef 1560]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 215
poweradd = -250

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 7.5, 0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projsprpriority = 3
projshadow = -1
offset = 85,-55
velocity = 7.5, 0
attr = S, SP
damage   = 80,40
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 8.5, -0.5
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projsprpriority = 3
projshadow = -1
offset = 85,-55
velocity = 8.5, -0.5
attr = S, SP
damage   = 80,40
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 8.5, -1.5
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projsprpriority = 3
projshadow = -1
offset = 85,-55
velocity = 8.5, -1.5
attr = S, SP
damage   = 80,40
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1010, 2]
type = ChangeState
trigger1= AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;3xhadouken3
[Statedef 1570]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 215
poweradd = -250

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 7.5, 0
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projsprpriority = 3
projshadow = -1
offset = 85,-55
velocity = 7.5, 0
attr = S, SP
damage   = 80,40
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 8.5, -1.5
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projsprpriority = 3
projshadow = -1
offset = 85,-55
velocity = 8.5, -1.5
attr = S, SP
damage   = 80,40
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,18

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S0,19



[State 1510, Burst]
type = Explod
trigger1 = Animelem = 3
ID = 1010
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1510
projpriority = 2
projshadow = -1
projhitanim = 1516
projremanim = 1516
projcancelanim = 1516
offset = 85,-55
velocity = 8.5, -3
attr = S, SP
damage   = 50,10
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = s8880
guard.sparkno = s6767
sparkxy = 0,0
hitsound   =s8000,2
guardsound = S8500,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -4,-6
air.juggle = 3
down.velocity = -4,-6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1510, 3]
type = Projectile
trigger1 = AnimElem = 4 &&var(9)!=0
projanim = 6023
projpriority = 5
projsprpriority = 3
projshadow = -1
offset = 85,-55
velocity = 8.5, -3
attr = S, SP
damage   = 80,40
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound   =s4,1
guardsound = S4,1
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = 6
air.animtype = Back
air.velocity = 4,6
air.juggle = 3
down.velocity = 4,6
down.hittime = 30
down.bounce = 0
ownpal = 1

[State 1010, 2]
type = ChangeState
trigger1= AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------
;sonic1
[statedef 1600]
type = A
movetype = A
physics = A
anim = 1600
poweradd = 10
ctrl = 0
velset = 6, -4

[State 0, VelSet]
type = VelSet
trigger1 = time = 9 || time = 25
x = 0
y = 0

[State 0, VelSet]
type = Velset
trigger1 = time = 11 && movehit
x = 0
y = -10

[state 1000,4]
type = posadd
trigger1 = time = 10
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 10
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

[state 1000,4]
type = posadd
trigger1 = time = 26 && movehit
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 30
pausemovetime = 80


[state 1000]
type = playsnd
trigger1 = time = 10 || time =26
value = S449,1

[State 1600, 1st Hit]
type = HitDef
trigger1 = animelem = 4 && var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 1600, 1st Hit]
type = HitDef
trigger1 = animelem = 4 && var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 1600, 2nd hit]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 9 && var(9)=0
attr              = A, NA
damage            = 42, 3
getpower = 62*3
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 17,14
sparkno           = S6005
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
;ground.velocity   = -2,4
air.velocity      = -2,60
guard.dist = 120
fall = 1
fall.recovertime = 60
fall.damage =50

[State 1600, 2nd hit]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 9 && var(9)!=0
attr              = A, NA
damage            = 53, 18
getpower = 7
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 17,14
sparkno           = S6020
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
;ground.velocity   = -2,4
air.velocity      = -2,60
guard.dist = 120
fall = 1
fall.recovertime = 60
fall.damage = 50

[state 1375]
type=changestate
trigger1=animtime=0
value=50

;---------------------------------------------------------------------
;sonic2
[statedef 1610]
type = A
movetype = A
physics = A
anim = 1610
poweradd = 10
ctrl = 0
velset = 6, -4

[State 0, VelSet]
type = VelSet
trigger1 = time = 9 || time = 24 || time = 40
x = 0
y = 0

[State 0, VelSet]
type = Velset
trigger1 = (time = 11 && movehit) || (time = 26 && movehit)
x = 0
y = -10

[state 1000,4]
type = posadd
trigger1 = time = 10
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 10
pausemovetime = 80

[state 1000,4]
type = posadd
trigger1 = time = 24 && movehit
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 0
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

[state 1000,4]
type = posadd
trigger1 = time = 40 && movehit
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 30
pausemovetime = 80


[state 1000]
type = playsnd
trigger1 = time = 10 || time = 24 || time = 40
value = S449,1

[State 1600, 1st Hit]
type = HitDef
trigger1 = animelem = 4 && var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 1600, 1st Hit]
type = HitDef
trigger1 = animelem = 4 && var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 1600, 2st Hit]
type = HitDef
trigger1 = animelem = 8 && var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 1600, 2st Hit]
type = HitDef
trigger1 = animelem = 8 && var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 1600, 3nd hit]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 13 && var(9)=0
attr              = A, NA
damage            = 42, 3
getpower = 62*3
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 17,14
sparkno           = S6005
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
;ground.velocity   = -2,4
air.velocity      = -2,60
guard.dist = 120
fall = 1
fall.recovertime = 60
fall.damage =50

[State 1600, 3nd hit]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 13 && var(9)!=0
attr              = A, NA
damage            = 53, 18
getpower = 7
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 17,14
sparkno           = S6020
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
;ground.velocity   = -2,4
air.velocity      = -2,60
guard.dist = 120
fall = 1
fall.recovertime = 60
fall.damage = 50

[state 1375]
type=changestate
trigger1=animtime=0
value=50

;---------------------------------------------------------------------
;sonic3
[statedef 1620]
type = A
movetype = A
physics = A
anim = 1620
poweradd = 10
ctrl = 0
velset = 6, -4

[State 0, VelSet]
type = VelSet
trigger1 = time = 9 || time = 33
x = 0
y = 0

[State 0, VelSet]
type = Velset
trigger1 = (time = 11 && movehit) || (time = 42 && movehit)
x = 0
y = -10

[State 0, VelSet]
type = VelSet
trigger1 = time = 34
x = 10
y = 0
;ignorehitpause =
;persistent =

[state 1000,4]
type = posadd
trigger1 = time = 10
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 10
pausemovetime = 80

[state 1000,4]
type = posadd
trigger1 = (time = 29 && movehit)&&(time = 40 && movehit)
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 0
pausemovetime = 80

[state 1000,6]
type = turn
trigger1 = p2dist X< 0
pausemovetime = 99

[state 1000,4]
type = posadd
trigger1 = time = 56 && movehit
x = floor(p2dist X) + 30
y = floor(p2dist Y) - 30
pausemovetime = 80


[state 1000]
type = playsnd
trigger1 = time = 10 || time = 29 || time = 40 || time = 56
value = S449,1

[State 1600, 1st Hit]
type = HitDef
trigger1 = animelem = 4 && var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 1600, 1st Hit]
type = HitDef
trigger1 = animelem = 4 && var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 400, 2nd hit]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = Animelem = 10 && var(9)=0
attr              = A, NA
damage            = 38, 2
getpower = 38*3
animtype          = Medium
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 12,12
sparkno           = S6003
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,1
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 18
ground.hittime    = 18
ground.velocity   = -1.6
guard.hittime = 8
guard.ctrltime = 8
air.hittime    = 19
air.velocity      = -6,-2.5
ground.cornerpush.veloff = -6-ceil(HitCount*0.75)
airguard.cornerpush.veloff = -6-ceil(HitCount*0.75)

[State 400, 2nd hit]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = Animelem = 10 && var(9)!=0
attr              = A, NA
damage            = 47, 12
getpower = 4
animtype          = Medium
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 12,12
sparkno           = S6020
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,1
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 18
ground.hittime    = 18
ground.velocity   = -1.6
guard.hittime = 8
guard.ctrltime = 8
air.hittime    = 19
air.velocity      = -8,-2.5
ground.cornerpush.veloff = -6-ceil(HitCount*0.75)
airguard.cornerpush.veloff = -6-ceil(HitCount*0.75)

[State 1600, 3st Hit]
type = HitDef
trigger1 = animelem = 13 && var(9)=0
attr = A, SA
damage = 20,10
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 1600, 3st Hit]
type = HitDef
trigger1 = animelem = 13 && var(9)!=0
attr = A, SA
damage = 40,20
animtype = Hard
getpower = 10
givepower = 8
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = s6005
sparkxy = -10,-50
hitsound = S1,3
guardsound = S2,1
ground.type = Low
air.juggle = 2
ground.slidetime = 4
ground.hittime = 15
ground.velocity = 0,-10
air.velocity = 0,-10

[State 1600, 4nd hit]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 18 && var(9)=0
attr              = A, NA
damage            = 42, 3
getpower = 62*3
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 17,14
sparkno           = S6005
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
;ground.velocity   = -2,4
air.velocity      = -2,60
guard.dist = 120
fall = 1
fall.recovertime = 60
fall.damage =50

[State 1600, 4nd hit]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 18 && var(9)!=0
attr              = A, NA
damage            = 53, 18
getpower = 7
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 17,14
sparkno           = S6020
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
;ground.velocity   = -2,4
air.velocity      = -2,60
guard.dist = 120
fall = 1
fall.recovertime = 60
fall.damage = 50

[state 1375]
type=changestate
trigger1=animtime=0
value=50

;-------------------------------------------------------------------

;airblade
[Statedef 1700]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 610
poweradd = -250
velset=-5,-3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
value = S2600,0

[State 0, Helper]
type = Helper
trigger1 = animelem=3
helpertype = normal ;player
name = "airblade"
ID = 1705
stateno = 1705
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =999
pausemovetime =999


[State 0, VarAdd]
type = VarAdd
trigger1 = time=1
var(10)=13

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[State 1050, ChangeState]
type = ChangeState
trigger1= AnimTime = 0
value = 50
ctrl = 1

;-------------------------------------------------------------------
;airblade
[statedef 1705]
type = A
movetype = A
;physics = A
anim = 1700
velset = 15,10
sprpriority = 2




[State 0, HitDef]
type = HitDef
trigger1 = animelem =1
attr = A,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFL        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
damage = 70,20
pausetime = 0 ,0
sparkno = s7008
guard.sparkno = s7008
sparkxy = 0,-50
hitsound = S1,4
guardsound = S1,3
ground.type = High      ;Low,Trip,None
ground.slidetime = 20
ground.hittime = 20
air.hittime = 20
ground.velocity = 0,20
air.velocity = 0,20
sprpriority = 2
p1getp2facing = 0
fall = 1
fall.yvelocity = -4.5
fall.recover = 1
fall.recovertime = 4
fall.damage = 20
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 1
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 2
palfx.time = 0
envshake.time = 0
fall.envshake.time = 0




[State 0, ChangeState]
type = ChangeState
trigger1 = pos Y >=0
value = 1710

;-------------------------------------------------------------------

;airblade
[Statedef 1701]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 610
poweradd = -250
velset = -5,-3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
value = S2600,0

[State 0, Helper]
type = Helper
trigger1 = animelem=3
helpertype = normal ;player
name = "airblade"
ID = 1706
stateno = 1706
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =999
pausemovetime =999


[State 0, VarAdd]
type = VarAdd
trigger1 = time=1
var(10)=13

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[State 1050, ChangeState]
type = ChangeState
trigger1= AnimTime = 0
value = 50
ctrl = 1

;-------------------------------------------------------------------
;airblade
[statedef 1706]
type = A
movetype = A
;physics = A
anim = 1700
velset = 17,10
sprpriority = 2




[State 0, HitDef]
type = HitDef
trigger1 = animelem =1
attr = A,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFL        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
damage = 70,20
pausetime = 0 ,0
sparkno = s7008
guard.sparkno = s7008
sparkxy = 0,-50
hitsound = S1,4
guardsound = S1,3
ground.type = High      ;Low,Trip,None
ground.slidetime = 20
ground.hittime = 20
air.hittime = 20
ground.velocity = 0,20
air.velocity = 0,20
sprpriority = 2
p1getp2facing = 0
fall = 1
fall.yvelocity = -4.5
fall.recover = 1
fall.recovertime = 4
fall.damage = 20
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 1
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 2
palfx.time = 0
envshake.time = 0
fall.envshake.time = 0




[State 0, ChangeState]
type = ChangeState
trigger1 = pos Y >=0
value = 1710

;-------------------------------------------------------------------

;airblade
[Statedef 1702]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 610
poweradd = -500
velset = -5,-3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
value = S2600,0

[State 0, Helper]
type = Helper
trigger1 = animelem=3
helpertype = normal ;player
name = "airblade"
ID = 1707
stateno = 1707
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =999
pausemovetime =999


[State 0, VarAdd]
type = VarAdd
trigger1 = time=1
var(10)=17

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[State 1050, ChangeState]
type = ChangeState
trigger1= AnimTime = 0
value = 50
ctrl = 1

;-------------------------------------------------------------------
;airblade
[statedef 1707]
type = A
movetype = A
;physics = A
anim = 1700
velset = 15,0
sprpriority = 2

[State 0, VelSet]
type = Veladd
trigger1 = time =15
x = -15
y = 19
;ignorehitpause =
;persistent =

[state 1000,4]
type = posadd
trigger1 = time = 15
x = floor(p2dist X) + 0
y = floor(p2dist Y) - 190
pausemovetime = 80




[State 0, HitDef]
type = HitDef
trigger1 = animelem =1
attr = A,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFL        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
damage = 70,20
pausetime = 0 ,0
sparkno = s7008
guard.sparkno = s7008
sparkxy = 0,-50
hitsound = S1,4
guardsound = S1,3
ground.type = High      ;Low,Trip,None
ground.slidetime = 20
ground.hittime = 20
air.hittime = 20
ground.velocity = 0,20
air.velocity = 0,20
sprpriority = 2
p1getp2facing = 0
fall = 1
fall.yvelocity = -4.5
fall.recover = 1
fall.recovertime = 4
fall.damage = 20
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 1
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 2
palfx.time = 0
envshake.time = 0
fall.envshake.time = 0




[State 0, ChangeState]
type = ChangeState
trigger1 = pos Y >=0
value = 1710

;-------------------------------------------------------------------
;airbladeground
[statedef 1710]
type = S
movetype = A
physics = N
anim = 1710
velset =0,0
sprpriority = 2

[State 0, PosSet]
type = PosSet
trigger1 = time =0
y = 0



[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=1000
value = S3,5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time>100&&time<=500&&animelem=5
trigger2 = time>500&&time<=800&&(animelem=4||animelem=9)
trigger3 = time>800&&(animelem=3||animelem=6||animelem=9)
value = S9100,2
freq = .25
volume = -150

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S5,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time>0&&time<=300&&animelem=7
trigger2 = time>300&&time<=600&&(animelem=3||animelem=8)
trigger3 = time>600&&time<=800&&(animelem=2||animelem=5||animelem=8)
trigger4 = time>800&&(animelem=2||animelem=4||animelem=6||animelem=8||animelem=10)
value = S4,0
freq = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =994
value = S1400,1
volume = 100


[State 0, Explod]
type = Explod
trigger1 = time = 1
anim = 1750
pos = 0,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 42
sprpriority = 4

[State 0, Explod]
type = Explod
trigger1 = time>100&&time<=500&&animelem=5
trigger2 = time>500&&time<=800&&(animelem=4||animelem=9)
trigger3 = time>800&&(animelem=3||animelem=6||animelem=9)
anim = 9110
pos = 0,-20
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 18
sprpriority = 1
scale=1,1

[State 0, Explod]
type = Explod
trigger1 = time=955
anim = 2411
pos = 0,-70
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 45

[State 0, Explod]
type = Explod
trigger1 =  animelem=5||animelem=10;time = 73 || time = 145 || time = 218
anim = 1735
pos = 10,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
sprpriority = 4

[State 0, Explod]
type = Explod
trigger1 =  animelem=5||animelem=10;time = 73 || time = 145 || time = 218
anim = 1736
pos = -10,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
sprpriority = 4

[State 0, Explod]
type = Explod
trigger1 = time>0&&time<=300&&animelem=7
trigger2 = time>300&&time<=600&&(animelem=3||animelem=8)
trigger3 = time>600&&time<=800&&(animelem=2||animelem=5||animelem=8)
trigger4 = time>800&&(animelem=2||animelem=4||animelem=6||animelem=8||animelem=10)
anim = 3506
pos = 0,-30
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 8
sprpriority = 4
scale = 1,.75

[State 0, Explod]
type = Explod
trigger1 = time =994
anim = 2420;10050
pos = 0,-20;-40
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
sprpriority = 2

[State 0, Explod]
type = Explod
trigger1 = time =994
anim = 8260;3505;10050
pos = 0,0;-40
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
sprpriority = 2

[State 0, Helper]
type = Helper
trigger1 = time = 1000
helpertype = normal ;player
name = "bladeshard1"
ID = 1715
stateno = 1715
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = time = 1000
helpertype = normal ;player
name = "bladeshard2"
ID = 1720
stateno = 1720
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = time = 1000
helpertype = normal ;player
name = "bladeshard3"
ID = 1725
stateno = 1725
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1

[State 0, Helper]
type = Helper
trigger1 = time = 1000
helpertype = normal ;player
name = "bladeshard4"
ID = 1730
stateno = 1730
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = time = 1000
helpertype = normal ;player
name = "bladeshard5"
ID = 1735
stateno = 1735
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 0, HitDef]
type = HitDef
trigger1=animelem=1||animelem=2||animelem=3||animelem=4||animelem=5||animelem=6||animelem=7||animelem=8||animelem=9||animelem=10
trigger2=animelem=1||animelem=2||animelem=3||animelem=4||animelem=5||animelem=6||animelem=7||animelem=8||animelem=9||animelem=10
trigger3=animelem=1||animelem=2||animelem=3||animelem=4||animelem=5||animelem=6||animelem=7||animelem=8||animelem=9||animelem=10
trigger4=animelem=1||animelem=2||animelem=3||animelem=4||animelem=5||animelem=6||animelem=7||animelem=8||animelem=9||animelem=10
trigger5=animelem=1||animelem=2||animelem=3||animelem=4||animelem=5||animelem=6||animelem=7||animelem=8||animelem=9||animelem=10
attr = S,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFL        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
priority = 5,Hit
damage = 30,10
pausetime = 5 ,3
sparkno = s7008
guard.sparkno = s7008
sparkxy = 0,-50
hitsound = S8,2
guardsound = S1,0
ground.type = High      ;Low,Trip,None
ground.slidetime = 0
ground.hittime = 0
air.hittime = 20
ground.velocity = -5,-5
air.velocity = -5,-5
sprpriority = 2
p1getp2facing = 0
fall = 0
fall.yvelocity = -4.5
fall.recover = 1
fall.recovertime = 4
fall.damage = 20
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 0
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 2
palfx.time = 0
envshake.time = 0
fall.envshake.time = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 1000

;-------------------------------------------------------------------
;shard
[statedef 1715]
type = A
movetype =A
physics = N
anim = 1715
velset = -10,0

[State 0, HitDef]
type = HitDef
trigger1=animelem=1
attr = A,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFL        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
priority = 5,Hit
damage = 20,4
pausetime = 5 ,3
sparkno = s7008
guard.sparkno = s7008
sparkxy = 0,-30
hitsound = S1,3
guardsound = S1,0
ground.type = High      ;Low,Trip,None
ground.slidetime = 0
ground.hittime = 0
air.hittime = 20
ground.velocity = 10,10
air.velocity = 10,10
sprpriority = 1
p1getp2facing = 0
fall = 0
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 0
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 2


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 55


;-------------------------------------------------------------------

;shard
[statedef 1720]
type = A
movetype =A
physics = N
anim = 1720
velset = 10,0

[State 0, HitDef]
type = HitDef
trigger1=animelem=1
attr = A,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFL        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
priority = 5,Hit
damage = 20,4
pausetime = 5 ,3
sparkno = s7008
guard.sparkno = s7008
sparkxy = 0,-30
hitsound = S1,3
guardsound = S1,0
ground.type = High      ;Low,Trip,None
ground.slidetime = 0
ground.hittime = 0
air.hittime = 20
ground.velocity = 10,10
air.velocity = 10,10
sprpriority = 1
p1getp2facing = 0
fall = 0
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 0
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 2


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 55


;-------------------------------------------------------------------

;shard
[statedef 1725]
type = A
movetype =A
physics = N
anim = 1725
velset = 0,-10

[State 0, HitDef]
type = HitDef
trigger1=animelem=1
attr = A,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFL        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
priority = 5,Hit
damage = 20,4
pausetime = 5 ,3
sparkno = s7008
guard.sparkno = s7008
sparkxy = 0,-50
hitsound = S1,3
guardsound = S1,0
ground.type = High      ;Low,Trip,None
ground.slidetime = 0
ground.hittime = 0
air.hittime = 20
ground.velocity = 10,10
air.velocity = 10,10
sprpriority = 1
p1getp2facing = 0
fall = 0
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 0
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 2


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 55

;-------------------------------------------------------------------

;shard
[statedef 1730]
type = A
movetype =A
physics = N
anim = 1720
velset = 10,-10

[State 0, HitDef]
type = HitDef
trigger1=animelem=1
attr = A,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFL        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
priority = 5,Hit
damage = 20,4
pausetime = 5 ,3
sparkno = s7008
guard.sparkno = s7008
sparkxy = 0,-50
hitsound = S1,3
guardsound = S1,0
ground.type = High      ;Low,Trip,None
ground.slidetime = 0
ground.hittime = 0
air.hittime = 20
ground.velocity = 10,10
air.velocity = 10,10
sprpriority = 1
p1getp2facing = 0
fall = 0
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 0
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 2


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 55


;-------------------------------------------------------------------

;shard
[statedef 1735]
type = A
movetype =A
physics = N
anim = 1715
velset = -10,-10

[State 0, HitDef]
type = HitDef
trigger1=animelem=1
attr = A,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAFL        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
priority = 5,Hit
damage = 20,4
pausetime = 5 ,3
sparkno = s7008
guard.sparkno = s7008
sparkxy = 0,-50
hitsound = S1,3
guardsound = S1,0
ground.type = High      ;Low,Trip,None
ground.slidetime = 0
ground.hittime = 0
air.hittime = 20
ground.velocity = 10,10
air.velocity = 10,10
sprpriority = 1
p1getp2facing = 0
fall = 0
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 0
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 2


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 55

;--------------------------------------------------------------------
;crush sword
[Statedef 1800]
type     = S
movetype = A
physics  = N
juggle   = 1
poweradd = -500
anim     = 3000
ctrl     = 0
sprpriority = 2
facep2 = 1
velset=0,0

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 65

[State 3000]
type = SuperPause
trigger1 = AnimElem = 1
pos = 0, 0
anim = -1
time = 65
movetime = 65
p2defmul = 1
darken = 0

[State -1]
type = Explod
trigger1 = time = 0
anim = 10050
ID = 10050
pos = 0, -80
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 0.5, 0.5
sprpriority = 4
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = PlaySnd
trigger1 = time = 0
value = s11000, 1

[State -1]
type = PalFX
trigger1 = time = 0
time = 20
add = 0,0,0
mul = 256,256,256
sinadd = 0,0,256,40


[State -2]
type = VelAdd
trigger1 = vel x > 0
x = -0.26

[State -2]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 1300]
type = AttackDist
trigger1 = 1
value = 0

[State 1300]
type = Helper
trigger1 = time=70
helpertype = normal
name = "yari"
ID = 1805
pos = 0, 0
postype = p2
facing = -1
stateno = 1805
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1.5
size.yscale = 1.5

[State 1300]
type = Helper
trigger1 = time=65
helpertype = normal
name = "ensyutu"
ID = 1810
pos = 0,0;20-random%40, 0
postype = p2
facing = 1
stateno = 1810
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1.5
size.yscale = 1.5

[State 1300]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;crush sword blade
[Statedef 1805]
type     = S
movetype = A
physics  = N
velset   = 0,0
anim = 2430
sprpriority = 4

[State 1400]
type = PosSet
trigger1 = 1
y = 10

[State 1400]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = unguardable

[State 1400]
type = PlaySnd
trigger1 = animelem = 3
value = s1400, 5
channel = -1



[State 1300]
type = Helper
trigger1 = time= 20
helpertype = normal
name = "ensyutu"
ID = 1810
pos = 0,-40;15-random%30, -40
postype = p1
facing = 1
stateno = 1810
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1.5
size.yscale = 1.5

[State 1300]
type = Helper
trigger1 = time = 40
helpertype = normal
name = "ensyutu"
ID = 1810
pos = 0,-80;10-random%20, -80
postype = p1
facing = 1
stateno = 1810
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1.5
size.yscale = 1.5

[State 1300]
type = Helper
trigger1 = time=60
helpertype = normal
name = "ensyutu"
ID = 1810
pos = 0,-120;5-random%10, -120
postype = p1
facing = 1
stateno = 1810
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1.5
size.yscale = 1.5

[State 1400]
type = HitDef
trigger1 = time=0; animelem = 10||animelem = 11||animelem = 12||animelem = 13
attr = S, SP
damage = 170,50
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 4, 4
guard.sparkno = s7010
sparkno = s7008+random%2
sparkxy = -10, -36
hitsound = s8, 3
guardsound = s7, 3
ground.type = High
ground.slidetime = 35
ground.hittime  = 35
guard.ctrltime = 22
ground.velocity = -1.3,-7.5;(-7.5-((root,fvar(13) > 1 && root,var(29) = 0)||(root,var(37)>0))*7)
guard.velocity = -3.2
airguard.velocity = -3.5,-3.8
air.type = High
air.velocity = -1.3,-7.5;(-7.5-((root,fvar(13) > 1 && root,var(29) = 0)||(root,var(37)>0))*7)
air.hittime = 12
getpower = 0,0
givepower = 0,0
yaccel = 0.4
fall.recover = 0
fall = 1
kill = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 1400]
type = null;PalFX
trigger1 = 1
time = 1
add = 140,10,10
mul = 256,256,256
invertall = 0
color = 256

[State 1400]
type = Trans
trigger1 = time <= 60
trans = add
ignorehitpause = 1

[State 1400]
type = Trans
trigger1 = time > 60
trans = addalpha
alpha = (256-23*(time-60)), 256;(23*(time-60))
ignorehitpause = 1

[State 1200]
type = BGPalFX
trigger1 = time <= 8
time = 1
add = 0,0,0
mul = (256-(time*19)),(256-(time*19)),(256-(time*19))
ignorehitpause = 1

[State 1200]
type = BGPalFX
trigger1 = time > 8
trigger1 = time < 60
time = 1
add = 0,0,0
mul = 106,106,106
ignorehitpause = 1

[State 1200]
type = BGPalFX
trigger1 = time >= 60
trigger1 = time < 70
time = 1
add = 0,0,0
mul = (106+19*(time-60)),(106+19*(time-60)),(106+19*(time-60))
ignorehitpause = 1

[State 1400]
type = Explod
trigger1 = time = 0
anim = 2433
ID = 2433
pos = 0,0;25, 12
facing = facing
postype = p1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = 1, 1
sprpriority = 4
ownpal = 1


[State -1]
type = AttackDist
trigger1 = animelemtime(12) >= 0
trigger2 = movecontact || MoveReversed
value = 0


[State 1400]
type = destroyself
trigger1 = animtime = 0



;---------------------------------------------------------------------------
;crush sword effect
[Statedef 1810]
type     = S
movetype = A
physics  = N
velset   = 0,-1
anim = 2432
sprpriority = 5



[State 1400]
type = PalFX
trigger1 = 1
time = 1
add = 140,10,10
mul = 256,256,256
invertall = 0
color = 256

[State 1400]
type = Trans
trigger1 = time <= 12
trans = add

[State 1400]
type = Trans
trigger1 = time > 12
trans = addalpha
alpha = (256-28*(time-12)), 256


[State 1400]
type = destroyself
trigger1 = animtime = 0

;-----------------------------------------------------------------------
;spellbalde
[Statedef 1899]
type     = S
movetype = A
physics  = N
juggle   = 1
poweradd = -500
anim     = 3000
ctrl     = 0
sprpriority = 2
facep2 = 1
velset = 0,0

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 65

[State 3000]
type = SuperPause
trigger1 = AnimElem = 1
pos = 0, 0
anim = -1
time = 65
movetime = 65
p2defmul = 1
darken = 0

[State -1]
type = PlaySnd
trigger1 = time = 0
value = s11000, 1

[State -1]
type = Explod
trigger1 = time = 0
anim = 10050
ID = 10050
pos = 0, -80
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 0.5, 0.5
sprpriority = 4
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State 1200]
type = Helper
trigger1 = animelem = 10
helpertype = normal
name = "ranmeief"
ID = 1900
pos = 0, 0
postype = p2
facing = 1
stateno = 1900
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1.5
size.yscale = 1.5

[State 1200]
type = BGPalFX
trigger1 = time <= 13
time = 1
add = 0,0,0
mul = (256-(time*15)),(256-(time*15)),(256-(time*15))

[State 1200]
type = BGPalFX
trigger1 = time > 13
trigger1 = time < 92
time = 1
add = 0,0,0
mul = 56,56,56

[State 1200]
type = BGPalFX
trigger1 = time >= 92
trigger1 = time <= 105
time = 1
add = 0,0,0
mul = (56+((time-92)*15)),(56+((time-92)*15)),(56+((time-92)*15))



[State 1200]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;------------------------------------------------------------------------
;spellblade blade
[Statedef 1900]
type     = S
movetype = A
physics  = N
velset   = 0,0
anim = 2400
sprpriority = 3

[State 1200]
type = PosSet
trigger1 = time <= 60
y = 0

[State 1200]
type = PlaySnd
trigger1 = animelem = 4
value = 1400, 2

[State 1200]
type = PlaySnd
trigger1 = time=60
value = 1400, 3

[State 1400]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1400]
type = Trans
trigger1 = time <= 60
trans = add

[State 1400]
type = Trans
trigger1 = time > 60
trans = addalpha
alpha = (time<=102)*(256-6*(time-60)), 256

[State 1400]
type = PalFX
trigger1 = 1
time = 1
add = 0,0,110
mul = 56,56,96
invertall = 0
color = 256

[State 1400]
type = VelAdd
trigger1 = time > 60
y = -0.9

[State 1200]
type = Helper
trigger1 = movehit
;trigger1 = animelemtime(10) = 60
trigger1 = numhelper(1912) = 0
helpertype = normal
name = "senkoku"
ID = 1912
pos = 0, 0
postype = p2
facing = 1
stateno = 1912
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 0.3
size.yscale = 0.3

[State 1200]
type = Helper
trigger1 = animelemtime(4) = 25
helpertype = normal
name = "ranmeief-moji"
ID = 1901
pos = 0, 0
postype = p1
facing = 1
stateno = 1901
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1.5
size.yscale = 1.5

[State 1200]
type = Helper
trigger1 = animelemtime(4) = 15
helpertype = normal
name = "ranmeief-moji"
ID = 1902
pos = 0, 0
postype = p1
facing = 1
stateno = 1902
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1.5
size.yscale = 1.5

[State 1200]
type = Helper
trigger1 = animelemtime(4) = 5
helpertype = normal
name = "ranmeief-moji"
ID = 1903
pos = 0, 0
postype = p1
facing = 1
stateno = 1903
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1.5
size.yscale = 1.5

[State 1200]
type = Explod
trigger1 = animelemtime(4) = 21
anim = 2404
ID = 2404
pos = 0, -100
postype = p1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = 1.5, 1.5
sprpriority = 5
ownpal = 1

[State 1200]
type = Explod
trigger1 = animelemtime(4) = 11
anim = 2404
ID = 2404
pos = 0, -80
postype = p1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = 1.5, 1.5
sprpriority = 5
ownpal = 1

[State 1200]
type = Explod
trigger1 = animelemtime(4) = 1
anim = 2404
ID = 2404
pos = 0, -60
postype = p1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = 1.5, 1.5
sprpriority = 5
ownpal = 1

[State 1200]
type = Explod
trigger1 = animelemtime(4) = 1
anim = 2408
ID = 2408
pos = 0, 0
postype = p1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = 1.5, 1
sprpriority = 5
ownpal = 1

[State 1200]
type = Explod
trigger1 = time > 60
anim = 2407
ID = 2407
pos = (-18+random%37), -30
postype = p1
bindtime = 1
removetime = -2
vel = 0, -1*(random%4)
supermovetime = 0
pausemovetime = 0
scale = 2, 2
sprpriority = 5
ownpal = 0

[State 1200]
type = Explod
trigger1 = time > 60
anim = 2407
ID = 2407
pos = (-18+random%37), -30
postype = p1
bindtime = 1
removetime = -2
vel = 0, -1*(random%4)
supermovetime = 0
pausemovetime = 0
scale = 2, 2
sprpriority = 5
ownpal = 0



[State 1200]
type = Explod
trigger1 = animelemtime(4) = 10;>= 1
;trigger1 = animelemtime(4) <= 60
;trigger1 = time%3 = 0
anim = 2411
ID = 2411
pos = 25, -55
postype = p1
bindtime = 1
removetime = -2
vel = 0, 0
supermovetime = 0
pausemovetime = 0
scale = 0.6, 0.6
sprpriority = 5
ownpal = 1

[State 1200]
type = Explod
trigger1 = animelemtime(4) = 10;>= 1
;trigger1 = animelemtime(4) <= 60
;trigger1 = time%3 = 0
anim = 2411
ID = 2411
pos = -25, -55
postype = p1
bindtime = 1
removetime = -2
vel = 0, 0
supermovetime = 0
pausemovetime = 0
scale = 0.6, 0.6
sprpriority = 5
ownpal = 1

[State 1200]
type = Explod
trigger1 = animelemtime(4) = 1;>= 1
;trigger1 = animelemtime(4) <= 60
;trigger1 = time%3 = 0
anim = 2411
ID = 2411
pos = 0, -40
postype = p1
bindtime = 1
removetime = -2
vel = 0, 0
supermovetime = 0
pausemovetime = 0
scale = 0.7, 0.7
sprpriority = 5
ownpal = 1

[State 0, HitDef]
type = HitDef
trigger1 = animelem=4
attr = S,NA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
damage = 80,20
pausetime = 6 ,3
;guard.pausetime = 0,0
guard.sparkno = s7010
sparkno = s7008+random%2
sparkxy = -10, -46
hitsound = s8, 2
guardsound = s7, 3
ground.type = High      ;Low,Trip,None
;air.type = High
ground.slidetime = 10
;guard.slidetime = 0
ground.hittime = 10
;guard.hittime = 0
air.hittime = 20
ground.velocity = 5,3
guard.velocity = 3
air.velocity = 5,3
airguard.velocity = 2,2
sprpriority = 1
p1getp2facing = 0
fall = 1
fall.yvelocity = -4.5
fall.recover = 1
fall.recovertime = 4
fall.damage = 10
down.bounce = 0
chainID = -1
nochainID = -1
hitonce = 1
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 1
palfx.time = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0


[State 1400]
type = destroyself
trigger1 = time > 160

;---------------------------------------------------------------------------
;spellblade effect
[Statedef 1901]
type     = A
movetype = I
physics  = N
velset   = 0,0
anim = 2401
sprpriority = 4

[State 1200]
type = PosSet
trigger1 = time <= 50
y = 0

[State 1400]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1400]
type = PalFX
trigger1 = 1
time = 1
add = 120,10,10
mul = 256,256,256
invertall = 0
color = 256

[State 1400]
type = Trans
trigger1 = time < 20
trans = addalpha
alpha = time*12, 256

[State 1400]
type = Trans
trigger1 = time <= 50
trigger1 = time >= 20
trans = add

[State 1400]
type = Trans
trigger1 = time > 70
trans = addalpha
alpha = (time<=90)*(256-6*(time-50)), 256



[State 1400]
type = VelSet
trigger1 = time > 50
y = -0.2

[State 1400]
type = destroyself
trigger1 = time > 90
;---------------------------------------------------------------------------
;spellblade effect
[Statedef 1902]
type     = A
movetype = I
physics  = N
velset   = 0,0
anim = 2402
sprpriority = 4

[State 1200]
type = PosSet
trigger1 = time <= 60
y = 0

[State 1400]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1400]
type = PalFX
trigger1 = 1
time = 1
add = 120,10,10
mul = 256,256,256
invertall = 0
color = 256

[State 1400]
type = Trans
trigger1 = time < 20
trans = addalpha
alpha = time*12, 256

[State 1400]
type = Trans
trigger1 = time <= 60
trigger1 = time >= 20
trans = add

[State 1400]
type = Trans
trigger1 = time > 60
trans = addalpha
alpha = (time<=100)*(256-6*(time-60)), 256



[State 1400]
type = VelSet
trigger1 = time > 60
y = -0.2

[State 1400]
type = destroyself
trigger1 = time > 100
;---------------------------------------------------------------------------
;spellblade effect
[Statedef 1903]
type     = A
movetype = I
physics  = N
velset   = 0,0
anim = 2403
sprpriority = 4

[State 1200]
type = PosSet
trigger1 = time <= 70
y = 0

[State 1400]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1400]
type = PalFX
trigger1 = 1
time = 1
add = 120,10,10
mul = 256,256,256
invertall = 0
color = 256

[State 1400]
type = Trans
trigger1 = time < 20
trans = addalpha
alpha = time*12, 256

[State 1400]
type = Trans
trigger1 = time <= 70
trigger1 = time >= 20
trans = add

[State 1400]
type = Trans
trigger1 = time > 70
trans = addalpha
alpha = (time<=110)*(256-6*(time-70)), 256



[State 1400]
type = VelSet
trigger1 = time > 70
y = -0.2

[State 1400]
type = destroyself
trigger1 = time > 110
;---------------------------------------------------------------------------
;spellblade death count
[Statedef 1912]
type     = A
movetype = A;I
physics  = N
velset   = 0,0
anim = 2412
sprpriority = 7
ctrl=0

[State 1400]
type = Turn
trigger1 = enemynear,facing = facing

[State 1400]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = unguardable

[State 1400]
type = PosSet
trigger1 = 1
x = enemynear,pos x

[State 1400]
type = PosSet
trigger1 = 1
y = (enemynear,pos y-120)

[State 1400]
type = VarSet
trigger1 = time = 1
trigger2 = time = 51
trigger3 = time = 101
trigger4 = time = 151
trigger5 = time = 201
trigger6 = time = 251
trigger7 = time = 301
trigger8 = time = 351
fv = 5
value = 3.0

[State 1400]
type = VarAdd
trigger1 = 1
fv = 5
value = -0.04


[State 1400]
type = Explod
trigger1 = time > 0
trigger1 = time <= 50
anim = 2418
ID = 2418
pos = 0, 20
facing = facing
postype = p1
bindtime = -1
removetime = 1
supermovetime = 0
pausemovetime = 0
scale = fvar(5), fvar(5)
sprpriority = 8
ownpal = 1

[State 1400]
type = Explod
trigger1 = time > 50
trigger1 = time <= 100
anim = 2417
ID = 2417
pos = 0, 20
facing = facing
postype = p1
bindtime = -1
removetime = 1
supermovetime = 0
pausemovetime = 0
scale = fvar(5), fvar(5)
sprpriority = 8
ownpal = 1

[State 1400]
type = Explod
trigger1 = time > 100
trigger1 = time <= 150
anim = 2416
ID = 2416
pos = 0, 20
facing = facing
postype = p1
bindtime = -1
removetime = 1
supermovetime = 0
pausemovetime = 0
scale = fvar(5), fvar(5)
sprpriority = 8
ownpal = 1

[State 1400]
type = Explod
trigger1 = time > 150
trigger1 = time <= 200
anim = 2415
ID = 2415
pos = 0, 20
facing = facing
postype = p1
bindtime = -1
removetime = 1
supermovetime = 0
pausemovetime = 0
scale = fvar(5), fvar(5)
sprpriority = 8
ownpal = 1

[State 1400]
type = Explod
trigger1 = time > 200
trigger1 = time <= 250
anim = 2414
ID = 2414
pos = 0, 20
facing = facing
postype = p1
bindtime = -1
removetime = 1
supermovetime = 0
pausemovetime = 0
scale = fvar(5), fvar(5)
sprpriority = 8
ownpal = 1

[State 1400]
type = Explod
trigger1 = time > 250
trigger1 = time <= 300
anim = 2413
ID = 2413
pos = 0, 20
facing = facing
postype = p1
bindtime = -1
removetime = 1
supermovetime = 0
pausemovetime = 0
scale = fvar(5), fvar(5)
sprpriority = 8
ownpal = 1


[State 1400]
type = Trans
trigger1 = time > 300
trans = addalpha
alpha = (256-(time-300)*3), (3*(time-300))




[State 1400]
type = PlaySnd
trigger1 = time = 300
value = 1400, 6
channel = -1

[State 1400]
type = Explod
trigger1 = time = 300
anim = 2420
ID = 2420
pos = 0, -50
facing = facing
postype = p2
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = 0.8, 0.8
sprpriority = 5
ownpal = 1

;[State 1400]
;type = StateTypeSet
;trigger1 = time < 300
;statetype = A
;movetype = A
;physics = N

[State 1400]
type = AttackDist
trigger1 = time = 300
value = 100

[State 1200]
type = HitDef
trigger1 = time = 301
attr = S, SP
damage = 100,15;(30+floor(50*(root,fvar(10)))),8
animtype = hard
guardflag = M
hitflag = MAFD
priority = 3, Hit
pausetime = 8, 8
guard.sparkno = s7010
sparkno = -1;s7008+random%2
sparkxy = -10, 56
hitsound = s8, 4
guardsound = s7, 3
ground.type = High
ground.slidetime = 35
ground.hittime  = 35
guard.ctrltime = 25
ground.velocity = 0,-8
airguard.velocity = -1.2,-.8
air.type = High
air.velocity = 0,-8
air.hittime = 12
getpower = 0,0
givepower = 0,0
yaccel = 0.4
fall.recover = 0
fall = 1
kill = 1;root,var(28)


[State -1]
type = AttackDist
trigger1 = movecontact || MoveReversed
value = 0

[State 1400]
type = destroyself
trigger1 = time < 500
trigger1 = time > 300
trigger1 = movehit
trigger2 = time > 500
trigger2 = root,movetype = H
trigger2 = root,stateno != [120,155]


;-------------------------------------------------------------------
;supercure
[Statedef 2200]
type     = S
movetype = A
physics  = N
juggle   = 10
ctrl     = 0
anim     = 1150
poweradd = -750
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[State 240]
type = Explod
trigger1 = time = 5
anim = 6032
ID = 6032
pos = 0,-40
postype = P1
facing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = 4

[State 0, Helper]
type = Helper
trigger1 = time = 34
helpertype = normal ;player
name = "regain"
ID = 6032
stateno = 6032
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .25
size.yscale = .25



[state -2]
type = lifeadd
trigger1 = alive = 1
persistent = 0
ignorehitpause = 1
value = 350

[state -2]
type = varadd
trigger1 = time = 34
persistent = 0
ignorehitpause = 1
var(5) = 1000

[State 240]
type = PlaySnd
trigger1 = time = 5
value = 6,0
volume = 100

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;--------------------------------------------------------------------

[statedef 6032]
type=S
movetype=I
physics=N
anim=6032
sprpriority = 2

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
time = 1
pos = 0,-30

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow


[State 0, DestroySelf]
type = DestroySelf
trigger1 =root,var(5)=0

;--------------------------------------------------------------------

;--------------------------------------------------------------------
;lightnigblade
[Statedef 3499]
type     = S
movetype = A
physics  = S
juggle   = 4
velset   = 0,0
anim     = 3000
ctrl     = 0
sprpriority = 2
poweradd = -750



[State -1]
type = Turn
trigger1 = time = 0
trigger1 = p2dist x < 0

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 75


[State 3000]
type = SuperPause
trigger1 = AnimElem = 1
pos = 0, 0
anim = -1
sound = s11000, 2
time = 65
movetime = 65
p2defmul = 1
darken = 0

[State -1]
type = Explod
trigger1 = time = 0
anim = 10050
ID = 10050
pos = 0, -80
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 0.5, 0.5
sprpriority = 4
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State 3000, 無敵]
type = NotHitBy
trigger1 = AnimElem = 1
value = SCA
time = 65

[State 3000]
type = Explod
trigger1 = animelem = 1 && var(9) !=0
anim = 10120
ID = 10120
pos = 0, 0
postype = left
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 999
pausemovetime = 999
scale = 1.0, 1.2
sprpriority = -8
ownpal = 1
removeongethit = 1

[State 3000]
type = AssertSpecial
trigger1 = time < 26
flag = nobg
flag2 = nofg
flag3 = nobardisplay

[State 3500]
type = BGPalFX
trigger1 = time >= 25
trigger1 = time < 58
time = 1
add = 0,0,0
mul = (3*(time-25)),(3*(time-25)),(3*(time-25))
ignorehitpause = 1

[State 3500]
type = BGPalFX
trigger1 = time >= 58
trigger1 = time < 68
time = 1
add = 0,0,0
mul = 100,100,100
ignorehitpause = 1


[State 3000]
type = Helper
trigger1 = animelem = 13 && var(9)=0
helpertype = normal
name = "inaduma"
ID = 3500
pos = 0, 0
postype = p2
facing = -1
stateno = 3500
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
size.xscale = 1.7;1.5
size.yscale = 1.7;1.5

[State 3000]
type = Helper
trigger1 = animelem = 13 && var(9)!=0
helpertype = normal
name = "inaduma"
ID = 3510
pos = 0, 0
postype = p2
facing = -1
stateno = 3510
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
size.xscale = 1.7;1.5
size.yscale = 1.7;1.5

[State 3000]
type = Helper
trigger1 = animelem = 13
helpertype = normal
name = "inadumaef"
ID = 3505
pos = -80, -270
postype = p2
facing = 1
stateno = 3505
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
size.xscale = 1;1.5
size.yscale = 1;1.5


[State 3000]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1





;---------------------------------------------------------------------------
;blade
[Statedef 3500]
type     = S
movetype = A
physics  = N
velset   = 0,0
anim = 3500
sprpriority = 4

[State 1400]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 3000]
type = PosSet
trigger1 = 1
y = 10

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 17

[State 1400]
type = PlaySnd
trigger1 = animelem = 4
value = s1400, 1
channel = -1

[State 1400]
type = HitDef
trigger1 = animelem=5||animelem=6||animelem=7
attr = S, SP
damage = 90,33;floor(25+55*root,fvar(10)),20
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 0, 4
guard.sparkno = s7010
sparkno = s7008+random%2
sparkxy = -10, -36
hitsound = s8, 2
guardsound = s1, 3
ground.type = High
ground.slidetime = 35
ground.hittime  = 35
guard.ctrltime = 25
ground.velocity = -3.9,-2.7;(-4.5-((root,fvar(13) > 1 && root,var(29) = 0)||(root,var(37)>0))*8)
airguard.velocity = -2.2,-1.8
air.type = High
air.velocity = -3.9,-2.7;(-4.5-((root,fvar(13) > 1 && root,var(29) = 0)||(root,var(37)>0))*8)
air.hittime = 12
getpower = 0,0
givepower = 0,0
yaccel = 0.4
fall.recover = 0
fall = 1
kill = 1;(root,var(28))
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0


[State 1400]
type = null;PalFX
trigger1 = 1
time = 1
add = 140,10,10
mul = 256,256,256
invertall = 0
color = 256

[State 1400]
type = Trans
trigger1 = time <= 40
trans = add
ignorehitpause = 1

[State 1400]
type = Trans
trigger1 = time > 40
trans = addalpha
alpha = (256-8*(time-40)), 256;(23*(time-40))
ignorehitpause = 1



[State -1]
type = Explod
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(8) < 20
trigger1 = time%3 = 0
anim = 3506
ID = 3506
pos = 0, (-30-(random%110))
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1.2, 1.2
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1



[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 0.5,-1
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 0.7,-0.7
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 1,-0.3
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -0.5,-1
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -0.7,-0.7
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -1,-0.3
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 0.5,-1.5
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 0.9,-1.1
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 1.3,-0.7
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 1.9,-0.2
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -0.5,-1.5
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -0.9,-1.1
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -1.3,-0.7
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -1.9,-0.2
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1



[State 3500]
type = BGPalFX
trigger1 = time < 57
time = 1
add = 0,0,0
mul = 100,100,100
ignorehitpause = 1
[State 3500]
type = BGPalFX
trigger1 = time >= 57
time = 1
add = 0,0,0
mul = (100+10*(time-57)),(100+10*(time-57)),(100+10*(time-57))
ignorehitpause = 1


[State 1400]
type = destroyself
trigger1 = time >= 72



;---------------------------------------------------------------------------
;blade
[Statedef 3510]
type     = S
movetype = A
physics  = N
velset   = 0,0
anim = 3500
sprpriority = 4

[State 1400]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1200,***]
type = helper
trigger1=animelem=6
name = "lightning33"
id = 1425
pos = 10,0
postype = p2
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 3000]
type = PosSet
trigger1 = 1
y = 10

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 17

[State 1400]
type = PlaySnd
trigger1 = animelem = 4
value = s1400, 1
channel = -1

[State 1400]
type = HitDef
trigger1 = animelem=5||animelem=6||animelem=7
attr = S, SP
damage = 130,50;floor(85+115*root,fvar(10)),20
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 0, 4
guard.sparkno = s7010
sparkno = s7008+random%2
sparkxy = -10, -36
hitsound = s8, 2
guardsound = s1, 3
ground.type = High
ground.slidetime = 35
ground.hittime  = 35
guard.ctrltime = 25
ground.velocity = -3.9,-2.7;(-4.5-((root,fvar(13) > 1 && root,var(29) = 0)||(root,var(37)>0))*8)
airguard.velocity = -2.2,-1.8
air.type = High
air.velocity = -3.9,-2.7;(-4.5-((root,fvar(13) > 1 && root,var(29) = 0)||(root,var(37)>0))*8)
air.hittime = 12
getpower = 0,0
givepower = 0,0
yaccel = 0.4
fall.recover = 0
fall = 1
kill = 1;(root,var(28))
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0


[State 1400]
type = null;PalFX
trigger1 = 1
time = 1
add = 140,10,10
mul = 256,256,256
invertall = 0
color = 256

[State 1400]
type = Trans
trigger1 = time <= 40
trans = add
ignorehitpause = 1

[State 1400]
type = Trans
trigger1 = time > 40
trans = addalpha
alpha = (256-8*(time-40)), 256;(23*(time-40))
ignorehitpause = 1



[State -1]
type = Explod
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(8) < 20
trigger1 = time%3 = 0
anim = 3506
ID = 3506
pos = 0, (-30-(random%110))
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1.2, 1.2
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1



[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 0.5,-1
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 0.7,-0.7
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 1,-0.3
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -0.5,-1
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -0.7,-0.7
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -1,-0.3
scale = 0.5, 0.5
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 0.5,-1.5
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 0.9,-1.1
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 1.3,-0.7
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = 10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = 1.9,-0.2
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -0.5,-1.5
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -0.9,-1.1
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -1.3,-0.7
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1

[State -1]
type = Explod
trigger1 = animelem = 5
anim = (3501+(random%2))
ID = 3501
pos = -10, -10
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
vel = -1.9,-0.2
scale = 0.25, 0.25
sprpriority = 5
supermovetime = 999
pausemovetime = 999
ownpal = 1



[State 3500]
type = BGPalFX
trigger1 = time < 57
time = 1
add = 0,0,0
mul = 100,100,100
ignorehitpause = 1
[State 3500]
type = BGPalFX
trigger1 = time >= 57
time = 1
add = 0,0,0
mul = (100+10*(time-57)),(100+10*(time-57)),(100+10*(time-57))
ignorehitpause = 1


[State 1400]
type = destroyself
trigger1 = time >= 72



;----------------------------------------------------------------------

;lightning effect
[Statedef 3505]
type     = S
movetype = A
physics  = N
velset   = 0,0
anim = 3505
sprpriority = 4

[State 3500]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3500]
type = AngleDraw
trigger1 = 1
value = 20

[State 3500]
type = PalFX
trigger1 = 1
time = 1
add = 10,10,140
mul = 256,256,256
invertall = 0
color = 256
[State 3500]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1




[State 3500]
type = destroyself
trigger1 = animtime = 0




;-------------------------------------------------------------------
;aura
[Statedef 20000]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
anim = 20000
ctrl = 0
sprpriority = 2

[State 2000, NHB]
type = nothitby
trigger1 = time = 0
value = SCA, NA, SA, NP, SA
time = 15

[State 2000, NHB]
type = hitby
trigger1 = time = 0
value = SCA, HA, HP, AT
time = 15



[State 2000, Sound]
type = PlaySnd
trigger1 = AnimElem = 5;16
value = 2000, 1

[State 2000, NoPush]
; Kikyo Can't be pushed back when using
type = PlayerPush
trigger1 = 1
value = 0

[State 2000, Aura]
; Kikyo goes SUPER SAIYAN FOUR PLUS PLUS OMFG WATCH OUT GOKU!!!.
type = Helper
trigger1 = AnimElem = 15;16
helpertype = normal
name = "aura"
ID = 20001
pos = 0,-54
postype = p1
facing = 1
stateno = 20001
anim=1401
ownpal =1

[State 2000, I Pity Da Foo Who Gets Pushed Back By Dis]
; Now we just need a glass of milk
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 125,30
animtype = back
guardflag = MA
hitflag = MAF-
pausetime = 10,8
hitsound = s1, 1
guardsound = S2, 0
sparkxy = -42,-54
ground.type = High
ground.slidetime = 30
ground.hittime = 60
ground.velocity = ifelse(p2dist x>=0,-10,10),-1
airguard.velocity = ifelse(p2dist x>=0,-4,4),-1
air.velocity = ifelse(p2dist x>=0,-5,5),-4
air.hittime = 60
fall = 1
air.fall = 1
fall.yvelocity = 0
fall.recover = 0
getpower = 120,50
givepower = 20, 15

;[State -2, Varset]
;type = Varadd
;trigger1 = movehit
;v = 48
;value = 6
;persistent = 0
;ignorehitpause = 1

[State 2000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------

[Statedef 20001]
type    = S
movetype= A
physics = S
juggle  = 2
velset = 0,0
anim = 20001
ctrl = 0
sprpriority = 1

[State 2100, T]
type = Trans
trigger1 = time < 14
trans = addalpha
alpha = (time*18),252

[State 2100, T]
type = Trans
trigger1 = time = 14
trigger2 = time = 15
trans = add

[State 2100, T]
type = Trans
trigger1 = time > 15
trans = addalpha
alpha = ((29-time)*18),252

[State 2100, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 2100, Stay In Place]
type = BindToRoot
trigger1 = 1
facing = 1
pos = 0,-54
time = 1

;[State 2100, NoPush]
; Kikyo Can't be pushed back when using
;type = PlayerPush
;trigger1 = 1
;value = 0

[State 2100, AngleDraw]
type = AngleDraw
trigger1 = Time < 8
;trigger2 = Time > 16
ignorehitpause = 1
scale = 1,1

[State 2100, AngleDraw]
type = AngleDraw
trigger1 = Time >= 8
trigger1 = time%2=0
;trigger1 = time <= 16
ignorehitpause = 1
scale = 1.25+(((time*1.0)-8.0)*0.25),1.25+(((time*1.0)-8.0)*0.25)

[State 2100, AngleDraw]
type = null;AngleDraw
trigger1 = Time = 8
ignorehitpause = 1
scale = 1.125,1.125

[State 2100, AngleDraw]
type = null;AngleDraw
trigger1 = Time = 10
ignorehitpause = 1
scale = 1.25,1.25

[State 2100, AngleDraw]
type = null;AngleDraw
trigger1 = Time = 12
ignorehitpause = 1
scale = 1.375,1.375

[State 2100, AngleDraw]
type = null;AngleDraw
trigger1 = Time = 14
ignorehitpause = 1
scale = 1.5,1.5

[State 2100, AngleDraw]
type = null;AngleDraw
trigger1 = Time = 16
ignorehitpause = 1
scale = 1.625,1.625

[State 2100, AngleDraw]
type = null;AngleDraw
trigger1 = Time = 18
ignorehitpause = 1
scale = 1.75,1.75

[State 2100, AngleDraw]
type = null;AngleDraw
trigger1 = Time = 20
ignorehitpause = 1
scale = 1.875,1.875

[State 2100, AngleDraw]
type = null;AngleDraw
trigger1 = Time = 22
ignorehitpause = 1
scale = 2.0,2.0

[State 2100, DestroySelf]
type = DestroySelf
trigger1 = Time >=28
trigger2 = parent,movetype = H


;--------------------------------------------------------------------


