; The CMD file.

;---------------------------------------------------------------------------
;Artificial Intelligence
;---------------------------------------------------------------------------

;-|-AI-|--------------------------------------------------------------------
[Command]
name = "AI_1"
command = a, x, F, D, a, a, D
time = 1

[Command]
name = "AI_2"
command = a, a, a, a, a, a, b
time = 1

[Command]
name = "AI_3"
command = a, a, b, D, F, b, x
time = 1

[Command]
name = "AI_4"
command = y, a, F, b, B, y, a
time = 1

[Command]
name = "AI_5"
command = a, b, x, y, y, b, b
time = 1

[Command]
name = "AI_6"
command = b, y, y, F, b, B, B
time = 1

[Command]
name = "AI_7"
command = a, y, F, a, x, a, F, b
time = 1

[Command]
name = "AI_8"
command = a, a, b, y, x, B, x
time = 1

[Command]
name = "AI_9"
command = x, x, a, F, F, b, D
time = 1

[Command]
name = "AI_10"
command = x, x, a, F, y, a, a, F
time = 1

[Command]
name = "AI_11"
command = a, b, a, x, a, y, a
time = 1

[Command]
name = "AI_12"
command = b, y, a, F, y, a, x
time = 1

[Command]
name = "AI_13"
command = x, a, y, y, x, B, B
time = 1

[Command]
name = "AI_14"
command = a, F, F, x, B, F, x
time = 1

[Command]
name = "AI_15"
command = y, x, b, b, a, x, y
time = 1

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 20

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 6

;--------------------------------------------------------------------------


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
;[Command]
;name = "Seikou"
;command = ~D, DF, F, D, DF, F, a
;time = 30
;[Command]
;name = "Seikou"
;command = ~D, DF, F, D, DF, F, b
;time = 30
;[Command]
;name = "Seikou"
;command = ~D, DF, F, D, DF, F, c
;time = 30
;[Command]
;name = "Seikou"
;command = D, F, a+b
;time = 30
;[Command]
;name = "Seikou"
;command = D, F, b+c
;time = 30
;[Command]
;name = "Seikou"
;command = D, F, a+c
;time = 30

[Command]
name = "Fudou"
command = ~D, DB, B, D, DB, B, a
time = 30
[Command]
name = "Fudou"
command = ~D, DB, B, D, DB, B, b
time = 30
[Command]
name = "Fudou"
command = ~D, DB, B, D, DB, B, c
time = 30
[Command]
name = "Fudou"
command = D, B, a+b
time = 30
[Command]
name = "Fudou"
command = D, B, b+c
time = 30
[Command]
name = "Fudou"
command = D, B, a+c
time = 30

[command]
name="superblade"
command=~D,F,a+b
time=30

[command]
name="superblade"
command=~D,F,b+c
time=30

[command]
name="superblade"
command=~D,F,a+c
time=30

[command]
name= "supercure"
command= ~D,D,y
time=20

[command]
name= "dengeki combo"
command = ~D,B,F,a
time=20

[command]
name= "charging stasis sword"
command = ~D,B,F,b
time=20

[command]
name= "charging combo stasis sword"
command = ~D,B,F,c
time=20

[command]
name = "lightningarmor"
command = ~a,a,F,c
time = 20

[command]
name = "tripleairblade"
command = ~D,F,a+b
time = 15

[command]
name = "tripleairblade"
command = ~D,F,b+c
time = 15

[command]
name = "tripleairblade"
command = ~D,F,a+c
time = 15

[command]
name = "superlightningblade"
command = ~D,F,b+y
time = 15

[command]
name = "superlightning"
command = ~D,F,B,y
time = 15

[command]
name = "lightningblade"
command = ~D,F,B,c
time = 15

[command]
name = "crushsword"
command = ~D,F,B,b
time = 15

[command]
name = "spellblade"
command = ~D,F,B,a
time = 15

;-| Special Motions |------------------------------------------------------

[command]
name = "shoryukena"
command = ~F,D,DF,a
time = 20

[command]
name = "shoryukenb"
command = ~F,D,DF,b
time = 20

[command]
name = "shoryukenc"
command = ~F,D,DF,c
time = 20
[command]
name = "3xhadouken1"
command = ~B,D,F,a
time = 20

[command]
name = "3xhadouken2"
command = ~B,D,F,b
time = 20

[command]
name = "3xhadouken3"
command = ~B,D,F,c
time = 20

[Command]
name = "blade-a"
command = ~D, F, a

[Command]
name = "blade-b"
command = ~D, F, b

[Command]
name = "blade-c"
command = ~D, F, c

[Command]
name = "airblade-a"
command = ~D, F, a

[Command]
name = "airblade-b"
command = ~D, F, b

[Command]
name = "airblade-c"
command = ~D, F, c

[Command]
name = "dengeki-a"
command = ~D, B, a

[Command]
name = "dengeki-b"
command = ~D, B, b

[Command]
name = "dengeki-c"
command = ~D, B, c

[Command]
name = "cure"
command = ~D, D, a

[Command]
name = "cure"
command = ~D, D, b

[Command]
name = "cure"
command = ~D, D, c

[Command]
name = "hold_z"
command = /z
time = 1



[command]
name = "hadouken1"
command = ~B,F,a
time = 15

[command]
name = "hadouken2"
command = ~B,F,b
time = 15

[command]
name = "hadouken3"
command = ~B,F,c
time = 15

[Command]
name = "sonic1"
command = ~D,B, a

[Command]
name = "sonic2"
command = ~D,B, b

[Command]
name = "sonic3"
command = ~D,B, c



[command]
name = "two inch1"
command = ~F,B,a
time = 20

[command]
name = "two inch2"
command = ~F,B,b
time = 20

[command]
name = "two inch3"
command = ~F,B,c
time = 20





;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = a+b
time = 1

[Command]
name = "throw";Required (do not remove)
command = a+b
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
[Statedef -1]
;---------------------------------------------------------------------------
;Artificial Intelligence
;---------------------------------------------------------------------------

;--|-AI Defense-|-----------------------------------------------------------



;-|-AI Super Attempt-|----------------------------------------------
[State -1,AIteleportback]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall =  (movetype=H)&&(p2movetype=A)&&((stateno=[5000,5011])||(stateno=[120,131])||(stateno=[140,153])) && (random <=500); [400,500])
trigger1 = (p2bodydist x <= 75) && (prevstateno != 5120) && (p2movetype != H)
value = 1430

[State -1,AIteleportfoward]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall =  (movetype=H)&&(p2movetype=A)&&((stateno=[5000,5011])||(stateno=[120,131])||(stateno=[140,153])) && (random <=500); [400,500])
trigger1 = (p2bodydist x <= 75) && (prevstateno != 5120) && (p2movetype != H)
value = 1432

[State -1,AIairteleportback]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall =  (movetype=H)&&(p2movetype=A)&&((stateno=[5020,5050])||(stateno=132)||(stateno=[154,155])) && (random <=500); [400,500])
trigger1 = (p2bodydist x <= 75) && (prevstateno != 5120) && (p2movetype != H)
value = 1440

[State -1,AIairteleportforward]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall =  (movetype=H)&&(p2movetype=A)&&((stateno=[5020,5050])||(stateno=132)||(stateno=[154,155])) && (random <=500); [400,500])
trigger1 = (p2bodydist x <= 75) && (prevstateno != 5120) && (p2movetype != H)
value = 1442

[State -1,ai dengeki1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype != A)
trigger1 = (stateno=[200,415])&&(movecontact) && (random = [0,400])
trigger2 = (p2bodydist x <= 45) && (prevstateno != 5120) && (p2movetype != H) && (random = [0,333])
value = 1000

[State -1,ai dengeki2]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype != A)
trigger1 = (stateno=[200,415])&&(movecontact) && (random = [0,400])
trigger2 = (p2bodydist x <= 65) && (prevstateno != 5120) && (p2movetype != H) && (random = [0,333])
value = 1001

[State -1,ai dengeki3]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype != A)
trigger1 = (stateno=[200,415])&&(movecontact) && (random = [0,400])
trigger2 = (p2bodydist x <= 85) && (prevstateno != 5120) && (p2movetype != H) && (random = [0,333])
value = 1002

[State -1,ai blade1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype != A)
trigger1 = (p2bodydist x < 60) && (prevstateno != 5120) && (p2movetype != H) && (random = [0,333])
trigger2 = (stateno=[200,415]) && (movecontact) && (random = [0,433])
value = 1100

[State -1,ai blade2]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype != A)
trigger1 = (p2bodydist x >= 65) &&(p2bodydist x < 90) && (prevstateno != 5120) && (p2movetype != H) && (random = [0,333])
trigger2 = (stateno=[200,415]) && (movecontact) && (random = [0,433])
value = 1101

[State -1,ai blade3]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (statetype != A)
trigger1 = (p2bodydist x >= 90)&&(p2bodydist x <= 120) && (prevstateno != 5120) && (p2movetype != H) && (random = [0,333])
trigger2 = (stateno=[200,415]) && (movecontact) && (random = [0,433])
value = 1102

[State -1,ai cure]
type = ChangeState
triggerall = (roundstate = 2)&&(var(59) != 0)&&(var(9)=0)&&(var(5)=0) && (life>=lifemax/2)&& (random = [0,400])&&(power>=250)
triggerall = (Ctrl) && (Statetype = S)
trigger1 = (p2bodydist x >= 125) && (prevstateno != 5120) && (p2movetype != A) && (statetype != A)
value = 1150

[State -1,ai supercure]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)&&(var(9)=0)&&(var(5)=0) && (life<=lifemax/2)&& (random = [0,400])&&(power>=750)
triggerall = (Ctrl) && (Statetype = S)
trigger1 = (p2bodydist x >= 125) && (prevstateno != 5120) && (p2movetype != A) && (statetype != A)
value = 2200

[State -1,ai twoinch1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0) && (power>=500)&& (var(9)=0)&&(var(2)=0)
triggerall = (Ctrl) && (Statetype = S) && (random = [0,500])
trigger1 = (prevstateno != 5120) && (p2movetype != H) && (statetype != A)
value = 1300

[State -1,ai twoinch2]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0) && (power>=650)&& (var(9)=0)&&(var(2)=0)
triggerall = (Ctrl) && (Statetype = S) && (random = [0,450])
trigger1 = (prevstateno != 5120) && (p2movetype != H) && (statetype != A)
value = 1301

[State -1,ai twoinch3]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0) && (power>=800) && (var(9)=0)&&(var(2)=0)
triggerall = (Ctrl) && (Statetype = S) && (random = [0,400])
trigger1 = (prevstateno != 5120) && (p2movetype != H) && (statetype != A)
value = 1302

[State -1,ai sho1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype = S) && (random = [300,500])
trigger1 = (stateno=[200,415])&&(movecontact)
trigger2 = (p2bodydist x <= 35) && (prevstateno != 5120) && (p2movetype != H) && (statetype != A)
value = 1365

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
