#include "global.h"

FILE *pLogFile=NULL;


void PrintMessage(char *str,...)
{

//#define DEBUG
#ifdef DEBUG

  char string[255];                  // Temporary string

  va_list ap;                // Pointer To List Of Arguments
  va_start(ap, str);         // Parses The String For Variables
  vsprintf_s(string, str, ap); // Converts Symbols To Actual Numbers
  va_end(ap);      
  
#ifdef _XBOX
  pLogFile=fopen("d:\\log.txt","a+");
#else
  fopen_s(&pLogFile,"log.txt", "a+");
#endif  
  
  fprintf(pLogFile,string);
  fprintf(pLogFile,"\n");
  fclose(pLogFile);
  
//printf(string);
  //printf("\n");
#endif // DEBUG
}




void InitLogFile()
{
   #ifdef _XBOX
	pLogFile=fopen("d:\\log.txt","w");
   #else
	fopen_s(&pLogFile,"log.txt", "w");
   #endif 
	fclose(pLogFile);

}
