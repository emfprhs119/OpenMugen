; The CMD file.

;---------------------------------------------------------------------------
;Artificial Intelligence
;---------------------------------------------------------------------------

;-|-AI-|--------------------------------------------------------------------
[Command]
name = "AI_1"
command = a
time = 1

[Command]
name = "AI_2"
command = b
time = 1

[Command]
name = "AI_3"
command = c
time = 1

[Command]
name = "AI_4"
command = x
time = 1

[Command]
name = "AI_5"
command = y
time = 1

[Command]
name = "AI_6"
command = D
time = 1

[Command]
name = "AI_7"
command = U
time = 1

[Command]
name = "AI_8"
command = B
time = 1

[Command]
name = "AI_9"
command = F
time = 1

[Command]
name = "AI_10"
command = s
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
[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 250) && (random <= 349)
value = 130

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 250) && (random <= 349)
value = 131

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 250) && (random <= 349)
value = 132

[state -1,ai run]
type =changestate
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype != A) && (statetype = S)
trigger1 = (p2bodydist X >= 125) && ((random <= 290)&&(var(9)=0)||(random <= 450)&&(var(9)!=0))
value = 100

;-|-AI Combo Attempt-|----------------------------------------------
[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 15) && (random <= 250)
trigger2 = (p2bodydist X <= 15) && (random <= 350) && (stateno=100)
value = 200

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 20) && (random <= 250)
trigger2 = (p2bodydist X <= 15) && (random <= 350) && (stateno=100)
value = 205

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 20) && (random <= 250)
trigger2 = (p2bodydist X <= 15) && (random <= 350) && (stateno=100)
value = 210

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 25) && (random <= 250)
trigger2 = (p2bodydist X <= 15) && (random <= 350) && (stateno=100)
value = 215

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist X <= 25) && (random <= 250)
trigger2 = (p2bodydist X <= 15) && (random <= 350) && (stateno=100)
value = 220

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 20) && (random <= 250)
value = 400

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 25) && (random <= 250)
value = 405

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 25) && (random <= 250)
value = 410

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist X <= 25) && (random <= 250)
value = 415

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 250)
value = 600

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 250)
value = 605

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 250)
value = 610

[State -1]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist X <= 25) && (random <= 250)
value = 615

;-|-AI Super Attempt-|----------------------------------------------



;===========================================================================
;---------------------------------------------------------------------------
[State -1, FudouMumyouKen]
type = ChangeState
value = 2000
triggerall = var(9)=0
triggerall = command = "Fudou";D, DB, B, D, DB, B, AorBorC
triggerall = power >= 1000
triggerall = var(59)=0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1
trigger4 = stateno = [1000,1002]
trigger4 = movecontact > 1
trigger5 = NumHelper(1105)
trigger5 = helper(1105),movecontact > 1

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
[State -1,superblade]
type = ChangeState
value = 2300
triggerall = command = "superblade"
triggerall = power >= 1000
triggerall = var(59)=0
triggerall = statetype != A
triggerall = var(2)=0
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1
;---------------------------------------------------------------------------

[State -1,superlightningblade]
type = ChangeState
value = 2301
triggerall = command = "superlightningblade"
triggerall = power >= 1500
triggerall = var(59)=0
triggerall = statetype != A
triggerall = var(2)=0
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1

;---------------------------------------------------------------------------
[State -1,supercure]
type = ChangeState
value = 2200
triggerall = var(9) =0&&var(5)=0
triggerall = command = "supercure"
triggerall = statetype != A
triggerall = var(59)=0
triggerall = power >= 750
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1

;---------------------------------------------------------------------------

[State -1, charging stasis sword]
type = ChangeState
value = 3000
triggerall = command = "charging stasis sword"
triggerall = power >= 2000&&var(9)=0 ||power>= 2500&&var(9)!=0
triggerall = statetype != A
triggerall = var(59)=0
trigger1 = ctrl
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1
trigger4 = stateno = [1000,1002]
trigger4 = movecontact > 1
trigger5 = NumHelper(1105)
trigger5 = helper(1105),movecontact > 1
;--------------------------------------------------------------------------
[State -1, charging combo stasis sword]
type = ChangeState
value = 2799
triggerall = command = "charging combo stasis sword"
triggerall = power >= 2000
triggerall = statetype != A
triggerall = var(59)=0
trigger1 = ctrl
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1
trigger4 = stateno = [1000,1002]
trigger4 = movecontact > 1
trigger5 = NumHelper(1105)
trigger5 = helper(1105),movecontact > 1
;--------------------------------------------------------------------------
[State -1, dengeki combo]
type = ChangeState
value = 2700
triggerall = command = "dengeki combo"
triggerall = power >= 2000&&var(9)=0 ||power >= 2500&&var(9)!=0
triggerall = var(59)=0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1
trigger4 = stateno = [1000,1002]
trigger4 = movecontact > 1
trigger5 = NumHelper(1105)
trigger5 = helper(1105),movecontact > 1
;---------------------------------------------------------------------------


[State -1, super lightning]
type = ChangeState
value = 2420
triggerall = var(9)!=0
triggerall = command = "superlightning"
triggerall = power >= 2500
triggerall = var(59)=0
triggerall = var(2)=0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,220] 
trigger2 = movecontact
trigger3 = stateno = [400,415]
trigger3 = movecontact

;------------------------------------------------------------------------

[state -1, tripleairblade]
type=changestate
value=3700
triggerall = command="tripleairblade"
triggerall = var(10) <20
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = power>=1000
trigger1 = (statetype = A) && (ctrl)
trigger2 = (stateno = 600) && (movecontact)
trigger3 = (stateno = 605) && (movecontact)
trigger4 = (stateno = 610) && (movecontact)
trigger5 = (stateno = 615) && (movecontact)

;------------------------------------------------------------------------

[state -1,lightnigblade]
type=changestate
value=3499
triggerall=command="lightningblade"
triggerall=power>=750
triggerall = var(2)=0
triggerall = var(59)=0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,220]
trigger2 = movecontact
trigger3 = stateno = [400,415]
trigger3 = movecontact

[state -1,crush sword]
type=changestate
value=1800
triggerall=command="crushsword"
triggerall=power>=500
triggerall = var(9)=0
triggerall = var(2)=0
triggerall = var(59)=0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,220]
trigger2 = movecontact
trigger3 = stateno = [400,415]
trigger3 = movecontact

[state -1,spellblade]
type=changestate
value=1899
triggerall=command="spellblade"
triggerall=power>=500
triggerall = var(9)=0
triggerall = var(2)=0
triggerall = var(59)=0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,220]
trigger2 = movecontact
trigger3 = stateno = [400,415]
trigger3 = movecontact

[State -1, Shoryuken]
type = ChangeState
value = 1365
triggerall = command = "shoryukena"
triggerall = var(59)=0
trigger1 = (statetype = s) && ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)

[State -1, Shoryuken]
type = ChangeState
value = 1366
triggerall = command = "shoryukenb"
triggerall = var(59)=0
trigger1 = (statetype = s) && ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)

[State -1, Shoryuken]
type = ChangeState
value = 1367
triggerall = command = "shoryukenc"
triggerall = var(59)=0
trigger1 = (statetype = s) && ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)

[State -1, 3xHadouken]
type = ChangeState
value = 1550
triggerall = command = "3xhadouken1"
triggerall = power >= 250
triggerall = var(59)=0
triggerall = ((numproj <1&&var(9)=0)||(numproj<3&&var(9)!=0))
trigger1 = Statetype != A && ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)

[State -1, 3xHadouken]
type = ChangeState
value = 1560
triggerall = command = "3xhadouken2"
triggerall = power >= 250
triggerall = var(59)=0
triggerall = ((numproj <1&&var(9)=0)||(numproj<3&&var(9)!=0))
trigger1 = Statetype != A && ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)

[State -1, 3xHadouken]
type = ChangeState
value = 1570
triggerall = command = "3xhadouken3"
triggerall = power >= 250
triggerall = var(59)=0
triggerall = ((numproj <1&&var(9)=0)||(numproj<3&&var(9)!=0))
trigger1 = Statetype != A && ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)

[State -1,blade]
type = ChangeState
value = 1100
triggerall = command = "blade-a"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = var(59)=0
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1

[State -1,blade]
type = ChangeState
value = 1101
triggerall = command = "blade-b"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = var(59)=0
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1

[State -1,blade]
type = ChangeState
value = 1102
triggerall = command = "blade-c"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = var(59)=0
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1

[State -1,dengeki]
type = ChangeState
value = 1000
triggerall = command = "dengeki-a"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = var(59)=0
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1

[State -1,dengeki]
type = ChangeState
value = 1001
triggerall = command = "dengeki-b"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = var(59)=0
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1

[State -1,dengeki]
type = ChangeState
value = 1002
triggerall = command = "dengeki-c"
triggerall = command != "holddown"
triggerall = var(59)=0
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1

[State -1,cure]
type = ChangeState
value = 1150
triggerall = var(9)=0 && var(5)=0
triggerall = var(59)=0
triggerall = command = "cure"
triggerall = statetype != A
triggerall = power >= 250
trigger1 = ctrl = 1
trigger2 = stateno = [200,220]
trigger2 = movecontact > 1
trigger3 = stateno = [400,415]
trigger3 = movecontact > 1

[State -1,teleportback]
type       = ChangeState
value      = 1430
triggerall = var(59)=0
triggerall = command = "holdback" && command = "x"
trigger1   = statetype = S
trigger1   = ctrl      = 1
trigger2   = statetype = C
trigger2   = ctrl      = 1
trigger3 =(stateno=[5000,5011])
trigger4 =(stateno=[120,131])

[State -1,teleportforward]
type       = ChangeState
value      = 1432
triggerall = var(59)=0
triggerall = command = "holdfwd" && command = "x"
trigger1   = statetype = S
trigger1   = ctrl      = 1
trigger2   = statetype = C
trigger2   = ctrl      = 1
trigger3 =(stateno=[5000,5011])
trigger4 =(stateno=[120,131])

[State -1,airteleportback]
type       = ChangeState
value      = 1440
triggerall = var(59)=0
triggerall = command = "holdback" && command = "x"
trigger1   = statetype = A
trigger1   = ctrl      = 1
trigger2 =(stateno=[5020,5050])
trigger3 =((stateno=132)||(stateno=[154,155]))

[State -1,airteleportforward]
type       = ChangeState
value      = 1442
triggerall = var(59)=0
triggerall = command = "holdfwd" && command = "x"
trigger1   = statetype = A
trigger1   = ctrl      = 1
trigger2 =(stateno=[5020,5050])
trigger3 =((stateno=132)||(stateno=[154,155]))

[State -1, Hadouken]
type = ChangeState
value = 1510
triggerall = command = "hadouken1"
triggerall = ((numproj <1&&var(9)=0)||(numproj<3&&var(9)!=0))
triggerall = var(59)=0
triggerall = power>=100
trigger1 = Statetype != A && ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)

[State -1, Hadouken]
type = ChangeState
value = 1520
triggerall = command = "hadouken2"
triggerall = ((numproj <1&&var(9)=0)||(numproj<3&&var(9)!=0))
triggerall = var(59)=0
triggerall = power>=100
trigger1 = Statetype != A && ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)

[State -1, Hadouken]
type = ChangeState
value = 1530
triggerall = command = "hadouken3"
triggerall = ((numproj <1&&var(9)=0)||(numproj<3&&var(9)!=0))
triggerall = var(59)=0
triggerall = power>=100
trigger1 = Statetype != A && ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)

[state -1, sonic]
type = changestate
value = 1600
triggerall = var(59)=0
triggerall = command = "sonic1"
trigger1 = (statetype = A) && (ctrl)
trigger2 = (stateno = 600) && (movecontact)
trigger3 = (stateno = 605) && (movecontact)
trigger4 = (stateno = 610) && (movecontact)
trigger5 = (stateno = 615) && (movecontact)

[state -1, sonic]
type = changestate
value = 1610
triggerall = var(59)=0
triggerall = command = "sonic2"
trigger1 = (statetype = A) && (ctrl)
trigger2 = (stateno = 600) && (movecontact)
trigger3 = (stateno = 605) && (movecontact)
trigger4 = (stateno = 610) && (movecontact)
trigger5 = (stateno = 615) && (movecontact)

[state -1, sonic]
type = changestate
value = 1620
triggerall = var(59)=0
triggerall = command = "sonic3"
trigger1 = (statetype = A) && (ctrl)
trigger2 = (stateno = 600) && (movecontact)
trigger3 = (stateno = 605) && (movecontact)
trigger4 = (stateno = 610) && (movecontact)
trigger5 = (stateno = 615) && (movecontact)

[state -1, airblade]
type=changestate
value=1700
triggerall = command = "holdback" && command = "z"||command="airblade-a"
triggerall = var(10) <20
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = power>=250
trigger1 = (statetype = A) && (ctrl)
trigger2 = (stateno = 600) && (movecontact)
trigger3 = (stateno = 605) && (movecontact)
trigger4 = (stateno = 610) && (movecontact)
trigger5 = (stateno = 615) && (movecontact)

[state -1, airblade]
type=changestate
value=1701
triggerall = command = "holddown" && command = "z"||command="airblade-b"
triggerall = var(10) <20
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = power>=250
trigger1 = (statetype = A) && (ctrl)
trigger2 = (stateno = 600) && (movecontact)
trigger3 = (stateno = 605) && (movecontact)
trigger4 = (stateno = 610) && (movecontact)
trigger5 = (stateno = 615) && (movecontact)

[state -1, airblade]
type=changestate
value=1702
triggerall = command = "holdfwd" && command = "z"||command="airblade-c"
triggerall = var(10) <20
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = power>=1000
trigger1 = (statetype = A) && (ctrl)
trigger2 = (stateno = 600) && (movecontact)
trigger3 = (stateno = 605) && (movecontact)
trigger4 = (stateno = 610) && (movecontact)
trigger5 = (stateno = 615) && (movecontact)
;two inch
[State -1, two inch]
type = ChangeState
value = 1300
triggerall = var(2) = 0
triggerall = var(9) =0
triggerall = var(59)=0
triggerall = alive = 1
triggerall = statetype != A
triggerall = command = "two inch1"
triggerall = power >= 500
trigger1 = stateno = 150
trigger2 = stateno = 151
trigger3 = stateno = 152
trigger4 = ctrl = 1

;two inch
[State -1, two inch]
type = ChangeState
value = 1301
triggerall = var(2) = 0
triggerall = var(9) =0
triggerall = var(59)=0
triggerall = alive = 1
triggerall = statetype != A
triggerall = command = "two inch2"
triggerall = power >= 650
trigger1 = stateno = 150
trigger2 = stateno = 151
trigger3 = stateno = 152
trigger4 = ctrl = 1

;two inch
[State -1, two inch]
type = ChangeState
value = 1302
triggerall = var(2) = 0
triggerall = var(9) =0
triggerall = var(59)=0
triggerall = alive = 1
triggerall = statetype != A
triggerall = command = "two inch3"
triggerall = power >= 800
trigger1 = stateno = 150
trigger2 = stateno = 151
trigger3 = stateno = 152
trigger4 = ctrl = 1


[State -1, lightning armor]
type = ChangeState
value = 50000
triggerall = var(9) = 0 && var(5)=0
triggerall = var(59)=0
Triggerall = command = "lightningarmor"
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = ctrl
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 210) && (movecontact)
trigger5 = (stateno = 215) && (movecontact)
trigger6 = (stateno = 220) && (movecontact)
trigger7 = (stateno = 400) && (movecontact)
trigger8 = (stateno = 405) && (movecontact)
trigger9 = (stateno = 410) && (movecontact)
trigger10 = (stateno = 415) && (movecontact)
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

;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "throw"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = p2movetype != H

;===========================================================================
;---------------------------------------------------------------------------
[State -1,a]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 400) && (movecontact)


[State -1,b2]
type = ChangeState
value = 210
triggerall = command = "b" && command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 205) && (movecontact)
trigger4 = (stateno = 400) && (movecontact)


[State -1,b]
type = ChangeState
value = 205
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 400) && (movecontact)


[State -1,c]
type = ChangeState
value = 220
triggerall = command = "c" && command = "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = [200,215])&&(movecontact)
trigger3 = (stateno = [400,405])&&(movecontact)


[State -1,c2]
type = ChangeState
value = 215
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = [200,210])&&(movecontact)
;trigger2 = movecontact > 1
trigger3 = (stateno = [400,405]) &&(movecontact)
;trigger3 = movecontact > 1

[State -1,lowa]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 400) && (movecontact)
trigger4 = stateno = 52 && time > 2

[State -1,lowb]
type = ChangeState
value = 405
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = 200) && (movecontact)
trigger3 = (stateno = 400) && (movecontact)
trigger4 = stateno = 52 && time > 2

[State -1,lowc2]
type = ChangeState
value = 415
triggerall = command = "c" && command = "holdfwd"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = [200,215]) &&(movecontact)
;trigger2 = movecontact > 1
trigger3 = (stateno = [400,405]) &&(movecontact)
;trigger3 = movecontact > 1

[State -1,lowc]
type = ChangeState
value = 410
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = (stateno = [200,210])&&(movecontact)
;trigger2 = movecontact > 1
trigger3 = (stateno = [400,405])&&(movecontact)
;trigger3 = movecontact > 1
trigger4 = stateno = 52 && time > 2

[State -1,Ja]
type = ChangeState
value = 600
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl = 1

[State -1,Jb]
type = ChangeState
value = 605
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl = 1
trigger2 = stateno = 600
trigger2 = movecontact > 1

[State -1,Jc2]
type = ChangeState
value = 615
triggerall = command = "c" && command = "holdfwd"
triggerall = statetype = A
trigger1 = ctrl = 1
trigger2 = stateno = [600,610]
trigger2 = movecontact > 1

[State -1,Jc]
type = ChangeState
value = 610
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl = 1
trigger2 = stateno = [600,605]
trigger2 = movecontact > 1

[State -1, Power Charge]
type=changestate
value=730
triggerall = Var(9) = 0&&var(5)=0
triggerall = var(59)=0
;triggerall = VAR(7) != 1
;triggerall = VAR(0) != 95
triggerall = power < 5000
trigger1= command="hold_z"
trigger1= roundstate=2 && statetype!=A
trigger1= ctrl || (stateno=[100,101])

[State -1, fireball]
type = ChangeState
value = 1400
triggerall = var(9) = 0
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = command = "holddown" && command = "y"
triggerall = power >= 300
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,220] 
trigger2 = movecontact
trigger3 = stateno = [5000,5011]
trigger3 = movecontact

[State -1, fireball]
type = ChangeState
value = 1403
triggerall = var(9) = 0
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = command = "holddown" && command = "y"
triggerall = power >= 300
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [40,52]
trigger3 = stateno = [600,615]
trigger3 = movecontact

[State -1, ice]
type = ChangeState
value = 1410
triggerall = var(9) = 0
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = command = "holdback" && command = "y"
triggerall = power >= 350
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,220] 
trigger2 = movecontact
trigger3 = stateno=[5000,5011]
trigger3 = movecontact

[State -1, ice]
type = ChangeState
value = 1413
triggerall = var(9) = 0
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = command = "holdback" && command = "y"
triggerall = power >= 350
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [40,52]
trigger3 = stateno = [600,615]
trigger3 = movecontact

[State -1, lightning]
type = ChangeState
value = 1420
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = command = "holdfwd" && command = "y"
triggerall = power >= 400
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,220] 
trigger2 = movecontact
trigger3 = stateno=[5000,5011]
trigger3 = movecontact

[State -1, lightning]
type = ChangeState
value = 1423
triggerall = var(2) = 0
triggerall = var(59)=0
triggerall = command = "holdfwd" && command = "y"
triggerall = power >= 400
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [40,52]
trigger3 = stateno = [600,615]
trigger3 = movecontact

; Curse Deflector (Human)
[State -1, Curse Deflector]
type = ChangeState
value = 20000
triggerall = var(9) =0
triggerall = var(59)=0
triggerall = command = "x"
triggerall = command != "holddown"||command !="holdback"||command !="holdfwd"
triggerall = NumProj < 1
trigger1 = statetype != A &&ctrl =1
trigger2 = ((stateno=[120,131])||(stateno=[140,153]))
;trigger1 = Var(1)
trigger3 = stateno = [200,220]
;trigger2 = Var(1)
trigger4 = stateno = [400,415]
trigger5 = stateno=[5000,5011]
;trigger3 = Var(1)
;trigger4 = stateno = [412,415]
;trigger4 = Var(1)
;trigger5 = (stateno = 206) || (stateno = 216) || (stateno = 406) || (stateno = 416)
;trigger5 = Var(1)
;---------------------------------------------------------------------------

;==============================================================================
; 移動関連
;==============================================================================

[State 50]
type = ChangeState
triggerall = statetype != A
triggerall = Command = "holdup"
trigger1 = stateno = [200,215]
trigger1 = movecontact > 1
trigger2 = stateno = [400,415]
trigger2 = movecontact > 1
value = 40
ctrl = 1



