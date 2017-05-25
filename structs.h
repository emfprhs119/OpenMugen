#ifndef __STRUCTS__H
#define __STRUCTS__H

//typedefs
typedef unsigned char   u8;
typedef signed   char   s8;
typedef unsigned short  u16;
typedef signed   short  s16;
typedef unsigned long   u32;
typedef signed   long   s32;



typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef unsigned long DWORD;


struct KEYELEMENT
{
	KEYELEMENT()  { isPressed = false; sdlKeycode = 0; }
	Uint16 isPressed, sdlKeycode;
};


//now lets define a command

#define PLC_KEYMOD_MUST_BE_HELD    ( 1 << 0 )
#define PLC_KEYMOD_DETECT_AS_4WAY  ( 1 << 1 )
#define PLC_KEYMOD_BAN_OTHER_INPUT ( 1 << 2 )
#define PLC_KEYMOD_ON_RELEASE      ( 1 << 3 )
#define PLC_KEYCODE(x)             ( 1 << x )
#define IsKeyInPLCKeyCode( k, c )  ((( PLC_KEYCODE( k ) & c ) > 0 )

#define PLC_ALL_DIRECTIONS_BITFIELD ( PLC_KEYCODE( KEY_UP ) + PLC_KEYCODE( KEY_DOWN ) + PLC_KEYCODE( KEY_LEFT ) + PLC_KEYCODE( KEY_RIGHT ) )

struct PLCOMMANDELEMENT
{
	PLCOMMANDELEMENT() { keyCode = 0; keyModifier = 0; gameTicksForHold = 0; }
	int keyCode;
	Uint16 keyModifier;
	Uint16 gameTicksForHold;
};

struct PLCOMMANDFRAMEINPUT
{
	PLCOMMANDFRAMEINPUT()  { keyBitfield = gameTicks = 0; }
	Uint16 keyBitfield;
	Uint32 gameTicks;
};

struct PLCOMMAND
{
	PLCOMMANDELEMENT nCommand[MAXCOMMAND];
	Uint8 nHowManyCommand;
	Uint8 nCommandTime, nBufferTime;
	Uint8 num;
	char strCommand[255];

};


//Movedata Struct for Saving the current Button States
struct KEYBOARDDATA
{
	KEYELEMENT keyInfo[KEY_COUNT];
	bool bKeyBoard;
};


//memlist for Allocater class
struct MEMLIST
{
	u8    nType;
	size_t   nSize;
	void *adrress;

};

//font struct
struct MUGENFONT
{
	u8 c;
	s16 x;
	u8 nWidth;

};

struct PCXHEADER
{
	u8 Manufacturer;
	u8 Version;
	u8 Encoding;
	u8 BPP;
	u16 x, y;
	u16 width, height;
	u16 HRES, VRES;
	u8 ColorMap[48];
	u8 reserved;
	u8 NPlanes;
	u8 bytesPerLine;
	u8 palletInfo;
	u8 Filler[58];

};
struct SFFHEADER
{
	u8 signature[11];
	u8 verhi;
	u8 verlo;
	u8 verhi2;
	u8 verlo2;
	u32		  NumberOfGroups;
	u32		  NumberOfImage;
	u32		  SubHeaderFileOffset;
	u32		  SizeOfSubheader;
	u8 PaletteType;
	u8 BLANK[476];

};

//Sff Subheader
struct SFFSUBHEADER
{
	u32 NextSubheaderFileOffset;
	u32 LenghtOfSubheader;
	s16 x;
	s16 y;
	s16 GroubNumber;
	s16 ImageNumber;
	s16 IndexOfPrevious;
	bool  PalletSame;
	u8 BALNK[13];

};

//Sound  header
struct SNDHEADER
{
	u8 strSignatur[12];
	s16 verhi;
	s16 verlo;
	u32 nNumberOfSounds;
	u32 SubHeaderFileOffset;
	u8 strBlank[488];

};

//Sound SubHeader
struct SNDSUBHEADER
{
	u32  NextSubHeaderFileOffset;
	u32  SubFileLenght;
	s32  nGroupNumber;
	s32  SampleNumber;

};
struct SNDDATA
{
	s32  nGroupNumber;
	s32  SampleNumber;
	Uint32 wav_length; // length of our sample
	Uint8 *wav_buffer; // buffer containing our audio file
	SDL_AudioSpec wav_spec; // the specs of our piece of music
	Mix_Chunk *chunk;
	SDL_AudioCVT cvt;

};
struct SND
{
	u32 nNumberOfSounds;
	SNDDATA *data;
};

struct RGBColor
{
	u8 R;
	u8 G;
	u8 B;

};

struct PalFX
{
	u8 dummy;

};

struct SFFSPRITE
{
	s16 x;
	s16 y;
	PCXHEADER PcxHeader;
	s16 GroupNumber;
	s16 ImageNumber;
	u16 ColorPallet[256];

	u8 *byPcxFile;

};

struct Stacktype
{
	float Value;
	char string[50];
	//char stringEx[50];

};


struct XYVALUE
{
	float x;
	float y;
};
struct RGB
{
	int r;
	int g;
	int b;
};
// 操作堆栈的元素
struct INSTRUCTION
{
	Uint16 n_OpCode;
	float Value;
	char *strValue;

};
// 触发器，一个触发器就是一个表达式
struct PLTRIGGER
{
	u8 nTriggerType;
	int triggNum;
	INSTRUCTION* pInts;

};

// 触发器执行需要的值，用表达式保存，
struct CONTROLLERPARAMS
{
	ConParmName nParam;
	SNDFLAG flag = PLAYER;
	u8 vNum;
	u8 vNum1;
	s8 sNum;
	bool bVar;
	//TODO:动态生成内存
	INSTRUCTION pInts[INSPerConParam];
};

// HitDef 保存的值

struct HITDEFVARSET
{
	HITDEFVAR hVar1, hVar2;
	SNDFLAG flag=FIGHT;
	bool bVar1 = 0;
	u16 uVar1 = 0, uVar2 = 0, uVar3 = 0;
	s16 sVar1 = 0, sVar2 = 0, sVar3 = 0;
	float fVar1 = 0, fVar2 = 0;
	char* strVar1;
};

struct CONTROLHITDEF
{
	CONTROLHITDEFParmName nParam;
	//TODO:动态生成内存
	INSTRUCTION pInts[INSPerConParam];
	HITDEFVARSET pHitVar;

};
// TODO control中的执行语句只有这三个是表达式，其他的都是数值，为保险还是用CONTROLLERPARAMS统一保存
//struct CHANGESTATE
//{
//	INSTRUCTION *value;
//	INSTRUCTION *ctrl;
//	INSTRUCTION *anim;
//
//};
struct HITVARDATA{
	bool def = false;
	bool reset = false;
	HITDEFVAR animtype;

	HITDEFVAR attr1;
	HITDEFVAR attr2;
	HITDEFVAR hitflag = MAF;
	HITDEFVAR guardflag;
	HITDEFVAR affectteam = E;
	HITDEFVAR air_animtype;
	HITDEFVAR fall_animtype = back;
	u8 hit_prior = 4;
	HITDEFVAR hit_type = HIT;
	s16 hit_damage = 0;
	s16 guard_damage = 0;
	u16	pausetime = 0;
	u16 hitshaketime = 0;
	u16 guard_pausetime = 0;
	int sparkno;
	int guard_sparkno;
	XYVALUE sparkxy;
	int hitsound_snd_grp;
	int hitsound_snd_item;
	SNDFLAG hitsound_snd_flag;
	int guardsound_snd_grp;
	int guardsound_snd_item;
	HITDEFVAR ground_type = high;
	HITDEFVAR air_type = high;
	int ground_slidetime = 0;
	int guard_slidetime = 0;
	int ground_hittime = 0;
	int guard_hittime = 0;
	int air_hittime = 20;
	int guard_ctrltime;
	int guard_dist;
	float  yaccel = 1.4f;
	XYVALUE ground_velocity;
	float guard_velocity;
	XYVALUE air_velocity;
	XYVALUE airguard_velocity;
	float ground_cornerpush_veloff;
	float air_cornerpush_veloff;
	float down_cornerpush_veloff;
	float guard_cornerpush_veloff;
	float airguard_cornerpush_veloff;
	int airguard_ctrltime;
	int  juggle_points;
	XYVALUE mindist;
	XYVALUE maxdist;
	XYVALUE snap;
	int p1sprpriority;
	int p2sprpriority;
	int p1facing;
	int p1getp2facing;
	int p2facing;
	int p1stateno;
	int p2stateno;
	bool p2getp1state;
	bool forcestand;
	bool fall;
	float fall_xvelocity;
	float fall_yvelocity;
	bool fall_recover;
	int fall_recovertime;
	int fall_damage;
	bool air_fall;
	bool forcenofall;
	XYVALUE down_velocity;
	int down_hittime;
	bool down_bounce;
	int id;
	int chainID;
	int nochainID;
	bool hitonce;
	bool kill;
	bool guard_kill;
	bool fall_kill;
	int numhits;
	int p1power;
	int p1gpower;
	int p2power;
	int p2gpower;
	int palfx_time;
	RGB palfx_mul;
	RGB palfx_add;
	int envshake_time;
	float envshake_freq;
	int envshake_ampl;
	float envshake_phase;
	int fall_envshake_time;
	float fall_envshake_freq;
	int fall_envshake_ampl;
	float fall_envshake_phase;
};

struct PLSTATE
{
	// control所属的state num
	s32 nStateNumber;
	u16 nType;
	PLTRIGGER *triggers;
	u16 nHowManyTriggers;
	PLTRIGGER *triggerAlls;
	u16 nHowManyTriggerAlls;

	bool bPresist;
	bool bIgnorPause;
	// 暂时无用，存储的control都直接由nType，映射成函数了
	//void *controller;

	// http://elecbyte.com/wiki/index.php/Category:State_Controllers
	// 里面有说明persistent和ignorehitpause是必须的字段，其他非必须，用map映射存储
	//TODO: 定义40参数的列表，可以改为动态产生
	CONTROLLERPARAMS pConParm[ConParmPerState];
	u16 nParamCount;

	// HitDef参数比较多，单独解析
	CONTROLHITDEF pConHDParm[ConHDParmPerState];
	u16 nParamHDCount;
};



struct PLSTATEDEF
{
	//recommend parameters
	s32 StateNumber;
	u8 type;
	u8 movetype;
	u8 physics;
	s32 nAnim;
	//optional param
	XYVALUE Velset;
	s8 nCtrl;
	s16 nPoweradd;
	s16 nJuggle;
	bool bFacep2;
	///Some  flags
	bool bHitdefpersist;
	bool bMovehitpersist;
	bool bHitcountpersist;
	//////////////////////
	u8 nSprpriority;
	u16 nHowManyState;
	PLSTATE* lpState;

};


struct ClsnRECT
{
	s16 x, y;
	s16 h, w;
};

//Clsn Struct to hold one Clns Rectangle with type
struct Clsn
{
	bool bClsn1;
	ClsnRECT ClsnRect;

};

//Element Strcut to save one Elment of an Action Block
struct Element
{
	s16 nGroupNumber;
	s16 nImageNumber;
	s16 x;
	s16 y;
	u32 nDuringTime;
	u16 FlipFlags;
	u32 ColorFlags;
	Clsn *pClsn1Data;
	Clsn *pClsn2Data;
	u16 nNumberOfClsn1;
	u16 nNumberOfClsn2;
};

//Action Element to hold one Action Block with its Elements
struct ActionElement
{
	s32 nActionNumber;
	Element* AnimationElement;
	s16 loopStart;
	u16 nNumberOfElements;
	u16 nCurrentImage;

	u32 nDuringTime;
	s16 nCompletAnimTime;
	u32 nCurrTime;
	u16 nCurrentImageTime;
	bool bLooped;


};

//Player Data
struct PLDATA
{
	s16 nLife;
	s16 nAttack;
	s16 nDefence;
	s16 nPower;
	s16 nFallDefenceUp;
	u8 nLieDownTime;
	s16 nAirjuggle;
	s16 nSparkno;
	s16 nGuardSparkno;
	bool bKoEcho;
	s16 nVolumen;
	u8 nIntPersistIndex;
	u8 nFloatPersistIndex;
	char szPlayerName[10];

};
//Player Size
struct PLAYERSIZE
{
	float nXscale;
	float nYscale;
	s16 nGroundBack;
	s16 nGroundFront;
	s16 nAirBack;
	s16 nAirFront;
	s16 nHeight;
	XYVALUE nAttackWidth;
	s16 nAttackDistance;
	s16 nProjAttackDist;
	bool bProjDoScale;
	XYVALUE nHeadPos;
	XYVALUE nMidPos;
	s16 nShadowOffset;
	XYVALUE nDrawOffset;

};
//Playervelocity struct
struct PLAYERVELOCITY
{
	float nWalkFwd;
	float nWalkBack;
	XYVALUE RunFwd;
	XYVALUE RunBack;
	XYVALUE JumpNeu;
	XYVALUE JumpBack;
	XYVALUE JumpFwd;
	XYVALUE RunjumpBack;
	XYVALUE RunjumpFwd;
	XYVALUE AirjumpNeu;
	XYVALUE AirjumpBack;
	XYVALUE AirjumpFwd;

};
//Playermovement Struct
struct PLAYERMOVEMENT
{
	s16 AirJumpNum=1;
	float nAirJumpHight = 140.f;
	float yaccel=1.76f;
	float StandFriction=.85f;
	float CrouchFriction=.82f;
	float StandFrictionThreshold=8.f;
	float CrouchFrictionThreshold=.2f;
	//float DownFrictionThreshold;
	float air_gethit_groundlevel = 100.f;
	float air_gethit_groundrecover_ground_threshold = -80.f;
	float air_gethit_groundrecover_groundlevel = 40.f;
	float air_gethit_airrecover_threshold = -4.f;
	float air_gethit_airrecover_yaccel = 1.4f;
	float air_gethit_trip_groundlevel = 60.f;
	XYVALUE down_bounce_offset = XYVALUE{ 0, 80 };
	float down_bounce_yaccel = 1.6f;
	float down_bounce_groundlevel = 48.f;
	float down_friction_threshold = .2f;

};
//Playerconstant struct
struct PLAYERCONST
{
	PLDATA			PlayerData;
	PLAYERSIZE		PlayerSize;
	PLAYERVELOCITY	PlayerVelocity;
	PLAYERMOVEMENT	PlayerMovement;


};
#define FILENAMELEN 256
struct CharFileInfo
{
	char name[FILENAMELEN];
	char displayname[FILENAMELEN];
	char versiondate[15];
	char mugenversion[5];
	char author[FILENAMELEN];
	int pal_defaults[4];
	XYVALUE localcoord;
	char cmd[FILENAMELEN];
	char cns[FILENAMELEN];
	char st[FILENAMELEN];
	char stcommon[FILENAMELEN];
	char sprite[FILENAMELEN];
	char anim[FILENAMELEN];
	char sound[FILENAMELEN];
	char ai[FILENAMELEN];
	char pal[12][FILENAMELEN];
};

class CError
{
	char strMessage[100];
public:
	CError(const char* strError, ...)
	{

		char string[100];                  // Temporary string

		va_list ap;                // Pointer To List Of Arguments
		va_start(ap, strError);         // Parses The String For Variables
		vsprintf_s(string, strError, ap); // Converts Symbols To Actual Numbers
		va_end(ap);

		strcpy_s(strMessage,100, string);

	}
	const char *GetError(){ return strMessage; }
};




#endif
