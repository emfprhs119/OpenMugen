#include "global.h"
#include "Input.h"

//is for debug output
char *strState[] = {
	"stand",
	"crouch",
	"air",
	"liedown",
	"attack",
	"idle",
	"hit",
	"none",
	"unchange" };
/*
================================================================================
Main Player class which represents one Player
Handels everything the loading and acting of the player

Todo:
Change CSffManager,CAirManager,CStateManager to pointers
to add a CreateHelper function which returns a new Player
instace which will be a copy of its parent

================================================================================
*/

CPlayer::CPlayer()
{
	bRightFaced = true;
	bAlive = true;
	bDebugInfo = false;
	bHitDefPresit = false;
	bHitCounterPresit = false;
	bMoveHitPresit = false;
	bHitDef = false;
	bCtrl = true;
	nLife = 1000;
	nPower = 1000;
	nStateTime = 0;
	nStateType = 0;
	nPhysic = 0;
	nMoveType = 0;
	x = y = 0;
	xVel = 0;
	yVel = 0;
	//InitFunctTable();
}
void CPlayer::Init()
{
	nLife = myPlayerConst.PlayerData.nLife;
	nPower = myPlayerConst.PlayerData.nPower;
	nLieDownTime = myPlayerConst.PlayerData.nLieDownTime;

	
}
CPlayer::~CPlayer()
{

}

void CPlayer::SetKeyBoard(int playerid)
{
	Uint16 Player1_KeyArr[12];// = "wsadyuchjkopl";
	char Player2_KeyArr[] = "qqqqqqqqqqqqq";
	Player1_KeyArr[0] = 273;
	Player1_KeyArr[1] = 274;
	Player1_KeyArr[2] = 276;
	Player1_KeyArr[3] = 275;

	Player1_KeyArr[4] = 'a';
	Player1_KeyArr[5] = 's';
	Player1_KeyArr[6] = 'd';
	Player1_KeyArr[7] = 'z';
	Player1_KeyArr[8] = 'x';
	Player1_KeyArr[9] = 'c';

	Player1_KeyArr[10] = '1';
	Player1_KeyArr[11] = 'p';

	m_keyData = (KEYBOARDDATA*)m_pAlloc->Alloc(sizeof(KEYBOARDDATA));
	m_keyData->bKeyBoard = true;
	switch (playerid)
	{
	case P1:
		//Process keyboard input
		for (int k = 0; k < 12; k++)
		{
			m_keyData->keyInfo[k].sdlKeycode = (Uint16)Player1_KeyArr[k];
		}
		break;
	case P2:
		//Process keyboard input
		for (int k = 0; k < KEY_COUNT; k++)
		{
			m_keyData->keyInfo[k].sdlKeycode = (Uint16)Player2_KeyArr[k];
		}
		break;
	default:
		break;
	}
}
//Set all the pointers to all the managers
void CPlayer::SetPointers(CVideoSystem *p, CAllocater *a, CGameTimer *t)
{
	m_pAlloc = a;
	m_pVideoSystem = p;
	m_pTimer = t;

	m_SffManager.SetPointers(p, a, t, &m_AirManager);
	m_StateManager.SetAlloc(a);
	m_AirManager.SetAlloc(a);
	m_CmdManager.SetGameTimer(t);


}

CharFileInfo ParseDefFile(const char* strPlayer){
	CharFileInfo info;
	char* sep[] = { "=", "," };
	CTokenizer tok(256, NULL, sep, 2);
	//CTokenizer tok;
	char* file;
	int palNum = 0;
	int palDNum = 0;
	u16 SizeOfFileName = 256;
	file = (char*)malloc(sizeof(char)*SizeOfFileName);
	sprintf_s(file, SizeOfFileName, "%s/", strPlayer);
	strcpy_s(info.cmd, SizeOfFileName, file);
	strcpy_s(info.cns, SizeOfFileName, file);
	strcpy_s(info.st, SizeOfFileName, file);
	//strcpy(info.stcommon, file);
	strcpy_s(info.sprite, SizeOfFileName, file);
	strcpy_s(info.anim, SizeOfFileName, file);
	strcpy_s(info.sound, SizeOfFileName, file);
	strcpy_s(info.ai, SizeOfFileName, file);
	for (int i = 0; i < 12; i++){
		strcpy_s(info.pal[i], SizeOfFileName, file);
	}
	sprintf_s(file, SizeOfFileName,  "%s/%s.def", strPlayer, strPlayer);

	if (!tok.OpenFile(file))
	{
		throw(CError(" : Can't open %s", file));
	}
	//info 
	//files
	while (!tok.AtEndOfFile()){
		if (tok.CheckToken("name")){
			if (tok.CheckToken("="))
			{
				strcpy_s(info.name, SizeOfFileName, tok.GetToken());
			}
		}
		else if (tok.CheckToken("displayname")){
			if (tok.CheckToken("="))
			{
				strcpy_s(info.displayname, SizeOfFileName, tok.GetToken());
			}
		}
		else if (tok.CheckToken("versiondate")){
			if (tok.CheckToken("="))
			{
				strcpy_s(info.versiondate, 15, tok.GetToken());
			}
		}
		else if (tok.CheckToken("mugenversion")){
			if (tok.CheckToken("="))
			{
				strcpy_s(info.mugenversion, 5, tok.GetToken());
			}
		}
		else if (tok.CheckToken("author")){
			if (tok.CheckToken("="))
			{
				strcpy_s(info.author, SizeOfFileName, tok.GetToken());
			}
		}
		else if (tok.CheckToken("localcoord")){
			if (tok.CheckToken("="))
			{
				info.localcoord = tok.getXYVALUE();
			}
		}
		else if (tok.CheckToken("cmd"))
		{
			if (tok.CheckToken("="))
			{
				strcat_s(info.cmd, tok.GetToken());
			}
		}
		else if (tok.CheckToken("cns"))
		{
			if (tok.CheckToken("="))
			{
				strcat_s(info.cns, tok.GetToken());
			}
		}
		else if (tok.CheckToken("st"))
		{
			if (tok.CheckToken("="))
			{
				strcat_s(info.st, tok.GetToken());
			}
		}
		else if (tok.CheckToken("stcommon"))
		{
			if (tok.CheckToken("="))
			{
				strcpy_s(info.stcommon, SizeOfFileName, tok.GetToken());
			}
		}
		else if (tok.CheckToken("sprite"))
		{
			if (tok.CheckToken("="))
			{
				strcat_s(info.sprite, tok.GetToken());
			}
		}
		else if (tok.CheckToken("anim"))
		{
			if (tok.CheckToken("="))
			{
				strcat_s(info.anim, tok.GetToken());
			}
		}
		else if (tok.CheckToken("sound"))
		{
			if (tok.CheckToken("="))
			{
				strcat_s(info.sound, tok.GetToken());
			}
		}
		else if (tok.CheckToken("ai"))
		{
			if (tok.CheckToken("="))
			{
				strcat_s(info.ai, tok.GetToken());
			}
		}
		else if (tok.CheckToken("pal.defaults"))
		{

			if (tok.CheckToken("="))
			{
				while (!tok.AtEndOfLine()){

					info.pal_defaults[palDNum++] = tok.GetInt() - 1;
					tok.GetToken();
				}
			}
		}
		else if (tok.CheckNToken("pal", 3))
		{

			if (tok.CheckToken("="))
			{
				strcat_s(info.pal[palNum++], tok.GetToken());
			}
		}
		else
			tok.GetToken();
	}
	printf("%s %s\n", info.cmd, info.cns);
	return info;
}


//Load the player by his given .def filename
//ToDo:Handel the .def file loading
bool CPlayer::LoadPlayer(const char* strPlayer)
{

	defInfo = ParseDefFile(strPlayer);
	CStateParser StateParser;
	//rest memory allocater    
	m_pAlloc->ResetAllocater();

	m_SffManager.ResetManager();

	m_StateManager.Reset();
	PrintMessage("state ok\n");
	m_AirManager.ResetManager();


	m_CmdManager.LoadCMDFile(defInfo.cmd, m_pAlloc);
	PrintMessage("cmd ok\n");
	StateParser.SetCmdManager(&m_CmdManager);

	StateParser.ParseStateFile(defInfo.cmd, m_StateManager, m_pAlloc);
	StateParser.ParseStateFile("common.cmd", m_StateManager, m_pAlloc);
	PrintMessage("state -1 cmd ok\n");
	StateParser.ParseConstFile(defInfo.cns, &myPlayerConst);
	PrintMessage("const ok\n");
	StateParser.ParseStateFile(defInfo.stcommon, m_StateManager, m_pAlloc);
	StateParser.ParseStateFile(defInfo.cns, m_StateManager, m_pAlloc);
	PrintMessage("state num ok\n");
	m_AirManager.OpenAir(defInfo.anim);
	PrintMessage("anim ok\n");

	m_SffManager.LoadActToSff(defInfo.pal[defInfo.pal_defaults[3]]);
	m_SffManager.LoadSffFile(defInfo.sprite);
	//m_SndManager.LoadSndFile("common.snd", m_pAlloc, COMMON);
	//m_SndManager.LoadSndFile("fight.snd", m_pAlloc,FIGHT);
	//m_SndManager.LoadSndFile(defInfo.sound, m_pAlloc,PLAYER);
	//Make always masked blit
	m_SffManager.SetBltFlags(CSffManager::BLT_NORMALMASKED);
	m_SffManager.PrepareAnim(0);
	Init();
	ChangeState(0);
	
	return true;
}


/*
================================================================================
Checks all the triggers in the current state
================================================================================
*/
bool CPlayer::CheckState(PLSTATE* tempState)
{
	if (tempState->nStateNumber == 40){
		//bool a=GetBCommand()[40];//holdfwd

		printf("");
	}
	bool bTriggerAll = true;
	bool bTrigger = true;
	PLTRIGGER trigger;
	int triggNum = 1;
	for (int i = 0; i < tempState->nHowManyTriggerAlls; i++)
	{
		trigger = tempState->triggerAlls[i];
		bTriggerAll = bTriggerAll && (m_pVMachine->Execute(trigger.pInts)>0 ? 1 : 0);
	}
	if (!bTriggerAll)
		return false;

	if (0 < tempState->nHowManyTriggers)
		trigger = tempState->triggers[0];

	for (int i = 0; i<tempState->nHowManyTriggers; )
	{
		bTrigger = true;
		do{
			bTrigger = bTrigger & (m_pVMachine->Execute(trigger.pInts)>0 ? 1 : 0);
			i++;
			if (bTrigger)
			if (i == tempState->nHowManyTriggers)
				break;
			trigger = tempState->triggers[i];
		} while (triggNum == trigger.triggNum);
		triggNum++;
		if (bTrigger)
			return true;
	}
	return (bTriggerAll && bTrigger);
}

bool CPlayer::ExecuteController(PLSTATE* tempState)
{
	PrintMessage("%s, exec func no:%d, %s", this->GetPlayerName(), tempState->nType, strControllerTypes[tempState->nType]);
	//Execute the function
	PLSTATEDEF *tmpIpCurrStatedef = lpCurrStatedef;
	Execute(tempState);
	if (tempState->nStateNumber == 5001){
		printf("");
	}
	if (lpCurrStatedef != tmpIpCurrStatedef)
		return true;
	return false;
}

//updates all interlal stuff of the player
void CPlayer::UpDatePlayer()
{

	//	CInput::ProcessInput(m_keyData);
	Uint8 *keystate = SDL_GetKeyState(NULL);
	//Process keyboard input
	if (m_keyData->bKeyBoard)
	{
		for (int k = 0; k < KEY_COUNT; k++)
		{
			m_keyData->keyInfo[k].isPressed = keystate[m_keyData->keyInfo[k].sdlKeycode];
		}
	}

	m_CmdManager.Update(m_keyData, bRightFaced);
	
	HandleFLAG();
	HandleFSM();
	HandlePhysic();
	UpDateFacing();
	UpDateFriction();

	nAssertSpecial = tmpAssertSpecial;
	tmpAssertSpecial = 0;

	nStateTime++;
	
}
/*
================================================================================
Handles the players Physic
================================================================================
*/
/*
================================================================================
Handles the FSM of the player
-checks all trigger
-and activate controllers
================================================================================
*/
void CPlayer::HandleFLAG(){
	if (nLieDownTime == 0){
		ChangeState(5120);
		nLieDownTime = myPlayerConst.PlayerData.nLieDownTime;
	}
	if (lpCurrStatedef->StateNumber == 5110){
		nLieDownTime--;
	}
	if (bHitGetDef && !(lpCurrStatedef->StateNumber == 5000) && other->hitVardata.hitshaketime > 0){
		ChangeState(5000);
	}

	if (bHitDef && hitVardata.pausetime > 0){
		if (!bPrevHitDef){
			//m_SndManager.PlayAudio(hitVardata.hitsound_snd_flag, hitVardata.hitsound_snd_grp, hitVardata.hitsound_snd_item);
			bPrevHitDef = true;
		}
		hitVardata.pausetime -= hitVardata.pausetime == 1 ? 1 : 2;
		//m_SffManager.SetNext(false);
	}
	else if (bHitGetDef && other->hitVardata.ground_hittime >= 0){
		if (other->hitVardata.hitshaketime == 0)
			other->hitVardata.ground_hittime--;
		if (other->hitVardata.hitshaketime>0)
			other->hitVardata.hitshaketime--;
	}
	else{
		bPrevHitDef = false;
		bHitDef = false;
		bHitGetDef = false;
		//m_SffManager.SetNext(true);
	}
}
void CPlayer::HandleFSM()
{
	PLSTATEDEF *specialState = this->m_StateManager.GetStateDef(-1);
	//check every state in this statedef
	if (bCtrl && !bHitGetDef){
		for (u16 i = 0; i < specialState->nHowManyState; i++)
		{
			if (CheckState(&specialState->lpState[i])){
				ExecuteController(&specialState->lpState[i]);
				break;
			}
		}
	}
	if (lpCurrStatedef->StateNumber == 400){
		printf("");
	}
	//check every state in this statedef
	for (u16 i = 0; i < lpCurrStatedef->nHowManyState; i++)
	{

		if (CheckState(&lpCurrStatedef->lpState[i]))
		if (
			ExecuteController(&lpCurrStatedef->lpState[i]))
			i = -1;
	}

}
void CPlayer::HandlePhysic()
{
	AddPos(xVel, yVel);

	Element *MyEle = m_SffManager.GetCurrAnimation()->AnimationElement + m_SffManager.GetCurrAnimation()->nCurrentImage;
	Element *OtherEle = other->m_SffManager.GetCurrAnimation()->AnimationElement + other->m_SffManager.GetCurrAnimation()->nCurrentImage;
	ClsnRECT MyRect;
	ClsnRECT OtherRect;
	for (int i = 0; i < MyEle->nNumberOfClsn1 && !bHitDef; i++){
		for (int j = 0; j < OtherEle->nNumberOfClsn2 && !bHitDef; j++){
			MyRect = (MyEle->pClsn1Data + i)->ClsnRect; 
			OtherRect = (OtherEle->pClsn2Data + j)->ClsnRect;
			if (!bRightFaced){
				MyRect.x = -(MyEle->pClsn1Data + i)->ClsnRect.w;
				MyRect.w = -(MyEle->pClsn1Data + i)->ClsnRect.x;
			}
			if (!other->bRightFaced){
				OtherRect.x = -(OtherEle->pClsn2Data + j)->ClsnRect.w;
				OtherRect.w = -(OtherEle->pClsn2Data + j)->ClsnRect.x;
			}
			bHitDef = ChackHitClsn(x, y, MyRect, other->x, other->y, OtherRect);
		}
	}

	for (int j = 0; j < OtherEle->nNumberOfClsn1 && !bHitGetDef; j++){
		for (int i = 0; i < MyEle->nNumberOfClsn2 && !bHitGetDef; i++){
			MyRect = (MyEle->pClsn2Data + i)->ClsnRect;
			OtherRect = (OtherEle->pClsn1Data + j)->ClsnRect;
			if (!bRightFaced){
				MyRect.x = -(MyEle->pClsn2Data + i)->ClsnRect.w;
				MyRect.w = -(MyEle->pClsn2Data + i)->ClsnRect.x;
			}
			if (!other->bRightFaced){
				OtherRect.x = -(OtherEle->pClsn1Data + j)->ClsnRect.w;
				OtherRect.w = -(OtherEle->pClsn1Data + j)->ClsnRect.x;
			}
			bHitGetDef = ChackHitClsn(other->x, other->y, OtherRect, x, y, MyRect);

		}
	}


}

bool CPlayer::ChackHitClsn(float x, float y, ClsnRECT a, float x2, float y2, ClsnRECT b){
	if (x + a.x> x2 + b.w ){
		return false;
	}
	
	else if (y + a.y > y2 + b.h){
		return false;
	}
	
	else if (x + a.w < x2 + b.x ){
		return false;
	}
	
	else if (y + a.h < y2 + b.y){
		return false;
	}
	
	return true;
}
void CPlayer::UpDateFacing()
{
	if ((nAssertSpecial & noautoturn) == 0 && nStateType == stand){
		if (other->x > x)
			bRightFaced = true;
		else
			bRightFaced = false;
	}
	if (bRightFaced)
		m_SffManager.SetBltFlags(CSffManager::BLT_NORMALMASKED);
	else
		m_SffManager.SetBltFlags(CSffManager::BLT_FLIPHMASKED);

}
void CPlayer::UpDateFriction(){
	if (y - nGround<0)
		yVel += myPlayerConst.PlayerMovement.yaccel;
	else if (y - nGround>0){
		if (lpCurrStatedef->StateNumber < 5000 || lpCurrStatedef->StateNumber > 5210){
			yVel = 0;
			y = nGround;

			nStateType = stand;
			nPhysic = stand;
			bCtrl = true;
			ChangeState(0);
		}
	}
	if (nStateType == stand){
		if (xVel > 0)
			xVel -= myPlayerConst.PlayerMovement.StandFriction;
		else if (xVel < 0)
			xVel += myPlayerConst.PlayerMovement.StandFriction;
	}
	if (nStateType == crouch){
		if (xVel > 0)
			xVel -= myPlayerConst.PlayerMovement.CrouchFriction;
		else if (xVel < 0)
			xVel += myPlayerConst.PlayerMovement.CrouchFriction;
	}
	
	if (x < 0)
		x = 0;
		
	/*
	if (x > 305)
		x = 305;

	*/
}
//draw debug info of the player
void CPlayer::Debug()
{
	ActionElement *Anim = m_SffManager.GetCurrAnimation();

	//Print information about the current Animation
	m_pVideoSystem->DrawText(0, 10, "Action %3i | AnimElem %3i/%3i | AnimTime %3i/%3i ", Anim->nActionNumber
		, Anim->nCurrentImage + 1
		, Anim->nNumberOfElements
		, Anim->nCurrTime
		, Anim->nCompletAnimTime);

	m_pVideoSystem->DrawText(0, 20, "StateType=%s | MoveType=%s | Physic=%s", strState[nStateType],
		strState[nMoveType],
		strState[nPhysic]);
	m_pVideoSystem->DrawText(0, 30, "x=%3f,y=%3f,xvel=%3f,yvel=%3f", x, y - nGround, xVel, yVel);
	m_pVideoSystem->DrawText(0, 40, "HitDef %i | State %i | StateTime %i | Power %i", bHitDef,
		lpCurrStatedef->StateNumber,
		this->nStateTime, nPower);



}

//Change State controller
void CPlayer::ChangeState(s32 nStateNumber)
{
	//restet StateTime 
	if (nStateNumber == 5030)
		printf("");
	nStateTime = 0;
	//get the statedef
	if (lpCurrStatedef != nullptr)
		nPrevStateno = GetStateNo();
	lpCurrStatedef = m_StateManager.GetStateDef(nStateNumber);

	//Set StateType
	if (lpCurrStatedef->type != untouch)
		nStateType = lpCurrStatedef->type;
	//Set Physic    
	if (lpCurrStatedef->physics != untouch)
		nPhysic = lpCurrStatedef->physics;

	if (lpCurrStatedef->movetype != untouch)
		nMoveType = lpCurrStatedef->movetype;
	//Set the Ctrl flag  
	if (lpCurrStatedef->nCtrl != -1){
		bCtrl = (lpCurrStatedef->nCtrl == 1);
	}

	bHitDefPresit = lpCurrStatedef->bHitdefpersist;
	bHitCounterPresit = lpCurrStatedef->bHitcountpersist;
	bMoveHitPresit = lpCurrStatedef->bMovehitpersist;

	//change anim if needed
	if (lpCurrStatedef->nAnim != -1){
		nAnimNumber = lpCurrStatedef->nAnim;
		m_SffManager.PrepareAnim(lpCurrStatedef->nAnim);
	}
	if (lpCurrStatedef->Velset.x != -3333)
		xVel = lpCurrStatedef->Velset.x;

	if (lpCurrStatedef->Velset.y != -3333)
		yVel = lpCurrStatedef->Velset.y;

	if (lpCurrStatedef->nSprpriority != 255)
		nSprPrio = lpCurrStatedef->nSprpriority;

	if (lpCurrStatedef->nPoweradd != -3333)
		nPower += lpCurrStatedef->nPoweradd;

	if (lpCurrStatedef->nJuggle != -3333)
		PrintMessage("TODO:Handel juggle parameter of Statedef");

	hitVardata.def = false;
}

//Draw the Player
void CPlayer::DrawPlayer()
{
	m_SffManager.BlitAnim((s16)x, (s16)y);
	if (bHitGetDef)
		m_SffManager.BlitAnim((s16)(x + other->hitVardata.sparkxy.x), (s16)(y + other->hitVardata.sparkxy.y), true);
	//draw debug info
	if (bDebugInfo)
		Debug();
}
/*
================================================================================
Trigger helpers
================================================================================
*/
bool CPlayer::IsAnimAviable(s32 nAnim)
{
	if (m_AirManager.GetAction(nAnim) == NULL)
		return false;
	else
		return true;
}


/*
================================================================================
control function
================================================================================
*/

void CPlayer::Execute(PLSTATE* state)
{

	if (state->nStateNumber == 400){
		printf("");
	}
	float value = 0;
	if (state->nType == Control_HitFallVel){
		xVel = hitVardata.fall_xvelocity;
		yVel = hitVardata.fall_yvelocity;
	}
	for (int i = 0; i < state->nParamCount; i++)
	{
		if (state->nType == Control_HitDef){
			if (hitVardata.def)
				break;
			else if (!hitVardata.reset){
				ResetHitVarData();
				hitVardata.reset = true;
			}
			CONTROLHITDEF param = state->pConHDParm[i];

			switch (param.nParam){
			case CHD_attr:hitVardata.attr1 = param.pHitVar.hVar1;
				hitVardata.attr2 = param.pHitVar.hVar2; break;
			case CHD_hitflag:break;
			case CHD_guardflag:hitVardata.guardflag = param.pHitVar.hVar1; break;
			case CHD_affectteam:break;
			case CHD_animtype:hitVardata.animtype = param.pHitVar.hVar1; break;
			case CHD_air_animtype:break;
			case CHD_fall_animtype:break;
			case CHD_priority:break;
			case CHD_damage:hitVardata.hit_damage = param.pHitVar.sVar1; break;
			case CHD_pausetime:if (hitVardata.pausetime == 0) hitVardata.pausetime = param.pHitVar.uVar1;
				if (hitVardata.hitshaketime == 0)hitVardata.hitshaketime = param.pHitVar.uVar2; break;
			case CHD_guard_pausetime:break;
			case CHD_sparkno:
				hitVardata.sparkno = param.pHitVar.uVar1;
				other->m_SffManager.PrepareAnim(hitVardata.sparkno, true);//remove
				break;
			case CHD_guard_sparkno:
				hitVardata.guard_sparkno = param.pHitVar.uVar1;
				break;
			case CHD_sparkxy:
				hitVardata.sparkxy = { param.pHitVar.fVar1, param.pHitVar.fVar2
				}; break;
			case CHD_hitsound:
				hitVardata.hitsound_snd_flag = param.pHitVar.flag;
				hitVardata.hitsound_snd_grp = param.pHitVar.uVar1;
				hitVardata.hitsound_snd_item = param.pHitVar.uVar2;
				break;
			case CHD_guardsound:break;
			case CHD_ground_type:hitVardata.ground_type = param.pHitVar.hVar1; break;
			case CHD_guard_type: break;
			case CHD_air_type:break;
			case CHD_ground_slidetime:hitVardata.ground_slidetime = param.pHitVar.uVar1; break;
			case CHD_guard_slidetime:break;
			case CHD_ground_hittime:hitVardata.ground_hittime = param.pHitVar.uVar1; break;
			case CHD_guard_hittime:break;
			case CHD_air_hittime:break;
			case CHD_guard_ctrltime:break;
			case CHD_guard_dist:break;
			case CHD_yaccel:hitVardata.yaccel = param.pHitVar.fVar1; break;
			case CHD_ground_velocity:hitVardata.ground_velocity = { param.pHitVar.fVar1, param.pHitVar.fVar2 }; break;
			case CHD_guard_velocity:break;
			case CHD_air_velocity:hitVardata.air_velocity = { param.pHitVar.fVar1, param.pHitVar.fVar2 }; break;
			case CHD_airguard_velocity:break;
			case CHD_ground_cornerpush_veloff:break;
			case CHD_air_cornerpush_veloff:break;
			case CHD_down_cornerpush_veloff:break;
			case CHD_guard_cornerpush_veloff:break;
			case CHD_airguard_cornerpush_veloff:break;
			case CHD_airguard_ctrltime:break;
			case CHD_air_juggle:break;
			case CHD_mindist:break;
			case CHD_maxdist:break;
			case CHD_snap:break;
			case CHD_p1sprpriority:break;
			case CHD_p2sprpriority:break;
			case CHD_p1facing:break;
			case CHD_p1getp2facing:break;
			case CHD_p2facing:break;
			case CHD_p1stateno:break;
			case CHD_p2stateno:break;
			case CHD_p2getp1state:break;
			case CHD_forcestand:break;
			case CHD_fall:hitVardata.fall=param.pHitVar.bVar1; break;
			case CHD_fall_xvelocity:break;
			case CHD_fall_yvelocity:break;
			case CHD_fall_recover:break;
			case CHD_fall_recovertime:break;
			case CHD_fall_damage:break;
			case CHD_air_fall:break;
			case CHD_forcenofall:break;
			case CHD_down_velocity:break;
			case CHD_down_hittime:break;
			case CHD_down_bounce:break;
			case CHD_id:break;
			case CHD_chainID:break;
			case CHD_nochainID:break;
			case CHD_hitonce:break;
			case CHD_kill:break;
			case CHD_guard_kill:break;
			case CHD_fall_kill:break;
			case CHD_numhits:break;
			case CHD_getpower:break;
			case CHD_givepower:break;
			case CHD_palfx_time:break;
			case CHD_palfx_mul:break;
			case CHD_palfx_add:break;
			case CHD_envshake_time:break;
			case CHD_envshake_freq:break;
			case CHD_envshake_ampl:break;
			case CHD_envshake_phase:break;
			case CHD_fall_envshake_time:break;
			case CHD_fall_envshake_freq:break;
			case CHD_fall_envshake_ampl:break;
			case CHD_fall_envshake_phase:break;
				//case CHD_attr:other.damage(param.); break;
			}
			if (i == state->nParamCount - 1){
				hitVardata.def = true;
				hitVardata.reset = false;
			}
		}
		else if (state->nType == Control_PlaySnd){
			CONTROLLERPARAMS param = state->pConParm[i];
			switch (param.nParam){
			case CPN_value:
				 //m_SndManager.PlayAudio(param.flag, param.vNum, param.vNum1); break;
			case CPN_volumescale:break;
			case CPN_channel:break;
			case CPN_lowpriority:break;
			case CPN_freqmul:break;
			case CPN_loop:break;
			case CPN_pan:break;
			case CPN_abspan:break;
			}break;
		}
		else{
			CONTROLLERPARAMS param = state->pConParm[i];
			value = this->m_pVMachine->Execute(param.pInts);
			PrintMessage("ControlType_%d ,,, %f", state->nType, value);
			switch (state->nType){
			case Control_VelSet:
				switch (param.nParam){
				case CPN_x:this->VelSetX(value); break;
				case CPN_y:this->VelSetY(value); break;
				}break;
			case Control_VelAdd:
				switch (param.nParam){
				case CPN_x:this->VelSetX(xVel+value); break;
				case CPN_y:this->VelSetY(yVel + value); break;
				}break;
			
			case Control_HitVelSet:
				switch (param.nParam){
				case CPN_x:hitVardata.fall_xvelocity=-value; break;
				case CPN_y:hitVardata.fall_yvelocity=value; break;
				}break;
			case Control_VelMul:
				switch (param.nParam){
				case CPN_x:this->VelSetX(xVel*value); break;
				case CPN_y:this->VelSetY(yVel*value); break;
				}break;
			case Control_VarSet:
				switch (param.nParam){
				case CPN_fvar:var[param.vNum] = (s32)value; break;
				case CPN_sysfvar:sysvar[param.vNum] = (s32)value; break;
				case CPN_var:var[param.vNum] = (s32)value; break;
				case CPN_sysvar:sysvar[param.vNum] = (s32)value; break;
				}break;
			case Control_PosSet:
				switch (param.nParam){
				case CPN_x:this->SetPos(value, y); break;
				case CPN_y:this->SetPos(x, value + nGround); break;
				}break;
			case Control_PosAdd:
				switch (param.nParam){
				case CPN_x:this->AddPos(value, 0); break;
				case CPN_y:this->AddPos(0, value); break;
				}break;
			case Control_CtrlSet:
				this->bCtrl = (value==1); break;
			case Control_AssertSpecial:
				tmpAssertSpecial += (int)value;
				break;
			case Control_ChangeAnim:
				nAnimNumber = (int)value;
				this->m_SffManager.PrepareAnim((int)value);
				break;
			case Control_ChangeState:
				if (param.nParam == CPN_ctrl){
					this->bCtrl = (value==1); break;
				}
				else if (param.nParam == CPN_value){
					if ((nAssertSpecial & nowalk) && ((int)value == 20))
						break;
					this->ChangeState((int)(value)); break;
				}
			case Control_SprPriority:
				break;
			case Control_Gravity:break;
			case Control_StateTypeSet:
				nStateType = (int)(value);
				break;
			}
		}
	}
}
float CPlayer::GetVar(ConParmName con, u8 num){
	switch (con)
	{
	case CPN_value:
		break;
	case CPN_emem:
		break;
	case CPN_anim:
		break;
	case CPN_ctrl:
		break;
	case CPN_x:
		break;
	case CPN_y:
		break;
	case CPN_flag:
		break;
	case CPN_var:
		return (float)var[num-1];
		break;
	case CPN_sysvar:
		return (float)sysvar[num - 1];
		break;
	case CPN_fvar:
		return (float)var[num - 1];
		break;
	case CPN_sysfvar:
		return (float)sysfvar[num - 1];
		break;
	default:
		break;
	}
	throw(CError("CPlayer::GetVar : Can't passing ConParmName %i", con));
	return -1;
}

void CPlayer::ResetHitVarData()
{
	memcpy(&hitVardata, &orignHitVarData, sizeof(HITVARDATA));
}

/*
void CPlayer::ControlType_ChangeAnim(PLSTATE* state)
{
	float value = 0;
	for (int i = 0; i <= state->nParamCount; i++)
	{
		CONTROLLERPARAMS param = state->pConParm[i];
		if (param.nParam == CPN_value)
		{
			value = this->m_pVMachine->Execute(param.pInts);
			break;
		}
	}
	nAnimNumber = value;
	this->m_SffManager.PrepareAnim((int)value);
}
void CPlayer::ControlType_ChangeState(PLSTATE* state)
{
	float value = 0;
	for (int i = 0; i <= state->nParamCount; i++)
	{
		CONTROLLERPARAMS param = state->pConParm[i];
		if (param.nParam == CPN_value)
		{
			value = this->m_pVMachine->Execute(param.pInts);
			break;
		}
	}
	this->ChangeState((int)(value));
}
*/