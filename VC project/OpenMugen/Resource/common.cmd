
[State -1, jump]
type = ChangeState
triggerall = command = "holdup"
triggerall = stateno != 40
triggerall = statetype = S
value = 40

[State -1, crouch]
type = ChangeState
triggerall = command = "holddown"
triggerall = stateno != 10
triggerall = statetype = S
value = 10

[State -1, fwd]
type = ChangeState
triggerall = command = "holdfwd"
triggerall = stateno != 20
triggerall = statetype = S
value = 20


;---------------------------------------------------------------------------
[State -1, back]
type = ChangeState
triggerall = command = "holdback"
triggerall = stateno != 20
triggerall = statetype = S
value = 20

[State -1, 5]
type = ChangeState
triggerall = command != "holddown"
triggerall = stateno = 11
triggerall = statetype = C
value = 12

[State -1, 5]
type = ChangeState
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = stateno != 0
triggerall = stateno != 5000
triggerall = statetype = S
triggerall = ctrl
value = 0
