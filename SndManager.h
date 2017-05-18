#include "global.h"


class CSndManager
{
private:
	SND*      lpSpriteList;
	CAllocater     *m_pAlloc;
	bool bPlay;

	Uint32 wav_length; // length of our sample
	Uint8 *wav_buffer; // buffer containing our audio file
	SDL_AudioSpec wav_spec; // the specs of our piece of music
	Mix_Chunk *mix,*mix1;
	int ff=0;
	SND IpSndListFight;
	SND IpSndListCommon;
	SND IpSndListPlayer;
	SND curIpSndList;
public:
	bool LoadSndFile(const char *strSndFile, CAllocater* a, SNDFLAG flag);
	void PlayAudio(SNDFLAG flag, s32  nGroupNumber, s32 SampleNumber);
	bool CurPlay(){ return bPlay; };
	bool PlayMutex();
};