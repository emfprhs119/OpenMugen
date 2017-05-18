#ifndef __OM_TOKENIZER__
#define __OM_TOKENIZER__

//Tokenizer by Nate Pendelton

class CTokenizer
{
public:
    CTokenizer( int bufferSize = 256, char* commentChars = NULL, char** operators = NULL, int operatorCount = -1 );
    ~CTokenizer();
    
    bool OpenFile( const char* filename ); // false if already open file or on fail
    bool CloseFile();                      // false if no file open
    
    bool AtEndOfLine();
    bool AtEndOfFile();
        
	char* GetPartToken();
    const char* GetToken();
    bool        GetToken( char* destString, int maxLength );
	
    bool        CheckToken( const char* stringToLookFor, bool consumeIfMatch = true );
	int		CheckNToken(const char* stringToLookFor, int length, bool consumeIfMatch = true);
    bool        CheckTokenIsNumber();       // returns true if token is a number
	int		CheckTokenIsStatetype();
    bool        CheckTokenIsQuotedString();  // makes sure token is quoted string
    
    int         GetInt();
    float       GetFloat();
	XYVALUE		getXYVALUE();
    
    void        SetIsCaseSensitive( bool b )  { m_IsCaseSensitive = b; }
    void        SetReturnNegativeSeperatelyFromNumber( bool b )  { m_ReturnNegativeSeperatelyFromNumber = b; }
    
    const char* GetFileName()       { return m_Filename; }
    int         GetLineNumber()     { return m_CurrFileLine; }
    int         GetColumnNumber()   { return m_CurrFilePos - m_LastLinePos; }
	bool		IsNextToken()			{ return m_BufferIsNextToken; }

protected:    
    char*   m_Buffer;   
    int     m_BufferSize;

    char    m_Filename[ 256 ];
    char*   m_FileBuffer;
    int     m_FileSize;
    int     m_CurrFilePos;
    int     m_CurrFileLine;
    int     m_LastLinePos;

    bool    m_BufferIsNextToken, m_AtEndOfLine, m_AtEndOfFile;
    char*   m_CommentChars;
    char**  m_Operators;
    int     m_OperatorCount;
    int     m_NumOperatorCharsRead;
    
    bool    m_IsCaseSensitive;
    bool    m_ReturnNegativeSeperatelyFromNumber;
    bool    m_LastTokenWasQuotedString;
};
      

#endif
