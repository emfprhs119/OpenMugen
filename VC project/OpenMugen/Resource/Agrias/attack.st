;--------------------------------------------------------------------


[Statedef 200]
type    = S
movetype= A
physics = S
juggle  = 2
velset = 0,0
ctrl = 0
anim = 200
poweradd = 0
sprpriority = 2
facep2 = 1
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 6.5

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 2

[State 200]
type = PlaySnd
trigger1 = AnimElem = 2
value = s0, 6

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 2 && var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 23, 1
getpower = 23*3
animtype = Light
guardflag = MA
hitflag = MAF
priority = 2, Hit
pausetime = 8, 11
sparkno = S6000
guard.sparkno     = -1
sparkxy = -10, -85
hitsound = s1, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 5
ground.velocity = -4.5 -ceil(HitCount*0.75)
ground.cornerpush.veloff = -4.5 -ceil(HitCount*0.75)
ground.hittime = 7
air.hittime = 9
air.type = High
air.velocity = -3.5 -ceil(HitCount*0.75),0.4

[State 200, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 2 && var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 25, 5
getpower = 2
animtype = Light
guardflag = MA
hitflag = MAF
priority = 2, Hit
pausetime = 8, 11
sparkno = S6020
guard.sparkno     = -1
sparkxy = -10, -85
hitsound = s1, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 5
ground.velocity = -4.5 -ceil(HitCount*0.75)
ground.cornerpush.veloff = -4.5 -ceil(HitCount*0.75)
ground.hittime = 7
air.hittime = 9
air.type = High
air.velocity = -3.5 -ceil(HitCount*0.75),0.4

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 70

[State 200, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------


[Statedef 205]
type    = S
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 205
poweradd = 0
sprpriority = 2
facep2 = 1
hitcountpersist = 1

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
var(1) = 3

[State 200]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0, 5

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 2&&var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 39,  1
getpower = 39*3
animtype = medium
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
ground.slidetime = 14
ground.hittime  = 15
ground.velocity = -5 -ceil(HitCount*0.75)
ground.cornerpush.veloff = -5 -ceil(HitCount*0.75)
air.type = High
air.velocity = -5 -ceil(HitCount*0.75),-1
air.hittime = 15
guard.dist = 100

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 2&&var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 45,  8
getpower = 4
animtype = medium
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
ground.slidetime = 14
ground.hittime  = 15
ground.velocity = -5 -ceil(HitCount*0.75)
ground.cornerpush.veloff = -5 -ceil(HitCount*0.75)
air.type = High
air.velocity = -5 -ceil(HitCount*0.75),-1
air.hittime = 15
guard.dist = 100

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 100

[State 200]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------

;6B
[Statedef 210]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 3,0
ctrl = 0
anim = 210
poweradd = 0
sprpriority = 2
facep2 = 1
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 7.5

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 3

[State 200]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0, 4

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 3&& var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 55,  5
getpower = 55*3
animtype = hard
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
ground.slidetime = 12
ground.hittime  = 18
ground.velocity = -9.5 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -9.5 -ceil(HitCount*0.25)
air.type = High
air.velocity = -6 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120

[State 200, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 3&& var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 63,  14
getpower = 6
animtype = hard
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
ground.slidetime = 12
ground.hittime  = 18
ground.velocity = -9.5 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -9.5 -ceil(HitCount*0.25)
air.type = High
air.velocity = -6 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 120

[State 200]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------

;5C
[Statedef 215]
type    = S
movetype= A
physics = N
juggle  = 1
ctrl = 0
anim = 215
poweradd = 0
sprpriority = 2
facep2 = 1
hitcountpersist = 1

[State 200]
type = veladd
trigger1 = time = 0
x = 2.5

[State 200]
type = veladd
trigger1 = vel X >= 0.2
x = -0.4

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 10

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 4

[State 200]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0, 5

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 3 &&var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 76,  5
getpower = 76*3
animtype = hard
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
ground.slidetime = 10
ground.hittime  = 18
ground.velocity = -6 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -6.5 -ceil(HitCount*0.25)
air.type = High
air.velocity = -4 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 3 &&var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 83, 22
getpower = 8
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 18, 21
sparkno = S6020
guard.sparkno     = -1
sparkxy = 5,-70
hitsound = s1, 3
guardsound = s2, 1
ground.type = High
ground.slidetime = 10
ground.hittime  = 18
ground.velocity = -6 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -6.5 -ceil(HitCount*0.25)
air.type = High
air.velocity = -4 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 110

[State 200]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------

;4C
[Statedef 220]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 220
poweradd = 0
sprpriority = 2
facep2 = 1
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 18

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 4

[State 200]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0, 4

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 3 && var(9)=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 99,  10
getpower = 99*3
animtype = hard
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
ground.slidetime = 10
ground.hittime  = 18
ground.velocity = -8 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -12 -ceil(HitCount*0.25)
air.type = High
air.velocity = -4 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 3 && var(9)!=0
attr = S, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 109,  28
getpower = 12
animtype = hard
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
ground.slidetime = 10
ground.hittime  = 18
ground.velocity = -8 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -12 -ceil(HitCount*0.25)
air.type = High
air.velocity = -4 -ceil(HitCount*0.25),-3
air.hittime = 18
guard.dist = 120

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 150

[State 200]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------

;しゃがみA
[Statedef 400]
type     = C
movetype = A
physics  = C
juggle   = 1
poweradd = 0
ctrl     = 0
anim     = 400
velset   = 0,0
sprpriority = 2
facep2   = 1
hitcountpersist = 1

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
var(1) = 2

[State 200]
type = PlaySnd
trigger1 = AnimElem = 2
value = s0, 6

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 2 &&var(9)=0
attr = C, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 21, 1
getpower = 21*3
animtype = Light
guardflag = L
hitflag = MAF
priority = 2, Hit
pausetime = 7, 9
sparkno = S6000
guard.sparkno     = -1
sparkxy = -20, -5
hitsound = s1, 0
guardsound = s2, 0
ground.type = low
ground.slidetime = 10
ground.velocity = -3.5 -ceil(HitCount*0.75)
ground.cornerpush.veloff = -3.5 -ceil(HitCount*0.75)
ground.hittime = 14
air.hittime = 14
air.type = High
air.velocity = -3.5 -ceil(HitCount*0.75),0.2

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 2 &&var(9)!=0
attr = C, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 25, 5
getpower = 2
animtype = Light
guardflag = L
hitflag = MAF
priority = 2, Hit
pausetime = 7, 9
sparkno = S6020
guard.sparkno     = -1
sparkxy = -20, -5
hitsound = s1, 0
guardsound = s2, 0
ground.type = low
ground.slidetime = 10
ground.velocity = -3.5 -ceil(HitCount*0.75)
ground.cornerpush.veloff = -3.5 -ceil(HitCount*0.75)
ground.hittime = 14
air.hittime = 14
air.type = High
air.velocity = -3.5 -ceil(HitCount*0.75),0.2

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 70

[State 400]
type = ChangeState
trigger1 = AnimTime = 0
value = 11 ;しゃがむステートへ（コモンステート）
ctrl = 1

------------------------------------------------------------------------------------------------



;しゃがみB
[Statedef 405]
type     = C
movetype = A
physics  = C
juggle   = 1
poweradd = 0
ctrl     = 0
anim     = 405
sprpriority = 2
facep2   = 1
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 9

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 3

[State 200]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0, 7

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)=0
attr = C, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 42, 1
getpower = 42*3
animtype = Light
guardflag = L
hitflag = MAF
priority = 2, Hit
pausetime = 9, 12
sparkno = S6001
guard.sparkno     = -1
sparkxy = -7, -7
hitsound = s1, 1
guardsound = s2, 0
ground.type = low
ground.slidetime = 12
ground.velocity = -5 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -5-ceil(HitCount*0.25)
ground.hittime = 18
guard.hittime = 10
guard.ctrltime = 10
air.hittime = 18
air.type = High
air.velocity = -1.4 -ceil(HitCount*0.25),0.2

[State 200]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 4 && var(9)!=0
attr = C, NA ;立ち通常打撃（Standing, Normal Attack）
damage = 55, 14
getpower = 5
animtype = Light
guardflag = L
hitflag = MAF
priority = 2, Hit
pausetime = 9, 12
sparkno = S6020
guard.sparkno     = -1
sparkxy = -7, -7
hitsound = s1, 1
guardsound = s2, 0
ground.type = low
ground.slidetime = 12
ground.velocity = -5 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -5-ceil(HitCount*0.25)
ground.hittime = 18
guard.hittime = 10
guard.ctrltime = 10
air.hittime = 18
air.type = High
air.velocity = -1.4 -ceil(HitCount*0.25),0.2

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 100

[State 400]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

------------------------------------------------------------------------------------------------



;しゃがみC
[Statedef 410]
type     = C
movetype = A
physics  = C
juggle   = 1
poweradd = 0
ctrl     = 0
anim     = 410
sprpriority = 2
facep2   = 1
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 14

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 4

[State 200]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0, 4

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 5  &&var(9)=0
attr              = C, NA ;しゃがみ通常打撃（Crouching, Normal Attack）
damage            = 86, 3
getpower = 86*3
animtype          = Light
guardflag         = L  ;相手はしゃがみガードしか出来ない
hitflag           = MAF
priority          = 3
pausetime         = 18,23
sparkno = S6004
sparkxy           = -10,-5
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = High
ground.slidetime = 10
ground.hittime  = 18
ground.velocity   = -12 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -21-ceil(HitCount*0.25)
guard.hittime = 2
guard.ctrltime = 2
air.hittime    = 18
air.velocity      = -2.5 -ceil(HitCount*0.25),-1
guard.dist = 120

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 5  &&var(9)!=0
attr              = C, NA ;しゃがみ通常打撃（Crouching, Normal Attack）
damage            = 98, 23
getpower = 9
animtype          = Light
guardflag         = L  ;相手はしゃがみガードしか出来ない
hitflag           = MAF
priority          = 3
pausetime         = 18,23
sparkno = S6020
sparkxy           = -10,-5
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = High
ground.slidetime = 10
ground.hittime  = 18
ground.velocity   = -12 -ceil(HitCount*0.25)
ground.cornerpush.veloff = -21-ceil(HitCount*0.25)
guard.hittime = 2
guard.ctrltime = 2
air.hittime    = 18
air.velocity      = -2.5 -ceil(HitCount*0.25),-1
guard.dist = 120

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 160

[State 400]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

------------------------------------------------------------------------------------------------



;3C
[Statedef 415]
type     = C
movetype = A
physics  = C
juggle   = 1
poweradd = 0
ctrl     = 0
anim     = 415
velset = 4,0
sprpriority = 2
facep2   = 1
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 14

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 4

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = s0, 4

[State 400, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 5  &&var(9)=0
attr              = C, NA ;しゃがみ通常打撃（Crouching, Normal Attack）
damage            = 58, 3
getpower = 58*3
animtype          = Light
guardflag         = L  ;相手はしゃがみガードしか出来ない
hitflag           = MAF
priority          = 3
pausetime         = 17,23
sparkno = S6005
sparkxy           = -10,-50
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = High
ground.slidetime  = 26
ground.hittime    = 35
ground.velocity   = -0.5 -ceil(HitCount*0.25),-8
ground.cornerpush.veloff = -4-ceil(HitCount*0.25)
guard.hittime = 2
guard.ctrltime = 2
air.hittime    = 40
air.velocity      = -2.5 -ceil(HitCount*0.25),-3
guard.dist = 120

[State 400, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 5  &&var(9)!=0
attr              = C, NA ;しゃがみ通常打撃（Crouching, Normal Attack）
damage            = 69, 19
getpower = 7
animtype          = Light
guardflag         = L  ;相手はしゃがみガードしか出来ない
hitflag           = MAF
priority          = 3
pausetime         = 17,23
sparkno = S6020
sparkxy           = -10,-50
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = High
ground.slidetime  = 26
ground.hittime    = 35
ground.velocity   = -0.5 -ceil(HitCount*0.25),-8
ground.cornerpush.veloff = -4-ceil(HitCount*0.25)
guard.hittime = 2
guard.ctrltime = 2
air.hittime    = 40
air.velocity      = -2.5 -ceil(HitCount*0.25),-3
guard.dist = 120

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 110

[State 400, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11 ;しゃがむステートへ（コモンステート）
ctrl = 1


------------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------



;jump attack a
[Statedef 600]
type     = A
movetype = A
physics  = A
juggle   = 2
poweradd = 0
ctrl     = 0
anim     = 600
sprpriority = 2
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 7

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 2

[State 200]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0, 8

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 3 &&var(9)=0
attr              = A, NA ;空中通常打撃（Air, Normal Attack）
damage            = 29, 1
getpower = 29*3
animtype          = Light
guardflag         = HA  
hitflag           = MAF
priority          = 3
pausetime         = 10,10
sparkno           = S6006
sparkxy           = -10,-32
guard.sparkno     = -1
hitsound          = s1,4
guardsound        = s2,0
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
ground.velocity   = -1.6,0
air.velocity      = -1.5,-1.5
ground.cornerpush.veloff = -3-ceil(HitCount*0.75)
airguard.cornerpush.veloff = -3-ceil(HitCount*0.75)

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 3 &&var(9)!=0
attr              = A, NA ;空中通常打撃（Air, Normal Attack）
damage            = 37, 9
getpower = 3
animtype          = Light
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 10,10
sparkno           = S6020
sparkxy           = -10,-32
guard.sparkno     = -1
hitsound          = s1,4
guardsound        = s2,0
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
ground.velocity   = -1.6,0
air.velocity      = -1.5,-1.5
ground.cornerpush.veloff = -3-ceil(HitCount*0.75)
airguard.cornerpush.veloff = -3-ceil(HitCount*0.75)

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 70

[State 400]
type = ChangeState
trigger1 = AnimTime = 0
value = 51 
ctrl = 1


------------------------------------------------------------------------------------------------



;jump attack b
[Statedef 605]
type     = A
movetype = A
physics  = A
juggle   = 4
poweradd = 0
ctrl     = 0
anim     = 605
sprpriority = 2
hitcountpersist = 1

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
var(1) = 3

[State 200]
type = PlaySnd
trigger1 = AnimElem = 5
value = s0, 4

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
air.velocity      = -4,-2.5
ground.cornerpush.veloff = -6-ceil(HitCount*0.75)
airguard.cornerpush.veloff = -6-ceil(HitCount*0.75)

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
air.velocity      = -4,-2.5
ground.cornerpush.veloff = -6-ceil(HitCount*0.75)
airguard.cornerpush.veloff = -6-ceil(HitCount*0.75)

[State 200]
type = AttackDist
trigger1 = 1
value = 90

[State 400]
type = ChangeState
trigger1 = AnimTime = 0
value = 51 
ctrl = 1

------------------------------------------------------------------------------------------------



;jumpattack c
[Statedef 610]
type     = A
movetype = A
physics  = A
juggle   = 5
poweradd = 0
ctrl     = 0
anim     = 610
sprpriority = 2
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 10

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 4

[State 200]
type = PlaySnd
trigger1 = AnimElem = 3
persistent = 0
value = s0, 9

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 4 &&var(9)=0
attr              = A, NA
damage            = 62, 3
getpower = 62*3
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 14,16
sparkno           = S6005
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
ground.velocity   = -1.6,-3
air.velocity      = -2.9,-5
guard.dist = 120

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 4 &&var(9)!=0
attr              = A, NA
damage            = 75, 19
getpower = 7
animtype          = hard
guardflag         = HA
hitflag           = MAF
priority          = 3
pausetime         = 14,16
sparkno           = S6020
sparkxy           = -10,-40
guard.sparkno     = -1
hitsound          = s1,3
guardsound        = s2,1
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
ground.velocity   = -1.6,-3
air.velocity      = -2.9,-5
guard.dist = 120

[State 200, AttackDist]
type = AttackDist
trigger1 = 1
value = 90

[State 400]
type = ChangeState
trigger1 = AnimTime = 0
value = 51 
ctrl = 1

------------------------------------------------------------------------------------------------



;jump attack c
[Statedef 615]
type     = A
movetype = A
physics  = A
juggle   = 5
poweradd = 0
ctrl     = 0
anim     = 615
sprpriority = 2
hitcountpersist = 1

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 6

[state -2]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
var(1) = 4

[state -2]
type = null;veladd
trigger1 = time = 0 && vel X < 2
x = 2

[state -2]
type = velset
trigger1 = time = 0 && vel Y > 0
y = -5.5

[State 200]
type = PlaySnd
trigger1 = AnimElem = 3
persistent = 0
value = s0, 9

[State 400]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 4&&var(9)=0
attr              = A, NA
damage            = 62, 3
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
ground.velocity   = -2,4
air.velocity      = -2,6
guard.dist = 120
fall = 1
fall.recovertime = 60

[State 400, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = animelem = 4&&var(9)!=0
attr              = A, NA
damage            = 73, 18
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
ground.velocity   = -2,4
air.velocity      = -2,6
guard.dist = 120
fall = 1
fall.recovertime = 60

[State 200]
type = AttackDist
trigger1 = 1
value = 100

[State 400]
type = ChangeState
trigger1 = AnimTime = 0
value = 51 
ctrl = 1

;---------------------------------------------------------------------------


[Statedef 800]
type     = S
movetype = A
physics  = S
juggle   = 2
poweradd = 0
ctrl     = 0
anim     = 800
sprpriority = 2
hitcountpersist = 1

[state -2,補正]
type = varadd
trigger1 = movehit
persistent = 0
ignorehitpause = 1
fvar(1) = 7

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = s0, 8

[State 400, ヒット定義]
type = HitDef
triggerall = fvar(1) != 100
trigger1 = AnimElem = 2
attr              = S, NT
damage            = 0, 0
getpower = 80*3
animtype          = Light
guardflag         = 
hitflag           = M
priority          = 3
pausetime         = 10,10
sparkno           = S6000
sparkxy           = -10,-80
guard.sparkno     = -1
hitsound          = s1,0
guardsound        = s2,0
ground.type       = high
ground.slidetime  = 15
ground.hittime    = 15
ground.velocity   = -1.6,0
air.velocity      = -1.5,-1.5
ground.cornerpush.veloff = -3-ceil(HitCount*0.75)
airguard.cornerpush.veloff = -3-ceil(HitCount*0.75)
p1stateno = 805
p2stateno = 810

[State 400, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------


[Statedef 805]
type     = S
movetype = A
physics  = S
juggle   = 2
poweradd = 0
ctrl     = 0
anim     = 810
sprpriority = 2
hitcountpersist = 1

[State 400, ステート変更]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 400, ステート変更]
type = Turn
trigger1 = time = 0

[State 400, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------

[Statedef 810]
type     = A
movetype = H
physics  = N
ctrl     = 0
velset = 0,0
sprpriority = 0

[State 240, ぶつかり判定]
type = PlayerPush
trigger1 = 1
value = 0

[State 240, アニメ変更]
type = Changeanim
trigger1 = time <= 17
value = 5000
elem = 1

[State 240, 場所]
type = PosSet
trigger1 = time = 0
y = 0

[State 240, ダメージ]
type = LifeAdd
trigger1 = (Time = 17)
value = -floor(LifeMax*0.08)
kill = 1
persistent=0

[State 240, アニメ変更]
type = Changeanim
trigger1 = time = 17
value = 5070
elem = 1

[State 200]
type = VelSet
trigger1 = time = 17
x = 4
y = -5

[State 400]
type = Turn
trigger1 = time = 17

[State 200]
type = Veladd
trigger1 = time > 17
y = .25

[State 803]
type = SelfState
trigger1 = pos Y > -2 && time > 20
value = 5100
ctrl = 0

;---------------------------------------------------------------------------



