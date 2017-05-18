#ifndef ___STATEPARSER__H
#define ___STATEPARSER__H

class CStateParser
{
      CAllocater         *m_pAlloc;
      
      
      void ParseStateDef(CTokenizer &tok,CStateManager &StateManager);
      void ParseState(CTokenizer &tok,CStateManager &StateManager);
      void ParseTrigger(CTokenizer &tok,CStateManager &StateManager);
//Expression parser
      void EvaluateExpression(CTokenizer &tok,CStateManager &StateManager);
      void Term(CTokenizer &tok,CStateManager &StateManager);
      bool Primary(CTokenizer &tok,CStateManager &StateManager);
//helper functions      
      int  GetControllerType(const char * strType,CTokenizer &tok);
      int  GetTriggerType(const char * strTrigger,CTokenizer &tok);
	  int  GetConstNum(const char * strConst);
	  int  GetCommandNum(const char * strCommandTemp);
	  int  GetHitVarNum(const char * strHitVarTemp);
	  int  GetFlagNum(const char * strFlagTemp);
      void Error(const char * strErrorMsg,CTokenizer &tok);

	  // action Èç£ºChangeState¡¢ChangeAnim
      int nController;
	  CCmdManager	*m_CmdManager;
	  bool bParserLoop=false;
//controller parser
	  
	  
      void ParserController(CTokenizer &tok,CStateManager &StateManager,u16 nControllerType);
	  bool ParseStateBaseParm(CTokenizer &tok,CStateManager &StateManager);
	  void ParseNormalAction(CTokenizer &tok,CStateManager &StateManager);
	  void ParseSndAction(CTokenizer &tok, CStateManager &StateManager);

      void ParseChangeState(CTokenizer &tok,CStateManager &StateManager);
	  void ParseChangeAnim(CTokenizer &tok,CStateManager &StateManager);
	  void ParseHitDef(CTokenizer &tok,CStateManager &StateManager);

	  HITDEFVAR GetHDV(const char* hdv,bool b);
	  HITDEFVARSET GetHitVarSet(CTokenizer &tok, PARSERVAR PV,bool b = true);
	  
public:
       CStateParser();
       ~CStateParser();
       void ParseStateFile(const char * strFileName,CStateManager &StateManager,CAllocater *a);
	   void ParseConstFile(const char * strFileName, PLAYERCONST *myPlayerConst);
	   void SetCmdManager(CCmdManager *cmdManager){ m_CmdManager = cmdManager; };
};


#endif
