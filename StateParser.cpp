#include "global.h"




CStateParser::CStateParser()
{

}

CStateParser::~CStateParser()
{

}

void CStateParser::Error(const char * strErrorMsg, CTokenizer &tok)
{
	printf("Error--%s\n", strErrorMsg);
	throw(CError("Parser error:\nin file %s at line %i:\ntoken:%s\nerror:%s", tok.GetFileName()
		, tok.GetLineNumber()
		, tok.GetPartToken()
		, strErrorMsg));
}
void CStateParser::ParseConstFile(const char * strFileName, PLAYERCONST *myPlayerConst)
{
	CTokenizer tok;

	if (!tok.OpenFile(strFileName))
		throw(CError("CStateParser::ParseState: File %s not found", strFileName));

	tok.SetIsCaseSensitive(false);
	tok.SetReturnNegativeSeperatelyFromNumber(false);
	while (!tok.AtEndOfFile())
	{
		if (tok.CheckToken("["))
		{
			if (tok.CheckToken("Data"))
			{
				if (tok.CheckToken("]")){}
				if (!tok.CheckToken("life"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nLife = tok.GetInt();
				if (!tok.CheckToken("attack"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nAttack = tok.GetInt();
				if (!tok.CheckToken("defence"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nDefence = tok.GetInt();
				if (!tok.CheckToken("power"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nPower = tok.GetInt();
				if (!tok.CheckToken("fall.defence_up"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nFallDefenceUp = tok.GetInt();
				if (!tok.CheckToken("liedown.time"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nLieDownTime = tok.GetInt();
				if (!tok.CheckToken("airjuggle"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nAirjuggle = tok.GetInt();
				if (!tok.CheckToken("sparkno"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nSparkno = tok.GetInt();
				if (!tok.CheckToken("guard.sparkno"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nGuardSparkno = tok.GetInt();
				if (!tok.CheckToken("KO.echo"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.bKoEcho = tok.GetBool();
				if (!tok.CheckToken("volume"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nVolumen = tok.GetInt();
				if (!tok.CheckToken("IntPersistIndex"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nIntPersistIndex = tok.GetInt();
				if (!tok.CheckToken("FloatPersistIndex"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerData.nFloatPersistIndex = tok.GetInt();
			}
			if (tok.CheckToken("Size"))
			{
				if (tok.CheckToken("]")){}
				if (!tok.CheckToken("xscale"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nXscale = tok.GetFloat();
				if (!tok.CheckToken("yscale"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nYscale = tok.GetFloat();
				if (!tok.CheckToken("ground.back"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nGroundBack = tok.GetInt();
				if (!tok.CheckToken("ground.front"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nGroundFront = tok.GetInt();
				if (!tok.CheckToken("air.back"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nAirBack = tok.GetInt();
				if (!tok.CheckToken("air.front"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nAirFront = tok.GetInt();
				if (!tok.CheckToken("height"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nHeight = tok.GetInt();
				if (!tok.CheckToken("attack.dist"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nAttackDistance = tok.GetInt();
				if (!tok.CheckToken("proj.attack.dist"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nProjAttackDist = tok.GetInt();
				if (!tok.CheckToken("proj.doscale"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.bProjDoScale = tok.GetBool();
				if (!tok.CheckToken("head.pos"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nHeadPos = tok.getXYVALUE();
				if (!tok.CheckToken("mid.pos"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nMidPos = tok.getXYVALUE();
				if (!tok.CheckToken("shadowoffset"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nShadowOffset = tok.GetInt();
				if (!tok.CheckToken("draw.offset"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerSize.nDrawOffset = tok.getXYVALUE();
			}
			if (tok.CheckToken("Velocity"))
			{
				if (tok.CheckToken("]")){}
				if (!tok.CheckToken("walk.fwd"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.nWalkFwd = tok.GetFloat();
				if (!tok.CheckToken("walk.back"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.nWalkBack = tok.GetFloat();
				if (!tok.CheckToken("run.fwd"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.RunFwd = tok.getXYVALUE();
				if (!tok.CheckToken("run.back"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.RunBack = tok.getXYVALUE();
				if (!tok.CheckToken("jump.neu"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.JumpNeu = tok.getXYVALUE();
				if (!tok.CheckToken("jump.back"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.JumpBack = tok.getXYVALUE();
				if (!tok.CheckToken("jump.fwd"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.JumpFwd = tok.getXYVALUE();
				if (!tok.CheckToken("runjump.back"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.RunjumpBack = tok.getXYVALUE();
				if (!tok.CheckToken("runjump.fwd"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.RunjumpFwd = tok.getXYVALUE();
				if (!tok.CheckToken("airjump.neu"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.AirjumpNeu = tok.getXYVALUE();
				if (!tok.CheckToken("airjump.back"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.AirjumpBack = tok.getXYVALUE();
				if (!tok.CheckToken("airjump.fwd"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerVelocity.AirjumpFwd = tok.getXYVALUE();
			}
			if (tok.CheckToken("Movement"))
			{
				if (tok.CheckToken("]")){}
				if (!tok.CheckToken("airjump.num"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerMovement.AirJumpNum = tok.GetInt();
				if (!tok.CheckToken("airjump.height"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerMovement.nAirJumpHight = tok.GetFloat();
				if (!tok.CheckToken("yaccel"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerMovement.yaccel = tok.GetFloat();
				if (!tok.CheckToken("stand.friction"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerMovement.StandFriction = tok.GetFloat();
				if (!tok.CheckToken("crouch.friction"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerMovement.CrouchFriction = tok.GetFloat();
				///////////////////////////////////////////////////////
				if (!tok.CheckToken("stand.friction.threshold"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerMovement.StandFrictionThreshold = tok.GetFloat();
				if (!tok.CheckToken("crouch.friction.threshold"))
					tok.GetToken();
				if (tok.CheckToken("="))
					myPlayerConst->PlayerMovement.CrouchFrictionThreshold = tok.GetFloat();
			}
		}
		else
			tok.GetToken();
	}
}
void CStateParser::ParseStateFile(const char* strFileName, CStateManager &StateManager, CAllocater *a)
{
	//Set pointer to allocater
	m_pAlloc = a;

	CTokenizer tok;
	bool foundState = false;

	if (!tok.OpenFile(strFileName))
		throw(CError("CStateParser::ParseState: File %s not found", strFileName));

	tok.SetIsCaseSensitive(false);
	tok.SetReturnNegativeSeperatelyFromNumber(false);


	while (!tok.AtEndOfFile())
	{
		foundState = false;

		if (tok.CheckToken("["))
		{

			if (tok.CheckToken("Statedef"))
			{
				foundState = true;
				if (!tok.CheckTokenIsNumber())
					continue;
				//Error("Expected a number in statedef block", tok);

				StateManager.AddStateDef(tok.GetInt());

				//Skip useless stuff
				while (!tok.AtEndOfLine())
					tok.GetToken();

				//parse the state def
				ParseStateDef(tok, StateManager);


			}
			if (tok.CheckToken("State"))
			{
				foundState = true;

				if (!tok.CheckTokenIsNumber())
					continue;
				//Error("Expected a number in state block", tok);

				int stateNum = tok.GetInt();
				char strStateInfo[100] = "";
				if (tok.CheckToken(",", true)){
					while (!tok.CheckToken("]")){
						strcat_s(strStateInfo, tok.GetToken());
					}
				}
				//Error("Expected a number in statedef block", tok);


				//tok.GetToken(strStateInfo, 99);
				// 加入状态
				//printf("%s", strStateInfo);
				StateManager.AddState(stateNum, strStateInfo);
				if (stateNum == 5100)
					printf("");
				//Skip useless stuff
				ParseState(tok, StateManager);

			}


		}

		//skip useless stuff
		if (!foundState){
			tok.GetToken();

		}

	}

	tok.CloseFile();
}

void CStateParser::ParseStateDef(CTokenizer &tok, CStateManager &StateManager)
{
	while (!tok.CheckToken("[", false) && !tok.AtEndOfFile())
	{
		//parse state type
		if (tok.CheckToken("type"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			//to get a single char   
			char c = tok.GetToken()[0];
			//make sure we use uperchars
			if (c >= 97)
				c -= 32;
			switch (c)
			{
			case 'S':
				StateManager.SetStateDefType(stand);
				break;

			case 'C':
				StateManager.SetStateDefType(crouch);
				break;

			case 'A':
				StateManager.SetStateDefType(air);
				break;

			case 'L':
				StateManager.SetStateDefType(liedown);
				break;

			case 'U':
				StateManager.SetStateDefType(untouch);
				break;

			default:
				Error("Unknown statetype", tok);
				break;
			}
		}
		else if (tok.CheckToken("movetype"))
		{
			if (!tok.CheckToken("="))
				Error("expected '=' in line ", tok);
			//to get a single char   
			char c = tok.GetToken()[0];
			//make sure we use uperchars
			if (c >= 97)
				c -= 32;
			switch (c)
			{
			case 'A':
				StateManager.SetStateMoveType(attack);
				break;

			case 'I':
				StateManager.SetStateMoveType(idle);
				break;

			case 'H':
				StateManager.SetStateMoveType(hit);
				break;

			case 'U':
				StateManager.SetStateMoveType(untouch);
				break;

			default:
				Error("Unknown movetype", tok);
				break;
			}
		}
		else if (tok.CheckToken("physics"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);
			//to get a single char   
			char c = tok.GetToken()[0];
			//make sure we use uperchars
			if (c >= 97)
				c -= 32;
			switch (c)
			{
			case 'S':
				StateManager.SetStatePhysicType(stand);
				break;

			case 'C':
				StateManager.SetStatePhysicType(crouch);
				break;

			case 'A':
				StateManager.SetStatePhysicType(air);
				break;

			case 'N':
				StateManager.SetStatePhysicType(none);
				break;

			case 'U':
				StateManager.SetStatePhysicType(untouch);
				break;

			default:
				Error("Unknown physic type", tok);
				break;
			}
		}
		else if (tok.CheckToken("anim"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			if (!tok.CheckTokenIsNumber())
				Error("Expected a number for anim", tok);

			StateManager.SetStateAnim(tok.GetInt());


		}
		else if (tok.CheckToken("velset"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			float x = tok.GetFloat();

			if (!tok.CheckToken(","))
				Error("expected ,", tok);

			float y = tok.GetFloat();

			StateManager.SetVelSet(x, y);
			while (!tok.AtEndOfLine())
				tok.GetToken();

		}
		else if (tok.CheckToken("ctrl"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			if (!tok.CheckTokenIsNumber())
				Error("Expected a number for ctrl", tok);

			StateManager.SetStateCtrl(tok.GetBool());

		}
		else if (tok.CheckToken("poweradd"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			if (!tok.CheckTokenIsNumber())
				Error("Expected a number for poweradd", tok);

			StateManager.SetStatePowerAdd(tok.GetInt());

		}
		else if (tok.CheckToken("juggle"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			if (!tok.CheckTokenIsNumber())
				Error("Expected a number for juggle", tok);

			StateManager.SetStateJuggle(tok.GetInt());

		}
		else if (tok.CheckToken("facep2"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			if (!tok.CheckTokenIsNumber())
				Error("Expected a number for facep2", tok);

			StateManager.SetStateFaceP2(tok.GetBool());

		}
		else if (tok.CheckToken("hitdefpersist"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			if (!tok.CheckTokenIsNumber())
				Error("Expected a number for hitdefpersist", tok);

			StateManager.SetStateHitDefPresit(tok.GetBool());

		}
		else if (tok.CheckToken("movehitpersist"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			if (!tok.CheckTokenIsNumber())
				Error("Expected a number for movehitpersist", tok);

			StateManager.SetMoveHitPresit(tok.GetBool());

		}
		else if (tok.CheckToken("hitcountpersist"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			if (!tok.CheckTokenIsNumber())
				Error("Expected a number for hitcountpersist", tok);

			StateManager.SetStateHitCounterPresit(tok.GetBool());


		}
		else if (tok.CheckToken("sprpriority"))
		{
			if (!tok.CheckToken("="))
				Error("expected =", tok);

			if (!tok.CheckTokenIsNumber())
				Error("Expected a number for sprpriority", tok);
			StateManager.SetSprPriority(tok.GetInt());
		}
		else //faile in statedef
		{
			throw(CError("Unknown token at line %s", tok.GetToken()));
			break;
		}
	}
}

void CStateParser::ParseState(CTokenizer &tok, CStateManager &StateManager)
{
	// 暂时支持三条tirgger，不支持triggerall 
	while (!tok.CheckToken("[", false) && !tok.AtEndOfFile())
	{
		StateManager.NewInst();
		if (tok.CheckToken("type"))
		{
			if (!tok.CheckToken("="))
				throw(CError("expected ="));
			nController = GetControllerType(tok.GetToken(), tok);
			StateManager.AddTypeToState(nController);
			//ParserController(tok, StateManager, nController);
		}
		else if (tok.CheckToken("triggerall"))
		{
			//Error("triggerall not support =",tok);
			PrintMessage("triggerAll");
			if (!tok.CheckToken("=")){
				Error("expected =", tok);
			}
			ParseTrigger(tok, StateManager);
			// 将stateManager中的pInst移到lpStateDefList->lpState->triggers
			StateManager.AddTriggerAllToState(nController);
		}
		else  if (int tokN = tok.CheckNToken("trigger", 7))
		{
			if (!tok.CheckToken("=")){
				Error("expected =", tok);
			}
			ParseTrigger(tok, StateManager);
			// 将stateManager中的pInst移到lpStateDefList->lpState->triggers
			StateManager.AddTriggerToState(tokN, nController);
		}
		else
			ParserController(tok, StateManager, nController);

	}
	//parse the controller


}

void CStateParser::ParseTrigger(CTokenizer &tok, CStateManager &StateManager)
{
	tok.SetReturnNegativeSeperatelyFromNumber(true);
	EvaluateExpression(tok, StateManager);
	tok.SetReturnNegativeSeperatelyFromNumber(false);
	// 加入OP_STOP
	StateManager.AddInstruction(OP_STOP, 0, "OP_STOP");
	PrintMessage("");

}

//Generates the Opcode sequenz for the trigger statement
//evaluates and + and - expression
void CStateParser::EvaluateExpression(CTokenizer &tok, CStateManager &StateManager)
{
	while (!tok.AtEndOfLine() || bParserLoop)
	{
		if (tok.CheckNToken("trigger", 7, false))
			break;
		else if (tok.CheckToken("[", false))
			break;
		else if (tok.CheckToken("value", false))
			break;
		else if (tok.CheckToken("+"))
		{
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_ADD, 0, "#");
		}
		else if (tok.CheckToken("-"))
		{
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_SUB, 0, "#");
		}
		else if (tok.CheckToken("*"))
		{
			//Have we a ** operator?
			if (tok.CheckToken("*"))
			{
				bParserLoop = true;
				EvaluateExpression(tok, StateManager);
				StateManager.AddInstruction(OP_SQUARE, 0, "#");
				bParserLoop = false;
			}
			else
			{
				bParserLoop = true;
				EvaluateExpression(tok, StateManager);
				StateManager.AddInstruction(OP_MUL, 0, "#");
				bParserLoop = false;
			}
		}

		else if (tok.CheckToken("/"))
		{
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_DIV, 0, "#");
		}
		else if (tok.CheckToken("="))
		{
			if (tok.CheckToken("[")){
				StateManager.AddInstruction(OP_PUSH, tok.GetFloat(), "#");
				if (tok.CheckToken(",")){}
				StateManager.AddInstruction(OP_PUSH, tok.GetFloat(), "#");
				if (tok.CheckToken("]")){
					StateManager.AddInstruction(OP_INTERVALOP1, 0, "#");
				}
				else if (tok.CheckToken(")")){
					StateManager.AddInstruction(OP_INTERVALOP2, 0, "#");
				}

			}
			else{
				bParserLoop = true;
				EvaluateExpression(tok, StateManager);
				StateManager.AddInstruction(OP_EQUAL, 0, "#");
				bParserLoop = false;
			}
		}

		else if (tok.CheckToken(":"))
		{    //evalute the right side of the operator
			if (tok.CheckToken("="))
			{
				EvaluateExpression(tok, StateManager);
				PrintMessage("TODO:Handel assign operator :=");
			}
		}

		else if (tok.CheckToken("!="))
		{

			if (tok.CheckToken("[")){
				StateManager.AddInstruction(OP_PUSH, tok.GetFloat(), "#");
				if (tok.CheckToken(",")){}
				StateManager.AddInstruction(OP_PUSH, tok.GetFloat(), "#");
				if (tok.CheckToken("]")){
					StateManager.AddInstruction(OP_INTERVALOP5, 0, "#");
				}
				else if (tok.CheckToken(")")){
					StateManager.AddInstruction(OP_INTERVALOP6, 0, "#");
				}

			}
			else{
				bParserLoop = true;
				EvaluateExpression(tok, StateManager);
				StateManager.AddInstruction(OP_NOTEQUAL, 0, "#");
				bParserLoop = false;
			}
		}

		else if (tok.CheckToken("<"))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_LESS, 0, "#");
		}

		else if (tok.CheckToken("<="))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_LESSEQUAL, 0, "#");
		}

		else if (tok.CheckToken(">"))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_GREATER, 0, "#");
		}

		else if (tok.CheckToken(">="))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_GRAETEREQUAL, 0, "#");
		}

		else if (tok.CheckToken("&&"))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_LOGAND, 0, "#");
			return;
		}

		else if (tok.CheckToken("||"))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_LOGOR, 0, "#");
			return;
		}

		else if (tok.CheckToken("^^")) // is this realy needed?
			//FIXME:Cant read ^^
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_LOGXOR, 0, "#");
			return;
		}

		else if (tok.CheckToken("&"))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_AND, 0, "#");
			return;
		}

		else if (tok.CheckToken("~"))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_NOT, 0, "#");
			return;
		}

		else if (tok.CheckToken("|"))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_OR, 0, "#");
			return;
		}

		else if (tok.CheckToken("^"))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_XOR, 0, "#");
			return;
		}

		else if (tok.CheckToken("%"))
		{    //evalute the right side of the operator
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_MOD, 0, "#");
			return;
		}
		else if (tok.CheckToken("!"))
		{
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_NOT, 0, "#");
			return;
		}
		//check for intervall operator
		else if (tok.CheckTokenIsNumber())
		{
			StateManager.AddInstruction(OP_PUSH, tok.GetFloat(), "#");
			if (tok.AtEndOfLine() || tok.AtEndOfFile() || tok.CheckToken("&&", false) || tok.CheckToken("||", false))
				return;
		}
		else if (tok.CheckTokenIsStatetype() != -1)
		{
			StateManager.AddInstruction(OP_PUSH, (float)tok.CheckTokenIsStatetype(), "#");
			tok.GetToken();
			if (tok.AtEndOfLine() || tok.AtEndOfFile())
				return;
		}
		/*
		else if (tok.CheckTokenIsQuotedString())
		{
		StateManager.AddInstruction(OP_PUSH, 0, tok.GetToken());
		}
		*/
		else if (tok.CheckToken(",", false))
		{
			return;
		}
		else if (tok.CheckToken("ifelse"))
		{
			if (tok.CheckToken("(", true)){}
			EvaluateExpression(tok, StateManager);
			if (tok.CheckToken(",", true)){
				EvaluateExpression(tok, StateManager);
			}
			if (tok.CheckToken(",", true)){
				EvaluateExpression(tok, StateManager);
			}
			if (tok.CheckToken("(", true)){}
			StateManager.AddInstruction(OP_IfElse, 0, "#");
			if (tok.CheckToken(")", true)){}
		}
		else if (tok.CheckToken("(", true))
		{
			//evaluate first expression                   
			EvaluateExpression(tok, StateManager);
			// TODO：处理const(expr)
			//intervall op =(,)
			if (!tok.CheckToken(")") && !tok.AtEndOfLine())
			{
				//Error("Expectetd ) , in intervall operator", tok);
			}
			//return;
		}
		else if (tok.CheckToken("["))
		{
			EvaluateExpression(tok, StateManager);
			if (!tok.CheckToken("]") && !tok.AtEndOfLine())
				Error("Missing ]", tok);
			return;

		}
		else if (tok.CheckToken(")", false)){
			return;
		}
		else if (tok.CheckToken("]", false)){
			return;
		}
		else if (tok.CheckToken("x")){
			StateManager.AddInstruction(OP_PUSH, 1, "x");
			return;
		}
		else if (tok.CheckToken("y")){
			StateManager.AddInstruction(OP_PUSH, 2, "y");
			return;
		}
		else if (tok.CheckToken("X")){
			StateManager.AddInstruction(OP_PUSH, 1, "X");
			return;
		}
		else if (tok.CheckToken("Y")){
			StateManager.AddInstruction(OP_PUSH, 2, "Y");
			return;
		}
		else if (tok.CheckToken("Pos")){
			EvaluateExpression(tok, StateManager);
			StateManager.AddInstruction(OP_Pos, 0, "#");
			//return;
		}

		else if (tok.CheckToken("const")){
			if (tok.CheckToken("(")){}
			const char *conStr = tok.GetToken();
			if (conStr == NULL)
				return;
			StateManager.AddInstruction(OP_PUSH, (float)GetConstNum(conStr), conStr);
			StateManager.AddInstruction(OP_Const, 0, "#");
			if (tok.CheckToken(")")){}
		}
		else if (tok.CheckToken("Const240p")){
			if (tok.CheckToken("(")){}
			StateManager.AddInstruction(OP_PUSH, tok.GetFloat(), "#");
			StateManager.AddInstruction(OP_ConstCoordinate, 240, "#");
			if (tok.CheckToken(")")){}
		}
		else if (tok.CheckToken("Const480p")){
			if (tok.CheckToken("(")){}
			StateManager.AddInstruction(OP_PUSH, tok.GetFloat(), "#");
			StateManager.AddInstruction(OP_ConstCoordinate, 480, "#");
			if (tok.CheckToken(")")){}
		}

		else if (tok.CheckToken("Const720p")){
			if (tok.CheckToken("(")){}
			StateManager.AddInstruction(OP_PUSH, tok.GetFloat(), "#");
			StateManager.AddInstruction(OP_ConstCoordinate, 720, "#");
			if (tok.CheckToken(")")){}
		}
		else if (tok.CheckToken("Command")){
			int tmpEq;
			if (tok.GetToken()[0] == '=')
				tmpEq = 0;
			else
				tmpEq = 1;
			StateManager.AddInstruction(OP_PUSH, (float)GetCommandNum(tok.GetToken()), "#");
			StateManager.AddInstruction(OP_PUSH, (float)tmpEq, "#");
			StateManager.AddInstruction(OP_Command, 0, "#");

		}
		else //check for a trigger name
		{
			/*
			if (tok.CheckToken("Time")){
			StateManager.AddInstruction(OP_Time, 0, "#");
			continue;
			}
			*/
			const char *tokStr = tok.GetToken();
			if (tokStr == NULL)
				return;
			int i = GetTriggerType(tokStr, tok);
			if (i == -1){
				StateManager.AddInstruction(OP_PUSH, 0, tokStr);
			}
			else{
				switch (i + OP_Abs){
				case OP_SysVar:
				case OP_Var:
				case OP_SysFVar:
				case OP_FVar:
				case OP_AnimElemTime:

					if (tok.CheckToken("(")){}
					StateManager.AddInstruction(OP_PUSH, tok.GetFloat(), "#");
					StateManager.AddInstruction(i + OP_Abs, 0, "#");
					if (tok.CheckToken(")")){}
					break;
				case OP_GetHitVar:
					if (tok.CheckToken("(")){}
					StateManager.AddInstruction(OP_PUSH, (float)GetHitVarNum(tok.GetToken()), "#");
					if (tok.CheckToken(")")){}
					StateManager.AddInstruction(OP_GetHitVar, 0, "#");
					break;
				case OP_Time:
				case OP_Anim:
				case OP_AnimElem:
				case OP_AnimTime:
				case OP_StateNo:
				case OP_PrevStateNo:
				case OP_StateType:
				case OP_Random:
					StateManager.AddInstruction(i + OP_Abs, 0, tokStr);
					break;
				default:
					EvaluateExpression(tok, StateManager);
					StateManager.AddInstruction(i + OP_Abs, 0, tokStr);

				}
			}
		}
	}

}

int CStateParser::GetControllerType(const char * strType, CTokenizer &tok)
{
	int i = 0;
	while (strControllerTypes[i])
	{
		if (_strcmpi(strType, strControllerTypes[i]) == 0)
			return i;

		i++;

	}
	Error(strType, tok);

	return -1;
}

int CStateParser::GetTriggerType(const char * strTrigger, CTokenizer &tok)
{
	int i = 0;
	while (strTriggerType[i])
	{
		if (_strcmpi(strTrigger, strTriggerType[i]) == 0)
			return i;


		i++;

	}
	//TODO:找不到的是要被替换的
	//Error(strTrigger,tok);

	return -1;

}
int CStateParser::GetFlagNum(const char * strFlagTemp)
{
	int i = 0;
	int flag = 1;
	while (strFlag[i])
	{
		if (_strcmpi(strFlagTemp, strFlag[i]) == 0)
			return flag;
		i++;
		flag *= 2;
	}
	return -1;
}
int CStateParser::GetConstNum(const char * strConstTemp)
{
	int i = 0;
	while (strConst[i])
	{
		if (_strcmpi(strConstTemp, strConst[i]) == 0)
			return i;
		i++;
	}
	return -1;
}
int CStateParser::GetCommandNum(const char * strCommandTemp)
{
	int count = m_CmdManager->GetCount();
	PLCOMMAND* command = m_CmdManager->GetCommand();
	for (int i = 0; i < count; i++){
		if (_strcmpi(command[i].strCommand, strCommandTemp) == 0)
			return i;
	}
	return -1;
}
int CStateParser::GetHitVarNum(const char * strHitVarTemp)
{
	for (int i = 0; i < GetHitVarCount; i++){
		if (_strcmpi(strGetHitVar[i], strHitVarTemp) == 0)
			return i;
	}
	return -1;
}

//Parse a controller

void CStateParser::ParserController(CTokenizer &tok, CStateManager &StateManager,
	u16 nControllerType)
{
	//ParseNormalAction(tok, StateManager);
	//ParseChangeState(tok, StateManager);

	switch (nControllerType)
	{
	case Control_HitDef:
		PrintMessage("ParseHitDef");
		//ParseSndAction(tok, StateManager);
		ParseHitDef(tok, StateManager);
		break;

	case Control_HitFallVel:
		break;
	case Control_VelSet:
	case Control_VelAdd:
	case Control_HitVelSet:
	case Control_VarSet:
	case Control_VelMul:
	case Control_PosSet:
	case Control_PosAdd:
	case Control_CtrlSet:
	case Control_AssertSpecial:
	case Control_ChangeAnim:
	case Control_ChangeState:
	case Control_FallEnvShake:
	case 87:
		ParseNormalAction(tok, StateManager);
		break;
	case Control_PlaySnd:
		ParseSndAction(tok, StateManager);
	default:
		while (!tok.CheckToken("[", false) && !tok.AtEndOfFile())
			tok.GetToken();
	}

}

bool CStateParser::ParseStateBaseParm(CTokenizer &tok, CStateManager &StateManager)
{
	// 基本的解析persistent" and "ignorehitpause"
	if (tok.CheckToken("persistent"))
	{
		if (!tok.CheckToken("="))
			Error("expected =", tok);

		EvaluateExpression(tok, StateManager);
		StateManager.SetPersistent();
		return true;
		// 设置当前state的参数
	}
	else if (tok.CheckToken("ignorehitpause"))
	{
		if (!tok.CheckToken("="))
			Error("expected =", tok);

		EvaluateExpression(tok, StateManager);
		StateManager.SetIgnorehitpause();
		return true;
	}
	else
	{
		return false;
	}
}
void CStateParser::ParseSndAction(CTokenizer &tok, CStateManager &StateManager){

	if (tok.CheckToken("value"))
	{
		tok.CheckToken("=");

		const char *str = tok.GetToken();
		SNDFLAG flag;
		u8 num1, num2;
		if (str[0] == 'F' || str[0] == 'f'){
			flag = COMMON;
			num1 = atoi(str + 1);
		}
		else if (str[0] == 'S' || str[0] == 's'){
			flag = PLAYER;
			num1 = atoi(str + 1);
		}
		else {
			flag = PLAYER;
			num1 = atoi(str);
		}
		
		if (tok.CheckToken(",")){
			num2 = tok.GetInt();
		}
		// 设置当前state的参数
		StateManager.SetParamNum(CPN_value,num1,num2,flag);
	}
	else if (tok.CheckToken("volumescale"))
	{
		tok.CheckToken("=");
		StateManager.SetParamNum(CPN_volumescale, tok.GetInt());
	}
	else if (tok.CheckToken("channel"))
	{
		tok.CheckToken("=");
		StateManager.SetParamNum(CPN_channel, tok.GetInt());
	}
	else if (tok.CheckToken("lowpriority"))
	{
		tok.CheckToken("=");
		StateManager.SetParamNum(CPN_lowpriority, tok.GetInt());
	}
	else if (tok.CheckToken("freqmul"))
	{
		tok.CheckToken("=");
		StateManager.SetParamNum(CPN_freqmul, tok.GetInt());
	}
	else if (tok.CheckToken("loop"))
	{
		tok.CheckToken("=");
		StateManager.SetParamNum(CPN_loop, tok.GetInt());
	}
	else if (tok.CheckToken("pan"))
	{
		tok.CheckToken("=");
		StateManager.SetParamNum(CPN_pan, tok.GetInt());
	}
	else if (tok.CheckToken("abspan"))
	{
		tok.CheckToken("=");
		StateManager.SetParamNum(CPN_abspan, tok.GetInt());
	}
	else{
		tok.GetToken();
		//Error("control param is not deal! =", tok);
	}
}
void CStateParser::ParseNormalAction(CTokenizer &tok, CStateManager &StateManager)
{
	//CHANGESTATE *temp=(CHANGESTATE*) m_pAlloc->Alloc(sizeof(CHANGESTATE));
	//TODO:Check for Required parameters and print error msg

	StateManager.NewInst();
	if (tok.CheckToken("value"))
	{
		if (!tok.CheckToken("="))
			Error("expected =", tok);

		EvaluateExpression(tok, StateManager);
		StateManager.SetParam(CPN_value);
	}
	else if (tok.CheckToken("ctrl"))
	{
		if (!tok.CheckToken("="))
			Error("expected =", tok);

		EvaluateExpression(tok, StateManager);
		StateManager.SetParam(CPN_ctrl);
	}
	else if (tok.CheckToken("anim"))
	{
		if (!tok.CheckToken("="))
			Error("expected =", tok);

		EvaluateExpression(tok, StateManager);
		StateManager.SetParam(CPN_anim);
	}
	else if (tok.CheckToken("x"))
	{
		if (!tok.CheckToken("="))
			Error("expected =", tok);

		EvaluateExpression(tok, StateManager);
		StateManager.SetParam(CPN_x);
	}
	else if (tok.CheckToken("y"))
	{
		if (!tok.CheckToken("="))
			Error("expected =", tok);

		EvaluateExpression(tok, StateManager);
		StateManager.SetParam(CPN_y);
	}
	else if (tok.CheckToken("sysvar") || tok.CheckToken("var"))
	{
		if (!tok.CheckToken("("))
		{
		}
		int num = tok.GetInt();
		if (!tok.CheckToken(")"))
		{
		}
		if (!tok.CheckToken("="))
			Error("expected =", tok);
		EvaluateExpression(tok, StateManager);
		StateManager.SetParamNum(CPN_sysvar, num);
	}
	else if (tok.CheckToken("flag"))
	{
		if (!tok.CheckToken("="))
			Error("expected =", tok);
		StateManager.AddInstruction(OP_PUSH, (float)GetFlagNum(tok.GetToken()), "#");
		StateManager.SetParam(CPN_flag);
	}
	else if (tok.CheckToken("pos"))
	{
		while (!tok.AtEndOfLine()){
			tok.GetToken();
		}
	}
	else if (tok.CheckToken("sprpriority"))
	{
		if (!tok.CheckToken("="))
		{
		}
		EvaluateExpression(tok, StateManager);
		StateManager.SetParam(CPN_sprpriority);
	}
	else{
		tok.GetToken();
		//Error("control param is not deal! =", tok);
	}

	////Skip useless stuff
	//while( !tok.AtEndOfLine() ){
	//	Error("expresstion is not deal! =",tok);
	//	tok.GetToken();
	//}
	StateManager.NewInst();
}


HITDEFVARSET CStateParser::GetHitVarSet(CTokenizer &tok, PARSERVAR PV, bool b){
	HITDEFVARSET hitVarSet;
	switch (PV)
	{
	case P_F:
		hitVarSet.fVar1 = tok.GetFloat();
		break;
	case P_FF:
		hitVarSet.fVar1 = tok.GetFloat();
		if (tok.CheckToken(",")){
			hitVarSet.fVar2 = tok.GetFloat();
		}
		break;
	case P_H:
		hitVarSet.hVar1 = GetHDV(tok.GetToken(), b);
		break;
	case P_HH:
		hitVarSet.hVar1 = GetHDV(tok.GetToken(), b);
		if (tok.CheckToken(",")){
			hitVarSet.hVar2 = GetHDV(tok.GetToken(), b);
		}
		break;
	case P_U:
		hitVarSet.uVar1 = tok.GetInt();
		break;
	case P_UU:
		hitVarSet.uVar1 = tok.GetInt();
		if (tok.CheckToken(",")){
			hitVarSet.uVar2 = tok.GetInt();
		}
		break;
	case P_SS:
		hitVarSet.sVar1 = tok.GetInt();
		if (tok.CheckToken(",")){
			hitVarSet.sVar2 = tok.GetInt();
		}
		break;
	case P_UH:
		hitVarSet.uVar1 = tok.GetInt();
		if (tok.CheckToken(",")){
			hitVarSet.hVar1 = GetHDV(tok.GetToken(), b);
		}
		break;
	case P_S:
		break;
	case P_B:
	{
				hitVarSet.bVar1 = tok.GetBool();
	}
		break;
	case P_BU:
	{
				 const char *str = tok.GetToken();
				 hitVarSet.bVar1 = false;
				 if (str[0] == 'S' || str[0] == 's'){
					 hitVarSet.bVar1 = true;
				 }
				 hitVarSet.uVar1 = atoi(str+1);
	}
		break;
	case P_BUU:
	{
				  const char *str = tok.GetToken();
				  hitVarSet.bVar1 = false;
				  if (str[0] == 'S' || str[0] == 's'){
					  hitVarSet.flag = PLAYER;
					  hitVarSet.uVar1 = atoi(str + 1);
				  }
				  else{
					 hitVarSet.flag = FIGHT;
				  hitVarSet.uVar1 = atoi(str);
				}
				  if (tok.CheckToken(",")){
					  hitVarSet.uVar2 = tok.GetInt();
				  }
	}
	default:
		break;
	}
	return hitVarSet;
}
#define PARSE_HITDEF_PARAM(param,HVS) else if( tok.CheckToken(#param) )\
{\
if (!tok.CheckToken("="))\
	Error("expected =", tok); \
	StateManager.SetHDParam(CHD_##param, HVS); \
}
#define PARSE_HITDEF_PARAM2(param1,param2,param3,HVS) else if( tok.CheckToken(#param3) )\
{\
if (!tok.CheckToken("="))\
	Error("expected =", tok); \
	StateManager.SetHDParam(CHD_##param1##_##param2, HVS); \
}

void CStateParser::ParseHitDef(CTokenizer &tok, CStateManager &StateManager)
{
	//TODO:Check for Required parameters and print error msg
	StateManager.NewInst();

	if (tok.CheckToken("attr")) // two param
	{
		if (!tok.CheckToken("="))
			Error("expected =", tok);

		//EvaluateExpression(tok, StateManager);
		// 设置当前state的参数
		StateManager.SetHDParam(CHD_attr, GetHitVarSet(tok, P_HH));
	}
	PARSE_HITDEF_PARAM(damage, GetHitVarSet(tok, P_SS))
		PARSE_HITDEF_PARAM(hitflag, GetHitVarSet(tok, P_H))
		PARSE_HITDEF_PARAM(guardflag, GetHitVarSet(tok, P_H))
		PARSE_HITDEF_PARAM(affectteam, GetHitVarSet(tok, P_H))
		PARSE_HITDEF_PARAM(animtype, GetHitVarSet(tok, P_H, false))

		PARSE_HITDEF_PARAM2(air, animtype, air.animtype, GetHitVarSet(tok, P_H, false))
		PARSE_HITDEF_PARAM2(fall, animtype, fall.animtype, GetHitVarSet(tok, P_H, false))
		PARSE_HITDEF_PARAM(priority, GetHitVarSet(tok, P_UH))
		PARSE_HITDEF_PARAM(damage, GetHitVarSet(tok, P_UU))
		PARSE_HITDEF_PARAM(pausetime, GetHitVarSet(tok, P_UU))
		PARSE_HITDEF_PARAM2(guard, pausetime, guard.pausetime, GetHitVarSet(tok, P_UU))
		PARSE_HITDEF_PARAM(sparkno, GetHitVarSet(tok, P_BU))
		PARSE_HITDEF_PARAM2(guard, sparkno, guard.sparkno, GetHitVarSet(tok, P_BU))
		PARSE_HITDEF_PARAM(sparkxy, GetHitVarSet(tok, P_FF))
		PARSE_HITDEF_PARAM(hitsound, GetHitVarSet(tok, P_BUU))
		PARSE_HITDEF_PARAM(guardsound, GetHitVarSet(tok, P_BUU))

		PARSE_HITDEF_PARAM2(guard, type, guard.type, GetHitVarSet(tok, P_H))
		PARSE_HITDEF_PARAM2(guard, slidetime, guard.slidetime, GetHitVarSet(tok, P_U))
		PARSE_HITDEF_PARAM2(guard, hittime, guard.hittime, GetHitVarSet(tok, P_U))
		PARSE_HITDEF_PARAM2(ground, type, ground.type, GetHitVarSet(tok, P_H))
		PARSE_HITDEF_PARAM2(ground, slidetime, ground.slidetime, GetHitVarSet(tok, P_U))
		PARSE_HITDEF_PARAM2(ground, hittime, ground.hittime, GetHitVarSet(tok, P_U))
		PARSE_HITDEF_PARAM2(air, type, air.type, GetHitVarSet(tok, P_H))
		PARSE_HITDEF_PARAM2(air, hittime, air.hittime, GetHitVarSet(tok, P_U))
		PARSE_HITDEF_PARAM2(guard, ctrltime, guard.ctrltime, GetHitVarSet(tok, P_U))
		PARSE_HITDEF_PARAM2(guard, dist, guard.dist, GetHitVarSet(tok, P_U))
		PARSE_HITDEF_PARAM(yaccel, GetHitVarSet(tok, P_F))
		PARSE_HITDEF_PARAM2(ground, velocity, ground.velocity, GetHitVarSet(tok, P_FF))
		PARSE_HITDEF_PARAM2(guard, velocity, guard.velocity, GetHitVarSet(tok, P_F))
		PARSE_HITDEF_PARAM2(air, velocity, air.velocity, GetHitVarSet(tok, P_FF))
		PARSE_HITDEF_PARAM2(airguard, velocity, airguard.velocity, GetHitVarSet(tok, P_FF))

		PARSE_HITDEF_PARAM(fall,GetHitVarSet(tok, P_B))
		/*
		fall.xvelocity = x_velocity(float)
		fall.yvelocity = y_velocity(float)
		fall.recover = bvalue(何匡)
		fall.recovertime = recover_time(int)
		fall.damage = damage_amt(int)
		
		PARSE_HITDEF_PARAM3(ground, cornerpush, veloff, GetHitVarSet(tok, P_F))
		PARSE_HITDEF_PARAM3(air, cornerpush, veloff, GetHitVarSet(tok, P_F))
		PARSE_HITDEF_PARAM3(down, cornerpush, veloff, GetHitVarSet(tok, P_F))
		PARSE_HITDEF_PARAM3(guard, cornerpush, veloff, GetHitVarSet(tok, P_F))
		PARSE_HITDEF_PARAM3(airguard, cornerpush, veloff, GetHitVarSet(tok, P_F))
		PARSE_HITDEF_PARAM2(airguard, ctrltime, GetHitVarSet(tok, P_U))


		air.juggle = juggle_points (int)
		mindist = x_pos , y_pos (int, int)
		maxdist = x_pos , y_pos (int, int)
		snap = x_pos , y_pos (int, int)
		p1sprpriority = drawing_priority (int)
		p2sprpriority = drawing_priority (int)
		p1facing = facing (int)
		p1getp2facing = facing (int)
		p2facing = facing (int)
		p1stateno = state_no (int)
		p2stateno = state_no (int)
		p2getp1state = bvalue (何匡)
		forcestand = bvalue (何匡)
		
		air.fall = bvalue (何匡)
		forcenofall = bvalue (何匡)
		down.velocity = x_velocity , y_velocity (float, float)
		down.hittime = hit_time (int)
		down.bounce = bvalue (何匡)
		id = id_number (int)
		chainID = id_number (int)
		nochainID = nochain_1 , nochain_2 (int)
		hitonce = hitonce_flag (何匡)
		kill = bvalue (boolean)
		guard.kill = bvalue (何匡)
		fall.kill = bvalue (何匡)
		numhits = hit_count (int)
		getpower = p1power , p1gpower (int, int)
		givepower = p2power , p2gpower (int, int)
		palfx.time = palfx_time (int)
		palfx.mul = r1 , g1 , b1 (int, int, int)
		palfx.add = r2 , g2 , b2 (int, int, int)
		envshake.time = envshake_time (int)
		envshake.freq = envshake_freq (float)
		envshake.ampl = envshake_ampl (int)
		envshake.phase = envshake_phase (float)
		fall.envshake.time = envshake_time (int)
		fall.envshake.freq = envshake_freq (float)
		fall.envshake.ampl = envshake_ampl (int)
		fall.envshake.phase = envshake_phase (float)
		*/
	else{
		if (!bParserLoop){
			PrintMessage("not passing - %s",tok.GetToken());
			
			bParserLoop = true;
		}
		else
			bParserLoop = false;
	}
	StateManager.NewInst();
}
HITDEFVAR CStateParser::GetHDV(const char* hdv, bool b){
	int i = 0;
	while (i < HITDEFVARNUM)
	{
		if (b ? (_strcmpi(hdv, strHitDefVar[i]) == 0) : (_strnicmp(hdv, strHitDefVar[i], 1) == 0))
			return HITDEFVAR(i+1);
		i++;
	}
	return HITDEFVAR(HITDEFVARNUM);
}