


;---------------------------------------------------------------------------
; Initialize (at the start of the round)
[Statedef 5900]
type = S

[state 5900]
type = varset
trigger1 = time = 0
var(0) = 1

[state 5900]
type = varset
trigger1 = time = 0
var(3) = 0


;--------------------------------------

[State 5900, 1] ;Clear all int variables
type = VarRangeSet
trigger1 = roundsexisted = 0
value = 0

[State 5900, 2] ;Clear all float variables
type = VarRangeSet
trigger1 = roundsexisted = 0
fvalue = 0


[State 5900, 3] ;Intro for round 1
type = ChangeState
trigger1 = RoundsExisted = 0
trigger1 = RoundNo > 0
value = 190

