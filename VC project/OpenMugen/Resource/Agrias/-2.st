
[Statedef -2]

;-----------------------------------------
[state -2]
type = DisplayToClipboard
trigger1 = 1
;trigger1 = roundstate>0
text = "var(1)=%d,var(2)=%d,var(5)=%d,var(9)=%d,var(10)=%d"
params = var(1),var(2),var(5),var(9),var(10)
;text = "NumHelper=%d,palno=%d,fvar(5)=%d,var(2)=%d,var(5)=%d,var(9)=%d"
;params = NumHelper,palno,fvar(5),var(2),var(5),var(9)
;text = "P2 Distance X from P1 %f"
;params = P2BodyDist X
;-----------------------------------------

;config

;-----------------------------------------



;-----------------------------------------

[state -2]
type = varset
trigger1 = fvar(1) < 0
fvar(1) = 0

[state -2]
type = varset
trigger1 = fvar(1) > 100
fvar(1) = 100

[State -2]
type = Varadd
trigger1 = (GameTime%2) = 0 && var(2) != 0
var(2) = -1
persistent = 0

[state -2]
type = varset
trigger1 = var(1) < 0
var(1) = 0

[state -2]
type = varset
trigger1 = var(2) < 0
var(2) = 0

[State 50000 ]
type = Varadd
trigger1 = (GameTime%3) = 0 && var(9) != 0
var(9) = -1
persistent = 0

[state -2]
type = varset
trigger1 = var(9) < 0
var(9) = 0

[State 50000 ]
type = Varadd
trigger1 = (GameTime%40) = 0 && var(10) != 0
var(10) = -1
persistent = 0

[state -2]
type = varset
trigger1 = var(10) < 0
var(10) = 0

[State -2]
type = VarSet
triggerall = !ishelper
trigger1 = (P2movetype != H) || (enemynear,stateno = [120,155]) || (enemynear,stateno = [5200,5210])&&(enemynear,ctrl = 1)
v = 28
value = 1

[State -2]
type = VarSet
triggerall = !ishelper
trigger1 = (P2movetype != H) || (enemynear,stateno = [120,155]) || (enemynear,stateno = [5200,5210])&&(enemynear,ctrl = 1)
v = 29
value = 0

[State -2]
type = VarSet
triggerall = !ishelper
trigger1 = (P2movetype != H) || (enemynear,stateno = [120,155]) || (enemynear,stateno = [5200,5210])&&(enemynear,ctrl = 1)
fv = 10
value = 1

[state -2]
type = AttackMulSet
trigger1 = 1
value = 0.01*(100-fvar(1))

[state -2]
type = varset
trigger1 = Numtarget = 0
trigger1 = P2MoveType != H
trigger2 = palno = 12
fvar(1) = 0

;-----------------------------------------

[state -2]
type = RemoveExplod
trigger1 = movetype = H

;-----------------------------------------


[State -2]
type = varAdd
trigger1 = (GameTime%3) = 0 && var(5) != 0
var(5) = -1
persistent = 0

[State -2]
type = LifeAdd
triggerall = movetype != H
triggerall = Alive
trigger1 = time%5 = 0
trigger1 = var(5) != 0
value = 1

[State -2]
type = varSet
trigger1 = var(5) < 1
var(5) = 0

;-----------------------------------------




;[State -2]
;type = LifeAdd
;triggerall = movetype != H
;trigger1 = Alive
;trigger1 = palno >= 10
;trigger1 = power != powermax
;trigger1 = time%4 = 0
;value = 1 - ifelse(palno=11,1,0)

;[State -2]
;type = PowerAdd
;trigger1 = palno >= 10
;trigger1 = power != powermax
;value = 10 - ifelse(palno=10,7,0)

;[State -2]
;type = Helper
;triggerall = palno = 12
;trigger1 = stateno = 2041 && random%30=0
;pos = -40,0
;helpertype = Normal
;name = "Knife"
;postype       = back
;ID = 2001
;stateNo = 2001
;facing = 1
;ownpal = 1
;supermovetime = 9999
;pausemovetime = 9999

;-----------------------------------------

