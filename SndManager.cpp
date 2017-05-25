#include "global.h"

void my_audio_callback(void *, Uint8 *, int);
//void my_audio_callback(void *userdata, Uint8 *stream, int len);
void DecodeSnd(const char *strSndFile, SNDDATA *IpSndList, SNDHEADER Header);
static Uint8 *audio_pos; // global pointer to the audio buffer to be played
static Uint32 audio_len; // remaining length of the sample we have to play


//int main(int argc, char* argv[]){

bool CSndManager::LoadSndFile(const char *strSndFile, CAllocater* a, SNDFLAG flag){
	// Initialize SDL.
	m_pAlloc = a;
	if (SDL_Init(SDL_INIT_AUDIO) < 0)
		return 1;

	SDL_RWops *SDLfile;
	SNDHEADER Header;
	
	//단순하게 sdl을 사용하였지만 추후 개선해야함.
	SDLfile = SDL_RWFromFile(strSndFile, "rb");
	SDL_RWread(SDLfile, &Header, sizeof(SNDHEADER), 1);
	SDL_RWclose(SDLfile);
	if (flag == COMMON){
		IpSndListCommon.nNumberOfSounds = Header.nNumberOfSounds;
		IpSndListCommon.data = (SNDDATA*)m_pAlloc->Realloc(IpSndListCommon.data, sizeof(SNDDATA)*Header.nNumberOfSounds);
		DecodeSnd(strSndFile, IpSndListCommon.data, Header);
	}
	else if (flag == FIGHT){
		IpSndListFight.nNumberOfSounds = Header.nNumberOfSounds;
		IpSndListFight.data = (SNDDATA*)m_pAlloc->Realloc(IpSndListFight.data, sizeof(SNDDATA)*Header.nNumberOfSounds);
		DecodeSnd(strSndFile, IpSndListFight.data, Header);
	}
	else if (flag == PLAYER){
		IpSndListPlayer.nNumberOfSounds = Header.nNumberOfSounds;
		IpSndListPlayer.data = (SNDDATA*)m_pAlloc->Realloc(IpSndListPlayer.data, sizeof(SNDDATA)*Header.nNumberOfSounds);
		DecodeSnd(strSndFile, IpSndListPlayer.data, Header);
	}
	else{
		throw(CError("CSndManager::LoadSndFile : Can't open %s", SDLfile));
	}
	return 0;
}

void CSndManager::PlayAudio(SNDFLAG flag, s32  nGroupNumber, s32 SampleNumber)
{
	/*
	if (!PlayMutex())
		return;
		*/
	//if (audio_len > 0 && audio_pos!=NULL)
	//	return;
	if (flag == COMMON){
		curIpSndList = IpSndListCommon;
	}
	else if (flag == FIGHT){
		curIpSndList = IpSndListFight;
	}
	else if (flag == PLAYER){
		curIpSndList = IpSndListPlayer;
	}
	u16 i = 0;
	for (; i < curIpSndList.nNumberOfSounds; i++){
		if ((curIpSndList.data[i]).nGroupNumber == nGroupNumber && curIpSndList.data[i].SampleNumber == SampleNumber)
			break;
	}
	if (i == curIpSndList.nNumberOfSounds)
		return;

	//bPlay = true;
	SDL_AudioCVT cvt;
	cvt = curIpSndList.data[i].cvt;
	
	mix = Mix_QuickLoad_RAW(cvt.buf, cvt.len_cvt);
	
	//나중에 사운드 초기화와 배경음은 배경쪽으로 옮길것.
	if (Mix_PlayingMusic() == 0){

		//
		
		if (Mix_OpenAudio(44100, MIX_DEFAULT_FORMAT, 1, 4096) == -1)
		{
			return;
		}
		//Mix_AllocateChannels(16);
		Mix_PlayMusic(Mix_LoadMUS("test.wav"), 1);
		//wav_spec.channels = 2;
		//printf("%d\n", curIpSndList.data[0].wav_spec.freq );
		/*
		SDL_OpenAudio(&curIpSndList.data[0].wav_spec , NULL);
		SDL_PauseAudio(0);
		*/
		
	}
	else
	{
		//int A=
		//printf("aa=%d\n", A);
		//Mix_OpenAudio(wav_spec.freq, MIX_DEFAULT_FORMAT, 2, 4096);
		//Mix_QuerySpec(&wav_spec.freq, &wav_spec.samples, &wav_spec.channels);

		//if (wav_spec.freq == 44100){
			Mix_PlayChannel(-1, mix, 0);
		//}

	}
	/* Open the audio device */
	/*
	if (SDL_OpenAudio(&wav_spec, NULL) < 0){
		fprintf(stderr, "Couldn't open audio: %s\n", SDL_GetError());
		exit(-1);
	}
	*/
	//SDL_PauseAudio(0);

	/* Start playing */
	
	// wait until we're don't playing
	/*
	while (audio_len > 0) {
	printf("pos = %d/ len = %d\n", audio_pos, audio_len);
	//SDL_Delay(100);
	}*/
	
	
	//	SDL_CloseAudio();
	// shut everything down
	//SDL_CloseAudio();
	//SDL_FreeWAV(wav_buffer);
}
bool CSndManager::PlayMutex(){
	if (bPlay)
		return false;
	else
		return true;

}
// audio callback function
// here you have to copy the data of your audio buffer into the
// requesting audio buffer (stream)
// you should only copy as much as the requested length (len)
void DecodeSnd(const char *strSndFile, SNDDATA *IpSndList, SNDHEADER Header){

	SDL_RWops *SDLfile;
	SNDSUBHEADER SubHeader;

	Uint32 wav_length;
	Uint8 *wav_buffer;
	SDL_AudioSpec wav_spec;
	SDL_AudioCVT *cvt;
	for (u16 i = 0; i < Header.nNumberOfSounds; i++){
		SDLfile = SDL_RWFromFile(strSndFile, "rb");
		if (i == 0)
			SDL_RWseek(SDLfile, Header.SubHeaderFileOffset, SEEK_SET);
		else
			SDL_RWseek(SDLfile, SubHeader.NextSubHeaderFileOffset, SEEK_SET);
		SDL_RWread(SDLfile, &SubHeader, sizeof(SNDSUBHEADER), 1);
		SDL_LoadWAV_RW(SDLfile, 1, &wav_spec, &wav_buffer, &wav_length);
		wav_spec.callback = my_audio_callback;
		wav_spec.userdata = NULL;
		/* Load the WAV */
		// the specs, length and buffer of our wav are filled
		IpSndList[i].nGroupNumber = SubHeader.nGroupNumber;
		IpSndList[i].SampleNumber = SubHeader.SampleNumber;
		
		
		cvt = &IpSndList[i].cvt;
		SDL_BuildAudioCVT(cvt, wav_spec.format, wav_spec.channels, wav_spec.freq,
			AUDIO_S16, 1, 44100);
		cvt->buf = (Uint8 *)malloc(wav_length*cvt->len_mult);
		memcpy(cvt->buf, wav_buffer, wav_length);
		cvt->len = wav_length;
		SDL_ConvertAudio(cvt);
		/*
		if (mix != NULL){
			printf("%d",sizeof(*mix));
			IpSndList[i].chunk = (Mix_Chunk *)malloc(sizeof(*mix));
			memcpy(IpSndList[i].chunk, mix, sizeof(*mix));
		}
		*/
		IpSndList[i].wav_buffer = wav_buffer;
		IpSndList[i].wav_length = wav_length;
		//free(wav_buffer);
		//IpSndList[i].wav_spec = wav_spec;
	}
}
void my_audio_callback(void *userdata, Uint8 *stream, int len) {
 
	if (audio_len == 0)
		return;

	len = (len > (int)audio_len ? audio_len : len);
	
		SDL_memcpy (stream, audio_pos, len); 					// simply copy from one buffer into the other
		// mix from one buffer into another

	//SDL_MixAudio(stream, audio_pos, len, SDL_MIX_MAXVOLUME);

		audio_pos += len;
		audio_len -= len;
	
	
}