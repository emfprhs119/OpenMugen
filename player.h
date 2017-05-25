//    Open Mugen is a redevelopment of Elecbyte's M.U.G.E.N wich will be 100% compatible to it
//    Copyright (C) 2004  Sahin Vardar
//
//    If you know bugs or have a wish on Open Muegn o
//    Feel free and email me: sahin_v@hotmail.com  ICQ:317502935
//    Web: http://openmugen.sourceforge.net/
//    --------------------------------------------------------------------------
//
//    This program is free software; you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation; either version 2 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.

//    You should have received a copy of the GNU General Public License
//    along with this program; if not, write to the Free Software
//    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#ifndef __PLAYER__H
#define __PLAYER__H

#define NUMFUNCT_CONTROL 140

class CPlayer
{
	CPlayer			   *other;
	CAllocater         *m_pAlloc;
	CVideoSystem       *m_pVideoSystem;
	CSffManager         m_SffManager;
	CSndManager         m_SndManager;
	CAirManager         m_AirManager;
	CStateManager       m_StateManager;  
	CGameTimer         *m_pTimer;
	CVirtualMachine    *m_pVMachine;
	CControllerExecuter m_ControllerExec;
	CCmdManager         m_CmdManager;
	// ¶ÁÈ¡ÅäÖÃ£¬Ó³Éä°´¼ü
	KEYBOARDDATA		*m_keyData;
	
	//Player information
	float              x,y;
	float              xVel,yVel;
	float              nGround;
	float              fvar[60];
	float              sysfvar[5];
	s32                nPrevStateno;
	s32                nAnimNumber;
	s32                sysvar[5];
	s32                var[60];
	u32                nStateTime;
	u8                 nStateType;
	u8                 nPhysic;
	u8                 nMoveType;
	u8                 nSprPrio;
	u8				   nLieDownTime;
	s16                nLife;
	s16                nPower;
	s32				   nAssertSpecial;
	s32				   tmpAssertSpecial;
	bool               bHitDefPresit;
	bool               bHitCounterPresit;
	bool               bMoveHitPresit;        
	bool               bCtrl;
	bool               bRightFaced;
	bool               bDebugInfo;
	bool               bPrevHitDef;
	bool               bHitDef;
	bool               bHitGetDef;
	bool               bAlive;
	PLSTATEDEF         *lpCurrStatedef;
	CharFileInfo		defInfo;
	PLAYERCONST         myPlayerConst;

	HITVARDATA hitVardata, orignHitVarData;
public:
	


	CPlayer();
	~CPlayer();
	void SetPointers(CVideoSystem *p,CAllocater *a,CGameTimer *t);
	bool LoadPlayer(const char* strPlayer);
	void UpDatePlayer();
	void DrawPlayer();
	//Set functions
	void SetKeyBoard(int playerid);
	void SetVM(CVirtualMachine *p){m_pVMachine=p;}
	void SetOther(CPlayer* otherPlayer){ other = otherPlayer; }
	void SetPos(float xAxis,float yAxis){x=xAxis;y=yAxis;}
	inline void AddPos(float xAxis, float yAxis){ x += (bRightFaced ? xAxis : -xAxis); y += yAxis; }
	void VelSetX(float xvel){xVel = xvel; }
	void VelSetY(float yvel){yVel=yvel;}

	void SetDebug(bool bDebug){bDebugInfo=bDebug;}
	void FaceLeft(){bRightFaced=false;}
	void FaceRight(){bRightFaced=true;}
	//Set the the ground value of the stage
	void SetGroundValue(float yLimit){nGround=yLimit;} 

	//Player Controllers
	void ChangeState(s32 nSateNumber);

	//trigger functions
	bool *GetBCommand(){ return m_CmdManager.GetCurrentCommandBool(); }
	char *GetCommand(){return (char*)m_CmdManager.GetCurrentCommandName();}
	bool IsPlayerAlive(){return bAlive;}
	s32  GetAnim(){return nAnimNumber;}
	HITVARDATA GetHitVarData(){ return hitVardata; }
	ActionElement *GetCurrAnim(){return m_SffManager.GetCurrAnimation();}
	bool IsAnimAviable(s32 nAnim);
	bool IsCtrl(){return bCtrl;}

	const char* GetPlayerName(){return this->myPlayerConst.PlayerData.szPlayerName;}

private:
	bool CheckState(PLSTATE* tempState);
	bool ExecuteController(PLSTATE* tempState);
	bool ChackHitClsn(float x, float y, ClsnRECT a, float x2, float y2, ClsnRECT b);
	void HandleFLAG();
	void HandleFSM();  
	void UpDateFriction();
	void HandlePhysic();
	void UpDateFacing();
	void Debug();
	void Init();
	void ResetHitVarData();


public:// controlº¯Êý
	void InitFunctTable();

	typedef void (CPlayer::*ptControl)(PLSTATE*);
	ptControl pFuncTable[NUMFUNCT_CONTROL];
	float VelGetX(){ return xVel; }
	float VelGetY(){ return yVel; }
	float PosGetX(){ return x; }
	float PosGetY(){ return y - nGround; }
	
	float GetVar(ConParmName, u8);
	int GetStateNo(){ return lpCurrStatedef->StateNumber; }
	int GetPrevStateNo(){ return nPrevStateno; }
	int GetStateType(){ return lpCurrStatedef->type; }
	int GetTime(){ return nStateTime; }
	int GetLife(){ return nLife; }
	int GetPower(){ return nPower; }
	CharFileInfo GetInfo(){ return defInfo; }
	PLAYERCONST GetConst(){ 
		return myPlayerConst; 
	}
	ActionElement* GetAirAction(int airNum){ return m_AirManager.GetAction(airNum); }

	void ControlType_ChangeAnim(PLSTATE* );
	void ControlType_ChangeState(PLSTATE* );
	void ControlType_CtrlSet(PLSTATE*);
	void ControlType_Velset(PLSTATE*);
	void Execute(PLSTATE* );
};

#endif
