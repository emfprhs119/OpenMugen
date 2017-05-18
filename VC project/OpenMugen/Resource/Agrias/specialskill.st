
;---------------------------------------------------------------------------
;stasis sword
[Statedef 2000]
type     = S
movetype = A
physics  = N
juggle   = 10
velset   = 0,0
ctrl     = 0
anim     = 2000
poweradd = 0
sprpriority = 2
hitcountpersist = 1

;---------------------------------------------------------------------------

[State 240]
type = Explod
trigger1 = time = 6
anim = 6100
ID = 6100
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = 1
scale = 3,3
sprpriority = -7

[state -2]
type = SuperPause
trigger1 = time = 6
time = 30
anim = S6101
sound = S100,0
pos = -52,-38
movetime = 0
darken = 0
p2defmul = 1
poweradd = -1000
unhittable = 1

[state -2]
type = BGPalFX
trigger1 = time = 6
time = 110
add = 30,30,30
mul = 64,64,256

[state -2]
type =BGPalFX
trigger1 = time >= 60
time = 1
add = 20-(time-60),20-(time-60),20-(time-60)
mul = 64+(time-60)*15,64+(time-60)*15,256

;---------------------------------------------------------------------------

[State 240]
type = PlaySnd
trigger1 = AnimElem = 7
value =0,4

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 8

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = -20

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 7
attr = S, NA ; Standing, Normal Attack
damage = 75,  50
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 15, 16
sparkno = S6005
guard.sparkno     = -1
sparkxy = 5, -70
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 100
ground.hittime  = 100
ground.velocity = -6 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -35 -ceil(HitCount*0.25)
air.type = High
air.velocity = -4 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.ctrltime = 20
guard.dist = 120
p1stateno = 2001
p2stateno = 2010
ID = 2000
kill = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 190

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------

[Statedef 2001]
type     = S
movetype = A
physics  = N
juggle   = 0
velset   = 0,0
ctrl     = 0
anim = 2001
poweradd = 0
sprpriority = 2
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = time = 0
persistent = 0
ignorehitpause = 1
fvar(1) = -3-HitCount

[state -2]
type = BGPalFX
trigger1 = time = 0
time = 130
add = 30,30,30
mul = 64,64,256

[state -2]
type = BGPalFX
trigger1 = time >= 130
time = 1
add = 30-(time-130),30-(time-130),30-(time-130)
mul = 64+(time-130)*16,64+(time-130)*16,256

[State 200]
type = Helper
trigger1 = time >= 20 && time < 80 && time%12=0
pos = -60,-300
helpertype = Normal
name = "ice"
postype       = p2
ID = 2002
stateNo = 2002
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200]
type = Helper
trigger1 = time = 31
pos = 0,0
helpertype = Normal
name = "ice"
postype       = p2
ID = 2003
stateNo = 2003
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = PlaySnd
trigger1 = time = 45
value =3,0

[state -2]
type = varSet
trigger1 = time = 107
var(20) = 1

[state -2]
type = varSet
trigger1 = time = 108
var(20) = 0

[State 240]
type = targetLifeAdd
trigger1 = (Time = 110)
value = Floor(-475*0.01*(100-fvar(1)))
kill = 1
persistent=0

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------


[Statedef 2002]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = ifelse(random%2=0,6007,6008)
ctrl = 0
hitdefpersist = 1 
sprpriority = 3

[State 240]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240, ]
type = Varset
trigger1 = time = 0
var(40) = (random%60)

[State 6000]
type = posadd
trigger1 = time = 0
x = random%120
y = -random%60

[State 6000]
type = Velset
trigger1 = pos Y < -20-var(40)
y = 40

[State 6000]
type = Velset
trigger1 = pos Y >= -20-var(40)
y = 0

[State 240, ]
type = Varset
trigger1 = time = 0
var(45) = ifelse(anim=6007,-25-random%25,-69-random%25)

[State 240]
type = AngleDraw
trigger1 = 1
value = var(45)
scale = 1,1

[State 200]
type = DestroySelf
trigger1 = time = 240
trigger2 = root,var(20)=1

;---------------------------------------------------------------------------


[Statedef 2003]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6009
ctrl = 0
hitdefpersist = 1 
sprpriority = 3

[State 240]
type = PlaySnd
trigger1 = time = 0
value =3,1

[State 240]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 200]
type = Helper
trigger1 = time = 24
pos = 0,0
helpertype = Normal
name = "ice"
postype       = p2
ID = 2004
stateNo = 2004
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = ChangeAnim
trigger1 = time = 66
value = 6015
elem = 1

[State 240]
type = AngleDraw
trigger1 = 1
scale = 2.25,2.25

[State 200]
type = DestroySelf
trigger1 = animtime = 0 && anim = 6015

;---------------------------------------------------------------------------


[Statedef 2004]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6010
ctrl = 0
hitdefpersist = 1 
sprpriority = 3

[State 240]
type = Trans
trigger1 = time < 108
trans = addalpha
alpha = 256,256

[State 240]
type = Trans
trigger1 = time >= 108
trans = addalpha
alpha = 256-(time-108)*24,256

[State 240]
type = PlaySnd
trigger1 = time = 0
value =3,2

[State 240, ]
type = ChangeAnim
trigger1 = time = 12
value = 6011
elem = 1

[State 240]
type = PlaySnd
trigger1 = time = 12
value =3,1

[State 240]
type = ChangeAnim
trigger1 = time = 24
value = 6012
elem = 1

[State 240]
type = PlaySnd
trigger1 = time = 24
value =3,2

[State 240]
type = ChangeAnim
trigger1 = time = 48
value = 6014
elem = 1

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240]
type = AngleDraw
trigger1 = time < 48
scale = 2,2

[State 240]
type = AngleDraw
trigger1 = time = 48
scale = 0.85,0.85

[State 240]
type = AngleDraw
trigger1 = time = 49
scale = 0.95,0.95

[State 240]
type = AngleDraw
trigger1 = time = 50
scale = 1.05,1.05

[State 240]
type = AngleDraw
trigger1 = time >= 51
scale = 1.15,1.3

[State 240]
type = PlaySnd
trigger1 = time = 48
value =3,4
[State 240]
type = PlaySnd
trigger1 = time = 48
value =3,5

[State 240]
type = Explod
trigger1 = time >= 51 && time%9 = 0
anim = 6016
ID = 6016
pos = 0,-150
random = 80, 150
vel = 0,0.5
postype = P1
facing = 1
bindtime = 1
removetime = 60
scale = 1,1
sprpriority = 1

[State 200]
type = DestroySelf
trigger1 = time = 120

;---------------------------------------------------------------------------

[Statedef 2010]
type     = A
movetype = H
physics  = S
ctrl     = 0
sprpriority = 0

[State 240]
type = PlayerPush
trigger1 = 1
value = 0

[State 240]
type = Changeanim
trigger1 = 1
value = 5000
elem = 1

[State 240]
type = PosSet
trigger1 = time = 0
y = 0

[State 200]
type = VelSet
trigger1 = time = 0
x = -14
y = 0

[State 200]
type = velSet
trigger1 = (Time > 120)
x = 0
y = -8

[State 803]
type = SelfState
trigger1 = (Time > 120)
value = 5050
ctrl = 0

;---------------------------------------------------------------------------
;superblade
[Statedef 2300]
type     = S
movetype = A
physics  = S
juggle   = 10
ctrl     = 0
anim     = 1112
poweradd = 0
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50
;---------------------------------------------------------------------------

[State 240]
type = Explod
trigger1 = animelem = 1
anim = 6100
ID = 6100
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = 1
scale = 3,3
sprpriority = -7

[state -2]
type = SuperPause
trigger1 = animelem = 1
time = 30
anim = S6101
sound = S100,0
pos = -40,-52
movetime = 0
darken = 0
p2defmul = 1
poweradd = -1000
unhittable = 1

[state -2]
type = BGPalFX
trigger1 = animelem = 1
time = 110
add = 30,30,30
mul = 64,64,256

[state -2]
type =BGPalFX
trigger1 = time >= 60
time = 1
add = 20-(time-60),20-(time-60),20-(time-60)
mul = 64+(time-60)*15,64+(time-60)*15,256
;---------------------------------------------------------------------------




[State 240]
type = PlaySnd
trigger1 = animelem = 3
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 3
pos = 20,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 130

[State 240]
type = PlaySnd
trigger1 = time = 4
value = 0,9


;---------------------------------------------------------------------------


[State 240]
type = PlaySnd
trigger1 = animelem = 4
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 4
pos = 50,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 170




;---------------------------------------------------------------------------


[State 240]
type = PlaySnd
trigger1 = animelem = 5
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 5
pos = 80,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 200



;---------------------------------------------------------------------------


[State 240]
type = PlaySnd
trigger1 = animelem = 6
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 6
pos = 110,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 200





;---------------------------------------------------------------------------


[State 240]
type = PlaySnd
trigger1 = animelem = 7
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 7
pos = 140,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 200





;---------------------------------------------------------------------------


[State 240]
type = PlaySnd
trigger1 = animelem = 8
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 8
pos = 170,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 200




;---------------------------------------------------------------------------


[State 240]
type = PlaySnd
trigger1 = animelem = 9
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 9
pos = 200,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 200



;---------------------------------------------------------------------------


[State 240]
type = PlaySnd
trigger1 = animelem = 10
value = 5,0

[State 200]
type = Helper
trigger1 = animelem = 10
pos = 230,0
helpertype = Normal
name = "Blade"
postype       = p1
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 200



[State 240]
type = ChangeState
trigger1 = animtime >= 0 &&var(9)!=0 &&power>=400
value = 1422
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 &&var(9)=0
value = 0
ctrl = 1

;---------------------------------------------------------------------------

;super blade lightning
[Statedef 1422]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= -400
velset = 0,0
anim = 0
ctrl = 0
sprpriority = 2



[State 1200,***]
type = helper
trigger1=animelem=3
name = "b2"
id = 1421
pos = 10,0
postype = p2
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=animelem=3&&var(9)!=0
name = "b2"
id = 1425
pos = 10,0
postype = p2
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1100, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------
;superlightning blade
[Statedef 2301]
type     = S
movetype = A
physics  = S
juggle   = 10
ctrl     = 0
anim     = 1111
poweradd = 0
velset = 0,0
sprpriority = 2
hitcountpersist = 1

[State 240]
type = Explod
trigger1 = animelem = 1
anim = 6100
ID = 6100
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = 1
scale = 3,3
sprpriority = -7

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 50

[state -2]
type = SuperPause
trigger1 = animelem = 1
time = 30
anim = S6101
sound = S100,0
pos = -40,-52
movetime = 0
darken = 0
p2defmul = 1
poweradd = -1500
unhittable = 1

[state -2]
type = BGPalFX
trigger1 = animelem = 1
time = 110
add = 30,30,30
mul = 64,64,256

[state -2]
type =BGPalFX
trigger1 = time >= 60
time = 1
add = 20-(time-60),20-(time-60),20-(time-60)
mul = 64+(time-60)*15,64+(time-60)*15,256


[State 240]
type = PlaySnd
trigger1 = animelem = 3
value = 5,0

[State 240]
type = PlaySnd
trigger1 = animelem = 5
value = 5,0



[State 200]
type = Helper
trigger1 = animelem = 3
pos = -30,0
helpertype = Normal
name = "Blade"
postype       = p2
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200]
type = Helper
trigger1 = animelem = 5
pos = -30,0
helpertype = Normal
name = "Blade"
postype       = p2
ID = 1105
stateNo = 2205
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1200,***]
type = helper
trigger1=animelem=2&&var(9)=0
name = "b2"
id = 1421
pos = 10,0
postype = p2
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=animelem=7&&var(9)=0
name = "b2"
id = 1421
pos = 10,0
postype = p2
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=animelem=2&&var(9)!=0
name = "b2"
id = 1425
pos = 10,0
postype = p2
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=animelem=7&&var(9)!=0
name = "b2"
id = 1425
pos = 10,0
postype = p2
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 130

[State 240]
type = PlaySnd
trigger1 = time = 4
value = 0,9

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;----------------------------------------------------------------------
[Statedef 1321]
movetype= A
anim = 1320
sprpriority = 5

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow

[State 240]
type = PlaySnd
trigger1 = animelem = 1
value = 1320,0


[State 1000]
type = NotHitBy
trigger1 = 1
value = ,SA,NA,HA,ST,NT,HT
time = 200

[State 3000,5]
type = hitdef
trigger1 =time=1
attr = S, HP
animtype =hard
damage = 70,2
guardflag =MA
hitflag=MADF
pausetime =0,0
getpower =0
sparkno =-1
sparkxy =0,0
hitsound = -1
ground.type = High
ground.slidetime = 11
ground.hittime  = 20
ground.velocity = -4,0
air.velocity = -4,-3
fall.recover=0
air.fall=1
palfx.time =20
palfx.sinadd =80,80,0,5
palfx.add = 160,160,0
palfx.invertall =1


[State 2000, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AP
slot = 1
stateno = 252
time = 200

[State 1201,end]
type = Destroyself
trigger1 = time = 37
;----------------------------------------------------------------------

[Statedef 1322]
movetype= A
anim = 1320
sprpriority = 5

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow

[State 240]
type = PlaySnd
trigger1 = animelem = 1
value = 1320,0


[State 1000]
type = NotHitBy
trigger1 = 1
value = ,SA,NA,HA,ST,NT,HT
time = 200

[State 3000,5]
type = hitdef
trigger1 =time=1
attr = S, HP
animtype =hard
damage = 140,60
guardflag =MA
hitflag=MADF
pausetime =0,0
getpower =0
sparkno =-1
sparkxy =0,0
hitsound = -1
ground.type = High
ground.slidetime = 11
ground.hittime  = 20
ground.velocity = -4,0
air.velocity = -4,-3
fall.recover=0
air.fall=1
palfx.time =20
palfx.sinadd =80,80,0,5
palfx.add = 160,160,0
palfx.invertall =1



[State 2000, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AP
slot = 1
stateno = 252
time = 200

[State 1201,end]
type = Destroyself
trigger1 = time = 37
;----------------------------------------------------------------------

[Statedef 2205]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6030
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = Trans
trigger1 = time <= 20
trans = addalpha
alpha = 256,156

[State 240]
type = Trans
trigger1 = time >= 20
trans = addalpha
alpha = 256-(time-20)*60,256

[state -2]
type = Parentvaradd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 16

[State 200]
type = HitDef
triggerall = root,fvar(1) != 100
trigger1 = time = 0
attr = S, HA ;立ち通常打撃（Standing, Normal Attack）
damage = Floor(130*0.01*(100-root,fvar(1))),  20
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

[State 240]
type = Explod
trigger1 = time = 20
anim = 6031
ID = 6031
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = -2
scale = 0.75,0.75
sprpriority = 4

[State 240]
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

[State 200]
type = DestroySelf
trigger1 = time = 36
trigger2 = root,Movetype = H
;----------------------------------------------------------------------
;super lightning
[Statedef 2420]
type     = S
movetype = A
physics  = N
juggle   = 10
velset   = 0,0
ctrl     = 0
anim     = 2000
poweradd = -2500
sprpriority = 2
hitcountpersist = 1

;---------------------------------------------------------------------------

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 100

[State 240]
type = Explod
trigger1 = time = 6
anim = 6100
ID = 6100
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = 1
scale = 3,3
sprpriority = -7

[state -2]
type = SuperPause
trigger1 = time = 6
time = 30
anim = S6101
sound = S100,0
pos = -52,-38
movetime = 0
darken = 0
p2defmul = 1
poweradd = -1000
unhittable = 1

[state -2]
type = BGPalFX
trigger1 = time = 6
time = 110
add = 30,30,30
mul = 64,64,256

[state -2]
type =BGPalFX
trigger1 = time >= 60
time = 1
add = 20-(time-60),20-(time-60),20-(time-60)
mul = 64+(time-60)*15,64+(time-60)*15,256

;---------------------------------------------------------------------------

[State 240]
type = PlaySnd
trigger1 = AnimElem = 7
value =0,4


[State 1200,***]
type = helper
trigger1=time=22
name = "b2"
id = 1421
pos = 10,0
postype = p1
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999


[State 1200,***]
type = helper
trigger1=time=25
name = "b2"
id = 1425
pos = 30,0
postype = p1
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=time=27
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


[State 1200,***]
type = helper
trigger1=time=29
name = "b2"
id = 1425
pos = 70,0
postype = p1
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=time=31
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


[State 1200,***]
type = helper
trigger1=time=33
name = "b2"
id = 1425
pos = 110,0
postype = p1
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=time=36
name = "b2"
id = 1421
pos = 130,0
postype = p1
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999


[State 1200,***]
type = helper
trigger1=time=39
name = "b2"
id = 1425
pos = 150,0
postype = p1
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=time=41
name = "b2"
id = 1421
pos = 170,0
postype = p1
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999


[State 1200,***]
type = helper
trigger1=time=43
name = "b2"
id = 1425
pos = 190,0
postype = p1
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=time=45
name = "b2"
id = 1421
pos = 210,0
postype = p1
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999


[State 1200,***]
type = helper
trigger1=time=47
name = "b2"
id = 1425
pos = 230,0
postype = p1
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999

[State 1200,***]
type = helper
trigger1=time=49
name = "b2"
id = 1421
pos = 250,0
postype = p1
stateno = 1421
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999


[State 1200,***]
type = helper
trigger1=time=51
name = "b2"
id = 1425
pos = 270,0
postype = p1
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999



[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 190

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;----------------------------------------------------------------------
;dengeki combo
[Statedef 2700]
type     = S
movetype = A
physics  = N
juggle   = 10
velset   = 0,0
ctrl     = 0
anim     = 1002
poweradd = 0
sprpriority = 2
hitcountpersist = 1

;---------------------------------------------------------------------------

[State 240]
type = Explod
trigger1 = time = 6
anim = 6100
ID = 6100
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = 1
scale = 3,3
sprpriority = -7

[State -2, Burst]
type = Explod
trigger1 = Animelem = 3
stateno= 3001
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[state -2]
type = SuperPause
trigger1 = time = 6
time = 30
anim = S6101
sound = S100,0
pos = -57,-38
movetime = 0
darken = 0
p2defmul = 1
poweradd = -1000
unhittable = 1

[state -2]
type = BGPalFX
trigger1 = time = 6
time = 110
add = 30,30,30
mul = 64,64,256

[state -2]
type =BGPalFX
trigger1 = time >= 60
time = 1
add = 20-(time-60),20-(time-60),20-(time-60)
mul = 64+(time-60)*15,64+(time-60)*15,256


;---------------------------------------------------------------------------


[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = -7

[State 200]
type = Helper
trigger1 = time = 0
pos = -65,-44
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1003
stateNo = 3013
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
stateNo = 3014
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = PlaySnd
trigger1 = time = 4
value = 4,1


[State 6000]
type = Velset
trigger1 = time = 22
x = 36

[State 6000]
type = Veladd
trigger1 = time >= 22 && vel X > 0
x = -1

[State 240]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0,9

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)=0
trigger2 = AnimElem = 5 && var(9)=0
trigger3 = AnimElem = 6 && var(9)=0
trigger4 = AnimElem = 7 && var(9)=0
trigger5 = AnimElem = 8 && var(9)=0
trigger5 = AnimElem = 9 && var(9)=0
attr = S, NA
damage = 110,  35
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19
p1stateno = 2701
p2stateno = 2011
ID = 3000
kill = 0

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)!=0
trigger2 = AnimElem = 5 && var(9)!=0
trigger3 = AnimElem = 6 && var(9)!=0
trigger4 = AnimElem = 7 && var(9)!=0
trigger5 = AnimElem = 8 && var(9)!=0
trigger5 = AnimElem = 9 && var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 170,  65
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19
p1stateno = 2701
p2stateno = 2011
ID = 3000
kill = 0


[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 480

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;------------------------------------------------------------------

[Statedef 2701]
type     = S
movetype = A
physics  = N
juggle   = 10
velset   = 0,0
ctrl     = 0
anim     = 1002
poweradd = -1000
sprpriority = 2
hitcountpersist = 1

;---------------------------------------------------------------------------


[State -2, Burst]
type = Explod
trigger1 = Animelem = 3
stateno= 3001
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7



;---------------------------------------------------------------------------


[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = -7

[State 200]
type = Helper
trigger1 = time = 0
pos = -55,-44
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1003
stateNo = 3013
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
stateNo = 3014
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = PlaySnd
trigger1 = time = 4
value = 4,1


;[State 6000, 速度]
;type = Velset
;trigger1 = time = 22
;x = 36

;[State 6000, 速度]
;type = Veladd
;trigger1 = time >= 22 && vel X > 0
;x = -1

[State 240]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0,9

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)=0
trigger2 = AnimElem = 5 && var(9)=0
trigger3 = AnimElem = 6 && var(9)=0
trigger4 = AnimElem = 7 && var(9)=0
trigger5 = AnimElem = 8 && var(9)=0
trigger5 = AnimElem = 9 && var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 110,  35
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19
p1stateno = 2702
p2stateno = 2011
ID = 3000
kill = 0

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)!=0
trigger2 = AnimElem = 5 && var(9)!=0
trigger3 = AnimElem = 6 && var(9)!=0
trigger4 = AnimElem = 7 && var(9)!=0
trigger5 = AnimElem = 8 && var(9)!=0
trigger5 = AnimElem = 9 && var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 170,  65
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19
p1stateno = 2702
p2stateno = 2011
ID = 3000
kill = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 480

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;------------------------------------------------------------------

[Statedef 2702]
type     = S
movetype = A
physics  = N
juggle   = 10
velset   = 0,0
ctrl     = 0
anim     = 1002
poweradd = 0
sprpriority = 2
hitcountpersist = 1

;---------------------------------------------------------------------------


[State -2, Burst]
type = Explod
trigger1 = Animelem = 3
stateno= 3001
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7






;---------------------------------------------------------------------------


[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = -7

[State 200]
type = Helper
trigger1 = time = 0
pos = -55,-44
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1003
stateNo = 3013
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
stateNo = 3014
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = PlaySnd
trigger1 = time = 4
value = 4,1


;[State 6000, 速度]
;type = Velset
;trigger1 = time = 22
;x = 36

;[State 6000, 速度]
;type = Veladd
;trigger1 = time >= 22 && vel X > 0
;x = -1

[State 240]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0,9

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)=0
trigger2 = AnimElem = 5 && var(9)=0
trigger3 = AnimElem = 6 && var(9)=0
trigger4 = AnimElem = 7 && var(9)=0
trigger5 = AnimElem = 8 && var(9)=0
trigger5 = AnimElem = 9 && var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 110,  35
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19
p1stateno = 1365
p2stateno = 2012
ID = 3000
kill = 0

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)!=0
trigger2 = AnimElem = 5 && var(9)!=0
trigger3 = AnimElem = 6 && var(9)!=0
trigger4 = AnimElem = 7 && var(9)!=0
trigger5 = AnimElem = 8 && var(9)!=0
trigger5 = AnimElem = 9 && var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 110,  35
getpower = -100
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19
;p1stateno = 0
p2stateno = 2012
ID = 3000
kill = 0


[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 480

[State 240]
type = ChangeState
trigger1 = animtime >= 0 &&var(9)=0
value = 0
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 &&var(9)!=0
value = 1367
ctrl = 1


;------------------------------------------------------------------


;charging combo stasis sword
[Statedef 2799]
type     = S
movetype = A
physics  = N
juggle   = 10
velset   = 0,0
ctrl     = 0
anim     = 1002
poweradd = 0
sprpriority = 2
hitcountpersist = 1

;---------------------------------------------------------------------------

[State 240]
type = Explod
trigger1 = time = 6
anim = 6100
ID = 6100
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = 1
scale = 3,3
sprpriority = -7

[State -2, Burst]
type = Explod
trigger1 = Animelem = 3
ID=6666
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[state -2]
type = SuperPause
trigger1 = time = 6
time = 30
anim = S6101
sound = S100,0
pos = -57,-38
movetime = 0
darken = 0
p2defmul = 1
poweradd = -1000
unhittable = 1

[state -2]
type = BGPalFX
trigger1 = time = 6
time = 110
add = 30,30,30
mul = 64,64,256

[state -2]
type =BGPalFX
trigger1 = time >= 60
time = 1
add = 20-(time-60),20-(time-60),20-(time-60)
mul = 64+(time-60)*15,64+(time-60)*15,256


;---------------------------------------------------------------------------


[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = -17

[State 200]
type = Helper
trigger1 = time = 0
pos = -55,-44
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1003
stateNo = 3013
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
stateNo = 3014
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = PlaySnd
trigger1 = time = 4
value = 4,1


[State 6000]
type = Velset
trigger1 = time = 22
x = 36

[State 6000]
type = Veladd
trigger1 = time >= 22 && vel X > 0
x = -1

[State 240]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0,9

[State 200]
type = HitDef
triggerall = fvar(1) != 100&&var(9)=0
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
trigger3 = AnimElem = 6
trigger4 = AnimElem = 7
trigger5 = AnimElem = 8
trigger5 = AnimElem = 9
attr = S, NA
damage = 110,  35
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19
p1stateno = 2800
p2stateno = 2012
ID = 3000
kill = 0

[State 200]
type = HitDef
triggerall = fvar(1) != 100&&var(9) !=0
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
trigger3 = AnimElem = 6
trigger4 = AnimElem = 7
trigger5 = AnimElem = 8
trigger5 = AnimElem = 9
attr = S, NA
damage = 140,  65
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s4, 0
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120
guard.ctrltime  = 19
p1stateno = 2800
p2stateno = 2012
ID = 3000
kill = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 480

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;----------------------------------------------------------------------
[Statedef 2012]
type     = A
movetype = H
physics  = S
ctrl     = 0
sprpriority = 0

[State 240]
type = PlayerPush
trigger1 = 1
value = 0

[State 240]
type = Changeanim
trigger1 = 1
value = 5000
elem = 1

;[State 240]
;type = PosSet
;trigger1 = time = 0
;y = 0

[state 1000,4]
type = posadd;add
trigger1 = time = 0
x = floor(p2dist X) - 95
y = floor(p2dist Y) - 0
pausemovetime = 80

[State 200]
type = VelSet
trigger1 = time = 0
x = 1.5
y = 0

[State 200]
type = velSet
trigger1 = (Time > 120)
x = 0
y = 1

[State 803]
type = SelfState
trigger1 = (Time > 120)
value = 5050
ctrl = 0

;------------------------------------------------------------------------

[Statedef 2011]
type     = A
movetype = H
physics  = S
ctrl     = 0
sprpriority = 0

;[State 240]
;type = PlayerPush
;trigger1 = 1
;value = 0

[State 240]
type = Changeanim
trigger1 = 1
value = 5000
elem = 1

[State 240]
type = PosSet
trigger1 = time = 0
y = 0

;[State 200]
;type = VelSet
;trigger1 = time = 0
;x = -14
;y = 0

;[State 200, 空中]
;type = velSet
;trigger1 = (Time > 120)
;x = 0
;y = -8

[State 803]
type = SelfState
trigger1 = (Time > 320)
value = 5050
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 2800]
type     = S
movetype = A
physics  = N
juggle   = 0
velset   = 0,0
ctrl     = 0
anim = 2800
poweradd = -1000
sprpriority = 2
hitcountpersist = 1


[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = -10

[State 200]
type = PlaySnd
trigger1 = AnimElem= 5||animelem=33||animelem=40||animelem=55||animelem=61
value = s0, 5

[State 200]
type = PlaySnd
trigger1 = AnimElem =11||animelem=23||animelem=38||animelem=46||animelem=70||animelem=73||animelem=83
value = s0, 4

[State 200]
type = PlaySnd
trigger1 = AnimElem = 14
value = s0, 9

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) = 0
trigger1 = AnimElem = 4 || animelem = 5
attr = S, NA
damage = 28
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 18, 21
sparkno = S6005
guard.sparkno     = -1
sparkxy = 5, -70
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
;guard.dist = 120
p2stateno = 2011

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) != 0
trigger1 = AnimElem = 4 || animelem = 5
attr = S, NA
damage = 38
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 18, 21
sparkno = S6020
guard.sparkno     = -1
sparkxy = 5, -70
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
;guard.dist = 120
p2stateno = 2011

;--------------------------------------------------------------------






[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) = 0
trigger1 = AnimElem = 10||animelem = 13||animelem=75
attr = S, NA
damage = 39
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 18, 21
sparkno = S6004
guard.sparkno     = -1
sparkxy = -20, -55
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
;guard.dist = 120
p2stateno = 2011

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) != 0
trigger1 = AnimElem = 10||animelem = 13||animelem=75
attr = S, NA
damage = 49
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 18, 21
sparkno = S6020
guard.sparkno     = -1
sparkxy = -20, -55
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
;guard.dist = 120
p2stateno = 2011

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) = 0
trigger1 = AnimElem = 23||animelem = 24||animelem=71||animelem=72||animelem=85||animelem=86
attr = S, NA
damage = 27
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 15, 16
sparkno = S6005
guard.sparkno     = -1
sparkxy = 5, -70
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
guard.ctrltime = 0
p2stateno = 2011

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) !=0
trigger1 = AnimElem = 23||animelem = 24||animelem=71||animelem=72||animelem=85||animelem=86
attr = S, NA
damage = 37
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 15, 16
sparkno = S6020
guard.sparkno     = -1
sparkxy = 5, -70
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
guard.ctrltime = 0
p2stateno = 2011

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 190

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) = 0
trigger1 = AnimElem = 31 ||animelem =53
attr = S, NA
damage = 9
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 12, 14
sparkno =  S6001
guard.sparkno     = -1
sparkxy = -10, -52
hitsound = s1, 1
guardsound = s2, 0
ground.type = low
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
p2stateno = 2011

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) != 0
trigger1 = AnimElem = 31 ||animelem =53
attr = S, NA
damage = 19
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 12, 14
sparkno =  S6020
guard.sparkno     = -1
sparkxy = -10, -52
hitsound = s1, 1
guardsound = s2, 0
ground.type = low
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
p2stateno = 2011

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) = 0
trigger1 = AnimElem = 38 ||animelem =46
attr = S, NA
damage = 17
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 14, 16
sparkno = S6003
guard.sparkno     = -1
sparkxy = -14, -65
hitsound = s1, 1
guardsound = s2, 0
ground.type = High
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
p2stateno = 2011

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) != 0
trigger1 = AnimElem = 38 ||animelem =46
attr = S, NA
damage = 27
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 14, 16
sparkno = S6020
guard.sparkno     = -1
sparkxy = -14, -65
hitsound = s1, 1
guardsound = s2, 0
ground.type = High
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0
ground.cornerpush.veloff = 0
air.type = High
air.velocity = 0
air.hittime = 0
p2stateno = 2011

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) = 0
trigger1 = AnimElem = 61||animelem=62
attr = S, NA
damage = 25
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s1,4
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
p2stateno = 2011

[State 200]
type = HitDef
triggerall = fvar(1) != 100 && var(9) != 0
trigger1 = AnimElem = 61||animelem=62
attr = S, NA
damage = 35
getpower = -10
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6020
guard.sparkno     = -1
sparkxy = 5, -50
hitsound = s1,4
guardsound = s2, 1
ground.type = High
ground.slidetime = 0;29
ground.hittime  = 0;29
ground.velocity = 0;-11 -ceil(HitCount*0.25)
ground.cornerpush.veloff = 0;-11 -ceil(HitCount*0.25)
air.type = High
air.velocity =0; -8 -ceil(HitCount*0.25),-3
air.hittime = 18
p2stateno = 2011

[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power<=200
value = 1365
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power>200 &&power<=500
value = 1367
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power>500&&power<=750
value = 1800
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power>750&&power<=999
value = 1899
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power>999&&power<1250
value = 3499
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power>=1250
value = 2900
ctrl = 1
;---------------------------------------------------------------------

[Statedef 2900]
type     = S
movetype = A
physics  = N
juggle   = 10
velset   = 0,0
ctrl     = 0
anim     = 2000
poweradd = 0
sprpriority = 2
hitcountpersist = 1

;---------------------------------------------------------------------------

[State 240]
type = Explod
trigger1 = time = 6
anim = 6100
ID = 6100
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = 1
scale = 3,3
sprpriority = -7

[state -2]
type = SuperPause
trigger1 = time = 6
time = 30
anim = S6101
sound = S100,0
pos = -52,-38
movetime = 0
darken = 0
p2defmul = 1
poweradd = -1000
unhittable = 1

[state -2]
type = BGPalFX
trigger1 = time = 6
time = 110
add = 30,30,30
mul = 64,64,256

[state -2]
type =BGPalFX
trigger1 = time >= 60
time = 1
add = 20-(time-60),20-(time-60),20-(time-60)
mul = 64+(time-60)*15,64+(time-60)*15,256

;---------------------------------------------------------------------------

[State 240]
type = PlaySnd
trigger1 = AnimElem = 7
value =0,4

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = -8

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 7
attr = S, NA
damage = 75,  50
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 15, 16
sparkno = S6005
guard.sparkno     = -1
sparkxy = 5, -70
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 100
ground.hittime  = 100
ground.velocity = -6 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -35 -ceil(HitCount*0.25)
air.type = High
air.velocity = -4 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.ctrltime = 20
guard.dist = 120
p1stateno = 2901
p2stateno = 2910
ID = 2000
kill = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 190

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------

[Statedef 2901]
type     = S
movetype = A
physics  = N
juggle   = 0
velset   = 0,0
ctrl     = 0
anim = 2001
poweradd = 0
sprpriority = 2
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = time = 0
persistent = 0
ignorehitpause = 1
fvar(1) = -3-HitCount

[state -2]
type = BGPalFX
trigger1 = time = 0
time = 130
add = 30,30,30
mul = 64,64,256

[state -2]
type = BGPalFX
trigger1 = time >= 130
time = 1
add = 30-(time-130),30-(time-130),30-(time-130)
mul = 64+(time-130)*16,64+(time-130)*16,256

[State 200]
type = Helper
trigger1 = time >= 20 && time < 80 && time%12=0
pos = -60,-300
helpertype = Normal
name = "ice"
postype       = p2
ID = 2002
stateNo = 2902
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200]
type = Helper
trigger1 = time = 31
pos = 0,0
helpertype = Normal
name = "ice"
postype       = p2
ID = 2003
stateNo = 2903
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = PlaySnd
trigger1 = time = 45
value =3,0

[state -2]
type = varSet
trigger1 = time = 107
var(20) = 1

[state -2]
type = varSet
trigger1 = time = 108
var(20) = 0

[State 240]
type = targetLifeAdd
trigger1 = (Time = 110)
value = Floor(-275*0.01*(100-fvar(1)))
kill = 1
persistent=0


[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power>=1000
value = 3499
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power>=750 && power<1000
value = 1800
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power>=500 &&power<749
value = 1899
ctrl = 1

[State 240]
type = ChangeState
trigger1 = animtime >= 0 && power<500
value = 1367
ctrl = 1
;---------------------------------------------------------------------------


[Statedef 2902]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = ifelse(random%2=0,6007,6008)
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240]
type = Varset
trigger1 = time = 0
var(40) = (random%60)

[State 6000]
type = posadd
trigger1 = time = 0
x = random%120
y = -random%60

[State 6000]
type = Velset
trigger1 = pos Y < -20-var(40)
y = 40

[State 6000]
type = Velset
trigger1 = pos Y >= -20-var(40)
y = 0

[State 240]
type = Varset
trigger1 = time = 0
var(45) = ifelse(anim=6007,-25-random%25,-69-random%25)

[State 240]
type = AngleDraw
trigger1 = 1
value = var(45)
scale = 1,1

[State 200]
type = DestroySelf
trigger1 = time = 240
trigger2 = root,var(20)=1

;---------------------------------------------------------------------------


[Statedef 2903]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6009
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = PlaySnd
trigger1 = time = 0
value =3,1

[State 240]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 200]
type = Helper
trigger1 = time = 24
pos = 0,0
helpertype = Normal
name = "ice"
postype       = p2
ID = 2004
stateNo = 2904
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = ChangeAnim
trigger1 = time = 66
value = 6015
elem = 1

[State 240]
type = AngleDraw
trigger1 = 1
scale = 2.25,2.25

[State 200]
type = DestroySelf
trigger1 = animtime = 0 && anim = 6015

;---------------------------------------------------------------------------


[Statedef 2904]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6010
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = Trans
trigger1 = time < 108
trans = addalpha
alpha = 256,256

[State 240]
type = Trans
trigger1 = time >= 108
trans = addalpha
alpha = 256-(time-108)*24,256

[State 240]
type = PlaySnd
trigger1 = time = 0
value =3,2

[State 240]
type = ChangeAnim
trigger1 = time = 12
value = 6011
elem = 1

[State 240]
type = PlaySnd
trigger1 = time = 12
value =3,1

[State 240]
type = ChangeAnim
trigger1 = time = 24
value = 6012
elem = 1

[State 240]
type = PlaySnd
trigger1 = time = 24
value =3,2

[State 240]
type = ChangeAnim
trigger1 = time = 48
value = 6014
elem = 1

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240]
type = AngleDraw
trigger1 = time < 48
scale = 2,2

[State 240]
type = AngleDraw
trigger1 = time = 48
scale = 0.85,0.85

[State 240]
type = AngleDraw
trigger1 = time = 49
scale = 0.95,0.95

[State 240]
type = AngleDraw
trigger1 = time = 50
scale = 1.05,1.05

[State 240]
type = AngleDraw
trigger1 = time >= 51
scale = 1.15,1.3

[State 240]
type = PlaySnd
trigger1 = time = 48
value =3,4

[State 240]
type = PlaySnd
trigger1 = time = 48
value =3,5

[State 240]
type = Explod
trigger1 = time >= 51 && time%9 = 0
anim = 6016
ID = 6016
pos = 0,-150
random = 80, 150
vel = 0,0.5
postype = P1
facing = 1
bindtime = 1
removetime = 60
scale = 1,1
sprpriority = 1

[State 200]
type = DestroySelf
trigger1 = time = 120

;---------------------------------------------------------------------------

[Statedef 2910]
type     = A
movetype = H
physics  = S
ctrl     = 0
sprpriority = 0

[State 240]
type = PlayerPush
trigger1 = 1
value = 0

[State 240]
type = Changeanim
trigger1 = 1
value = 5000
elem = 1

[State 240]
type = PosSet
trigger1 = time = 0
y = 0

[State 200]
type = VelSet
trigger1 = time = 0
x = 0;-14
y = 0

[State 200]
type = velSet
trigger1 = (Time > 120)
x = 0
y = 0;-10

[State 803]
type = SelfState
trigger1 = (Time > 220)
value = 5050
ctrl = 0

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;charging stasis sword
[Statedef 3000]
type     = S
movetype = A
physics  = N
juggle   = 10
velset   = 0,0
ctrl     = 0
anim     = 1002
poweradd = 0
sprpriority = 2
hitcountpersist = 1

;---------------------------------------------------------------------------

[State 240]
type = Explod
trigger1 = time = 6
anim = 6100
ID = 6100
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = 1
scale = 3,3
sprpriority = -7

[State -2, Burst]
type = Explod
trigger1 = Animelem = 3
stateno= 3001
anim = 6666
postype = p1
pos = -25, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7

[state -2]
type = SuperPause
trigger1 = time = 6
time = 30
anim = S6101
sound = S100,0
pos = -57,-38
movetime = 0
darken = 0
p2defmul = 1
poweradd = -1000
unhittable = 1

[state -2]
type = BGPalFX
trigger1 = time = 6
time = 110
add = 30,30,30
mul = 64,64,256

[state -2]
type =BGPalFX
trigger1 = time >= 60
time = 1
add = 20-(time-60),20-(time-60),20-(time-60)
mul = 64+(time-60)*15,64+(time-60)*15,256


;---------------------------------------------------------------------------


[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = -17

[State 200]
type = Helper
trigger1 = time = 0
pos = -55,-44
helpertype = Normal
name = "dengeki"
postype       = p1
ID = 1003
stateNo = 3013
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
stateNo = 3014
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = PlaySnd
trigger1 = time = 4
value = 4,1


[State 6000]
type = Velset
trigger1 = time = 22
x = 36

[State 6000]
type = Veladd
trigger1 = time >= 22 && vel X > 0
x = -1

[State 240]
type = PlaySnd
trigger1 = AnimElem = 4
value = 0,9

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 &&var(9)=0
trigger2 = AnimElem = 5 &&var(9)=0
trigger3 = AnimElem = 6 &&var(9)=0
trigger4 = AnimElem = 7 &&var(9)=0
trigger5 = AnimElem = 8 &&var(9)=0
trigger5 = AnimElem = 9 &&var(9)=0
attr = S, NA
damage = 110,  35
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
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
p1stateno = 3001
p2stateno = 2010
ID = 3000
kill = 0

[State 200, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 &&var(9)!=0
trigger2 = AnimElem = 5 &&var(9)!=0
trigger3 = AnimElem = 6 &&var(9)!=0
trigger4 = AnimElem = 7 &&var(9)!=0
trigger5 = AnimElem = 8 &&var(9)!=0
trigger5 = AnimElem = 9 &&var(9)!=0
attr = S, NA
damage = 210,  35
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 19, 19
sparkno = S6006
guard.sparkno     = -1
sparkxy = 5, -50
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
p1stateno = 3001
p2stateno = 2010
ID = 3000
kill = 0

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 480

[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------

[Statedef 3001]
type     = S
movetype = A
physics  = N
juggle   = 0
velset   = 0,0
ctrl     = 0
anim = 2001
poweradd = -1000
sprpriority = 2
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = time = 0
persistent = 0
ignorehitpause = 1
fvar(1) = -3-HitCount

[state -2]
type = BGPalFX
trigger1 = time = 0
time = 130
add = 30,30,30
mul = 64,64,256

[state -2]
type = BGPalFX
trigger1 = time >= 130
time = 1
add = 30-(time-130),30-(time-130),30-(time-130)
mul = 64+(time-130)*16,64+(time-130)*16,256

[State 200]
type = Helper
trigger1 = time >= 20 && time < 80 && time%12=0
pos = -60,-300
helpertype = Normal
name = "ice"
postype       = p2
ID = 2002
stateNo = 3002
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 200]
type = Helper
trigger1 = time = 31
pos = 0,0
helpertype = Normal
name = "ice"
postype       = p2
ID = 2003
stateNo = 3003
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = PlaySnd
trigger1 = time = 45
value =3,0

[state -2]
type = varSet
trigger1 = time = 107
var(20) = 1

[state -2]
type = varSet
trigger1 = time = 108
var(20) = 0

[State 240]
type = targetLifeAdd
trigger1 = (Time = 110)
value = Floor(-275*0.01*(100-fvar(1)))
kill = 1
persistent=0


[State 240]
type = ChangeState
trigger1 = animtime >= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------


[Statedef 3002]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = ifelse(random%2=0,6007,6008)
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240, ]
type = Varset
trigger1 = time = 0
var(40) = (random%60)

[State 6000]
type = posadd
trigger1 = time = 0
x = random%120
y = -random%60

[State 6000]
type = Velset
trigger1 = pos Y < -20-var(40)
y = 40

[State 6000]
type = Velset
trigger1 = pos Y >= -20-var(40)
y = 0

[State 240]
type = Varset
trigger1 = time = 0
var(45) = ifelse(anim=6007,-25-random%25,-69-random%25)

[State 240]
type = AngleDraw
trigger1 = 1
value = var(45)
scale = 1,1

[State 200]
type = DestroySelf
trigger1 = time = 240
trigger2 = root,var(20)=1

;---------------------------------------------------------------------------


[Statedef 3003]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6009
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = PlaySnd
trigger1 = time = 0
value =3,1

[State 240]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 200]
type = Helper
trigger1 = time = 24
pos = 0,0
helpertype = Normal
name = "ice"
postype       = p2
ID = 2004
stateNo = 3004
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 240]
type = ChangeAnim
trigger1 = time = 66
value = 6015
elem = 1

[State 240]
type = AngleDraw
trigger1 = 1
scale = 2.25,2.25

[State 200]
type = DestroySelf
trigger1 = animtime = 0 && anim = 6015

;---------------------------------------------------------------------------


[Statedef 3004]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6010
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = Trans
trigger1 = time < 108
trans = addalpha
alpha = 256,256

[State 240]
type = Trans
trigger1 = time >= 108
trans = addalpha
alpha = 256-(time-108)*24,256

[State 240]
type = PlaySnd
trigger1 = time = 0
value =3,2

[State 240]
type = ChangeAnim
trigger1 = time = 12
value = 6011
elem = 1

[State 240]
type = PlaySnd
trigger1 = time = 12
value =3,1

[State 240]
type = ChangeAnim
trigger1 = time = 24
value = 6012
elem = 1

[State 240]
type = PlaySnd
trigger1 = time = 24
value =3,2

[State 240]
type = ChangeAnim
trigger1 = time = 48
value = 6014
elem = 1

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240]
type = AngleDraw
trigger1 = time < 48
scale = 2,2

[State 240]
type = AngleDraw
trigger1 = time = 48
scale = 0.85,0.85

[State 240]
type = AngleDraw
trigger1 = time = 49
scale = 0.95,0.95

[State 240]
type = AngleDraw
trigger1 = time = 50
scale = 1.05,1.05

[State 240]
type = AngleDraw
trigger1 = time >= 51
scale = 1.15,1.3

[State 240]
type = PlaySnd
trigger1 = time = 48
value =3,4

[State 240]
type = PlaySnd
trigger1 = time = 48
value =3,5

[State 240]
type = Explod
trigger1 = time >= 51 && time%9 = 0
anim = 6016
ID = 6016
pos = 0,-150
random = 80, 150
vel = 0,0.5
postype = P1
facing = 1
bindtime = 1
removetime = 60
scale = 1,1
sprpriority = 1

[State 200]
type = DestroySelf
trigger1 = time = 120

;---------------------------------------------------------------------------


[Statedef 3013]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6020
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1
pos = -55,-39

[State 240]
type = Trans
trigger1 = time < 8
trans = addalpha
alpha = time*30,256

[State 240]
type = Trans
trigger1 = time >= 8
trans = addalpha
alpha = 256,256

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240]
type = AngleDraw
trigger1 = 1
scale = 1.25,1.25
value = 30

[State 200]
type = DestroySelf
trigger1 = root,stateno = 3000 || root,stateno = 2799 || root,stateno = 2700 || root,stateno=2701 ||root,stateno=2702
trigger1 = root,animelem = 3
trigger2 = root,Movetype = H

;---------------------------------------------------------------------------


[Statedef 3014]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6020
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1
pos = 110,-63

[State 240]
type = Trans
trigger1 = time <= 8
trans = addalpha
alpha = 256,256

[State 240]
type = Trans
trigger1 = time >= 8
trans = addalpha
alpha = 256-(time-8)*60,256

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn

[State 240]
type = AngleDraw
trigger1 = 1
scale = 1.25,1.25
value = 180

[State 200]
type = DestroySelf
trigger1 = time = 12
trigger2 = root,Movetype = H

;---------------------------------------------------------------------

;tripleairblade
[Statedef 3700]
type = S
movetype = A
physics = S
juggle = 4
ctrl = 0
anim = 610
poweradd = -1000
velset=-5,-3

[State 240]
type = Explod
trigger1 = time = 6
anim = 6100
ID = 6100
pos = 0,0
postype = P1
facing = 1
bindtime = 1
removetime = 1
scale = 3,3
sprpriority = -7

[state -2]
type = SuperPause
trigger1 = time = 6
time = 30
anim = S6101
sound = S100,0
pos = -17,-25
movetime = 0
darken = 0
p2defmul = 1
unhittable = 1

[state -2]
type = BGPalFX
trigger1 = time = 6
time = 110
add = 30,30,30
mul = 64,64,256

[state -2]
type =BGPalFX
trigger1 = time >= 60
time = 1
add = 20-(time-60),20-(time-60),20-(time-60)
mul = 64+(time-60)*15,64+(time-60)*15,256

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3||animelem=4||animelem=5
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

[State 0, Helper]
type = Helper
trigger1 = animelem=5
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

[State 0, Helper]
type = Helper
trigger1 = animelem=4
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
var(10)=42

[State 0, VarAdd]
type = VarAdd
trigger1 = time=0
v = 2
value = 150

[State 1050, ChangeState]
type = ChangeState
trigger1= AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------
;lightning armor
[statedef 50000]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 181
velset = 0,0
poweradd = -1000

[State 0, Helper]
type = helper
trigger1 = time = 56
helpertype = normal ;player
name = "bolt"
id= 8260
stateno = 8260
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1200,***]
type = helper
trigger1=time=44
name = "lightning33"
id = 1425
pos = 0,0
postype = p1
stateno = 1425
helpertype = normal
ownpal = 1
keyctrl = 0
supermovetime =999
pausemovetime =999


[State 200]
type = helper
trigger1 = time = 60
pos = 0,0
helpertype = Normal
name = "lightningarmor"
postype       = p1
ID = 6022
stateNo = 6022
ownpal = 1
supermovetime = 0
pausemovetime = 0


[State 240]
type = PlaySnd
trigger1 = time = 56
value = 1320,0

[State 0, VarSet]
type = Varadd
trigger1 = time=1
var(9) = 1000


[State 0, ChangeState]
type = ChangeState
trigger1 = time = 160
value = 0
ctrl = 1
;anim =
;ignorehitpause =
;persistent =

;-------------------------------------------------------------------
;bolt effect
[statedef 8260]
type = S
anim = 1460
ctrl = 0
sprpriority = 4

[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1
pos = 0,-100

[State 1000,***]
type = AssertSpecial
trigger1 =1
flag = noshadow
flag2 = unguardable

[State 3000,5]
type = hitdef
trigger1 =animelem=1||animelem=2||animelem=3
attr = S, HP
animtype =hard
damage = 20,2
guardflag =MA
hitflag=MADF
pausetime =0,0
getpower =0
sparkno =-1
sparkxy =0,0
hitsound = -1
id=8260
ground.type = High
ground.slidetime = 11
ground.hittime  = 20
ground.velocity = -4,0
air.velocity = -4,-3
fall.recover=0
air.fall=1
palfx.time =20
palfx.sinadd =80,80,0,5
palfx.add = 160,160,0
palfx.invertall =1

[State 240]
type = PlaySnd
trigger1 = animelem = 1 ||animtime = 0
value = 1320,0
volume = -50
freqmul = 1.4



[State 0, DestroySelf]
type = DestroySelf
trigger1 =root,var(9)=0




;--------------------------------------------------------------------
;lightningarmor
[Statedef 6022]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd = 0
anim = 6022
ctrl = 0
hitdefpersist = 1
sprpriority = 3

[State 240]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1
pos = 0,-30

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1 ||animtime = 0
value = S4,1
freqmul = 1.1


[State 240]
type = Trans
trigger1 = time < 8
trans = addalpha
alpha = time*30,256

[State 240]
type = Trans
trigger1 = time >= 8
trans = addalpha
alpha = 256,256

[State 240]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = noautoturn
flag3 = unguardable

[State 240, ]
type = AngleDraw
trigger1 = 1
scale = 1.75,1.75
value = 90


[State 0, HitDef]
type = hitdef
trigger1=animelem=1||animelem=4||animelem=7||animelem=10||animelem=13||animelem=16

attr = S,SA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = light         ;light,medium,hard,back,up,diagup
air.animtype = light
;fall.animtype = Back
priority = 4,Hit
damage = 2,1
pausetime = 2 ,0
guard.pausetime = 2,0
sparkno = -1
guard.sparkno = S6022
sparkxy = 0,-30
hitsound = S4,1
guardsound = S4,1
ground.type = High      ;Low,Trip,None
air.type = High
ground.slidetime = 0
guard.slidetime = 3
ground.hittime = 20
guard.hittime = 5
air.hittime = 20
ground.velocity = -3,0
guard.velocity = -5
air.velocity = 3,-3
airguard.velocity = 3,-4
sprpriority = 1
p1getp2facing = 0
fall = 0
fall.yvelocity = -4.5
fall.recover = 1
fall.recovertime = 4
fall.damage = 0
down.bounce = 0
id = 6022
chainID = -1
nochainID = -1
hitonce = 1
kill = 1
guard.kill = 1
fall.kill = 1
numhits = 1
getpower = 0,0
givepower = 10,5
palfx.time = 0
envshake.time = 0
fall.envshake.time = 0
ground.cornerpush.veloff = 3
air.cornerpush.veloff = 3
down.cornerpush.veloff = 3
guard.cornerpush.veloff = 3
airguard.cornerpush.veloff = 3





[State 0, DestroySelf]
type = DestroySelf
trigger1 = root,var(9)=0
