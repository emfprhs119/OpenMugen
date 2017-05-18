#ifndef __COMMAND_MANAGER__CMDMANAGER_H__
#define __COMMAND_MANAGER__CMDMANAGER_H__

//Tokenizer by Nate Pendelton

class CCmdManager
{
// To Get the Game time
CGameTimer *m_pTimer;     
public:
    CCmdManager( int keyBufferSize = 120 );
    ~CCmdManager();
    
	bool LoadCMDFile(const char* file, CAllocater *a);  // returns false upon load failure
    
    void Update( KEYBOARDDATA* keys, bool facingRight );
    
    const char* GetCurrentCommandName();
	bool *GetCurrentCommandBool(){ return b_CurrCommand; };
    void SetGameTimer(CGameTimer *t){m_pTimer=t;}
	int GetCount(){
		return m_CommandCount;
	};
	PLCOMMAND* GetCommand(){
		return m_Commands;
	};
protected:
    PLCOMMAND* m_Commands;
    int m_CommandCount;  
    const char* m_CurrCommandName;
	bool *b_CurrCommand;
	CAllocater *m_pAlloc;
    //this is the Keyboard buffer
    PLCOMMANDFRAMEINPUT* m_KeyBuffer;
    short m_KeyBufferSize;
    short m_KeyIndex;

    inline int AdjustKeyIndex( int keyIndex, int increment )  //순환하는 원형 큐
        { return ( keyIndex + increment + m_KeyBufferSize ) % m_KeyBufferSize; }
};

#endif

