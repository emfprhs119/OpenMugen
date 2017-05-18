//    Open Mugen is a redevelopment of Elecbyte's M.U.G.E.N wich will be 100% compatible to it
//    Copyright (C) 2004  Sahin Vardar
//
//    If you know bugs or have a wish on Open Muegn or (money/girls/a car) for me ;-)
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
#include "global.h"

//Contructor
CVirtualMachine::CVirtualMachine()
{
    m_Stack.ResetStack();
    nCurrentIns=0;
    InitFunctTable();
	srand(time(NULL));
}
//Destructor
CVirtualMachine::~CVirtualMachine()
{

}
//Sets pointers for get access to Player internal
void CVirtualMachine::SetPlayers(CPlayer *p1,CPlayer *p2)
{
   m_pPlayer1=p1;
   m_pPlayer2=p2;

}
//Sets the pointer to the Functions int this class
void CVirtualMachine::InitFunctTable()
{
   pFuncTable[OP_PUSH]=&CVirtualMachine::PushValue;
   pFuncTable[OP_POP]=&CVirtualMachine::PopValue;
   pFuncTable[OP_ADD]=&CVirtualMachine::AddOP;
   pFuncTable[OP_SUB]=&CVirtualMachine::SubOP;
   pFuncTable[OP_MUL]=&CVirtualMachine::MulOP;
   pFuncTable[5]=&CVirtualMachine::DivOP;
   pFuncTable[6]=&CVirtualMachine::EqualOP;
   pFuncTable[7]=&CVirtualMachine::NotEqual;
   pFuncTable[8]=&CVirtualMachine::Less;
   pFuncTable[9]=&CVirtualMachine::Greater;
   pFuncTable[10]=&CVirtualMachine::LessEqual;
   pFuncTable[11]=&CVirtualMachine::GreaterEqual;
   pFuncTable[12]=&CVirtualMachine::InterValOP1;
   pFuncTable[13]=&CVirtualMachine::InterValOP2;
   pFuncTable[14]=&CVirtualMachine::InterValOP3;
   pFuncTable[15]=&CVirtualMachine::InterValOP4;
   pFuncTable[16]=&CVirtualMachine::InterValOP5;
   pFuncTable[17]=&CVirtualMachine::InterValOP6;
   pFuncTable[18]=&CVirtualMachine::InterValOP7;
   pFuncTable[19]=&CVirtualMachine::InterValOP8;
   pFuncTable[20]=&CVirtualMachine::LogNot;
   pFuncTable[21]=&CVirtualMachine::LogAnd;
   pFuncTable[22]=&CVirtualMachine::LogOr;
   pFuncTable[23]=&CVirtualMachine::LogXor;
   pFuncTable[24]=&CVirtualMachine::Not;
   pFuncTable[25]=&CVirtualMachine::And;
   pFuncTable[26]=&CVirtualMachine::Or;
   pFuncTable[27]=&CVirtualMachine::Xor;
   pFuncTable[28]=&CVirtualMachine::Square;
   pFuncTable[29]=&CVirtualMachine::Neg;
   pFuncTable[30]=&CVirtualMachine::Abs;
   pFuncTable[31]=&CVirtualMachine::Acos;
   pFuncTable[32]=&CVirtualMachine::Alive;
   pFuncTable[33]=&CVirtualMachine::Anim;
   pFuncTable[34]=&CVirtualMachine::AnimElem;
   pFuncTable[35]=&CVirtualMachine::AnimeElemNo;
   pFuncTable[36]=&CVirtualMachine::AnimeElemTime;
   pFuncTable[37]=&CVirtualMachine::AnimExist;
   pFuncTable[38]=&CVirtualMachine::AnimTime;
   pFuncTable[39]=&CVirtualMachine::Asin;
   pFuncTable[40]=&CVirtualMachine::Atan;
   pFuncTable[41]=&CVirtualMachine::AuthorName;
   pFuncTable[42]=&CVirtualMachine::BackEdgeBodyDist;
   pFuncTable[43]=&CVirtualMachine::BackEdgeDist;
   pFuncTable[44]=&CVirtualMachine::CanRecover;
   pFuncTable[45]=&CVirtualMachine::Ceil;
   pFuncTable[46]=&CVirtualMachine::Command;
   pFuncTable[47]=&CVirtualMachine::Const;
   pFuncTable[48]=&CVirtualMachine::Cos;
   pFuncTable[49]=&CVirtualMachine::Ctrl;
   pFuncTable[50] = &CVirtualMachine::ConstCoordinate;//temp;
	   pFuncTable[51] = 0;//temp;
   pFuncTable[52]=&CVirtualMachine::DrawGame;
   pFuncTable[53]=0;//&CVirtualMachine::E;
   pFuncTable[54]=&CVirtualMachine::Exp;
   pFuncTable[55]=&CVirtualMachine::Facing;
   pFuncTable[56]=&CVirtualMachine::Floor;
   pFuncTable[57]=&CVirtualMachine::FrontEdgeBodyDist;
   pFuncTable[58]=&CVirtualMachine::FrontEdgeDist;
   pFuncTable[59]=&CVirtualMachine::FVar;
   pFuncTable[60]=&CVirtualMachine::GameTime;
   pFuncTable[61]=&CVirtualMachine::GetHitVar;
   pFuncTable[62]=&CVirtualMachine::HitCount;
   pFuncTable[63]=0;//HitDefAttr
   pFuncTable[64]=&CVirtualMachine::HitFall;
   pFuncTable[65]=&CVirtualMachine::HitOver;
   pFuncTable[66]=&CVirtualMachine::HitPauseTime;
   pFuncTable[67]=&CVirtualMachine::HitShakeOver;
   pFuncTable[68]=&CVirtualMachine::HitVel;
   pFuncTable[69]=&CVirtualMachine::PlayerIdent;
   pFuncTable[70]=&CVirtualMachine::IfElse;
   pFuncTable[71]=&CVirtualMachine::InGuardDist;
   pFuncTable[72]=&CVirtualMachine::IsHelper;
   pFuncTable[73]=&CVirtualMachine::IsHomeTeam;
   pFuncTable[74]=&CVirtualMachine::Life;
   pFuncTable[75]=&CVirtualMachine::LifeMax;
   pFuncTable[76]=&CVirtualMachine::LogN;
   pFuncTable[77]=&CVirtualMachine::Log;
   pFuncTable[78]=&CVirtualMachine::Lose;
   pFuncTable[79]=&CVirtualMachine::MatchNo;
   pFuncTable[80]=&CVirtualMachine::MatchOver;
   pFuncTable[81]=&CVirtualMachine::MoveContact;
   pFuncTable[82]=&CVirtualMachine::MoveGuarded;
   pFuncTable[83]=&CVirtualMachine::MoveHit;
   pFuncTable[84]=&CVirtualMachine::MoveType;
   pFuncTable[85]=&CVirtualMachine::MoveReversed;
   pFuncTable[86]=&CVirtualMachine::Name;
   pFuncTable[87]=&CVirtualMachine::NumEnemy;
   pFuncTable[88]=&CVirtualMachine::NumExplod;
   pFuncTable[89]=&CVirtualMachine::NumHelper;
   pFuncTable[90]=&CVirtualMachine::NumPartner;
   pFuncTable[91]=&CVirtualMachine::NumProj;
   pFuncTable[92]=&CVirtualMachine::NumProjID;
   pFuncTable[93]=&CVirtualMachine::NumTarget;
   pFuncTable[94] = 0;//&CVirtualMachine::P1Name;
   pFuncTable[95]=&CVirtualMachine::P2BodyDist;
   pFuncTable[96]=&CVirtualMachine::P2Dist;
   pFuncTable[97]=&CVirtualMachine::P2Life;
   pFuncTable[98]=&CVirtualMachine::P2MoveType;
   pFuncTable[99]=&CVirtualMachine::P2Name;
   pFuncTable[100]=&CVirtualMachine::P2StateNo;
   pFuncTable[101]=&CVirtualMachine::P2StateType;
   pFuncTable[102]=&CVirtualMachine::P3Name;
   pFuncTable[103]=&CVirtualMachine::P4Name;
   pFuncTable[104]=&CVirtualMachine::PalNo;
   pFuncTable[105]=&CVirtualMachine::ParentDist;
   pFuncTable[106]=&CVirtualMachine::Pi;
   pFuncTable[107]=&CVirtualMachine::Pos;
   pFuncTable[108]=&CVirtualMachine::Power;
   pFuncTable[109]=&CVirtualMachine::PowerMax;
   pFuncTable[110]=0;//PlayerIDExist
   pFuncTable[111] = &CVirtualMachine::PrevStateNo;
   pFuncTable[112]=&CVirtualMachine::ProjCancelTime;
   pFuncTable[113]=&CVirtualMachine::ProjContact;
   pFuncTable[114]=&CVirtualMachine::ProjContactTime;
   pFuncTable[115]=&CVirtualMachine::ProjGuarded;
   pFuncTable[116]=&CVirtualMachine::ProjGuardedTime;
   pFuncTable[117]=0;//ProjHit
   pFuncTable[118]=0;//ProjHitTime
   pFuncTable[119]=&CVirtualMachine::Random;
   pFuncTable[120]=&CVirtualMachine::RootDist;
   pFuncTable[121]=&CVirtualMachine::RoundNo;
   pFuncTable[122]=&CVirtualMachine::RoundsExisted;
   pFuncTable[123]=&CVirtualMachine::RoundState;
   pFuncTable[124]=&CVirtualMachine::ScreenPos;
   pFuncTable[125]=&CVirtualMachine::SelfAnimExist;
   pFuncTable[126]=&CVirtualMachine::Sin;
   pFuncTable[127]=&CVirtualMachine::StateNo;
   pFuncTable[128]=&CVirtualMachine::StateType;
   pFuncTable[129]=&CVirtualMachine::SysFVar;
   pFuncTable[130]=&CVirtualMachine::SysVar;
   pFuncTable[131]=&CVirtualMachine::Tan;
   pFuncTable[132] = &CVirtualMachine::TeamMode;
   pFuncTable[133]=&CVirtualMachine::TeamSide;
   pFuncTable[134]=&CVirtualMachine::TicksPerSecond;
   pFuncTable[135]=&CVirtualMachine::Time;
   pFuncTable[136] = 0;//&CVirtualMachine::TimeMod;
   pFuncTable[137] = &CVirtualMachine::UniqHitCount;
   pFuncTable[138] = &CVirtualMachine::Var;
   pFuncTable[139] = &CVirtualMachine::Vel;
   pFuncTable[140] = &CVirtualMachine::Win;
   pFuncTable[141] = &CVirtualMachine::MODOP;

   //pFuncTable[140] = 0;

}


//Executes one instruction line
float CVirtualMachine::Execute(INSTRUCTION *pInst)
{
    nCurrentIns=0;
    
        
    //Rest the Satck for the next execution
    m_Stack.ResetStack();
	
    while(pInst[nCurrentIns].n_OpCode!=OP_STOP)
    {
		
        pCurrentIns=&pInst[nCurrentIns];

		PrintMessage("%d,  %s %f\n",  pInst[nCurrentIns].n_OpCode, pInst[nCurrentIns].strValue, pInst[nCurrentIns].Value);
        //Execute the function
		//(this->*pFuncTable[136])();
		if (pInst[nCurrentIns].n_OpCode == 22)
			printf("");
		if (pInst[nCurrentIns].n_OpCode == 136)
			Vel();
		//else if ( pInst[nCurrentIns].n_OpCode != 132)
		else
        (this->*pFuncTable[pInst[nCurrentIns].n_OpCode])();
        nCurrentIns++;
    }
    PopValue();
    return m_pop.Value;

}
//Pops a value from the stack
void CVirtualMachine::PopValue()
{
   m_pop=m_Stack.Pop();
}

void CVirtualMachine::PushValue()
{
      m_Stack.Push(pCurrentIns->Value,pCurrentIns->strValue);
}
//x+y
void CVirtualMachine::AddOP()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=temp1+temp2;
  //  PrintMessage("%f + %f = %f",temp1,temp2,m_pop.Value);
    m_Stack.Push(m_pop.Value,"#");

}
//x-y
void CVirtualMachine::SubOP()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=temp1-temp2;
    m_Stack.Push(m_pop.Value,"#");

}
//x*y
void CVirtualMachine::MulOP()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=temp1*temp2;
    m_Stack.Push(m_pop.Value,"#");

}
//x/y
void CVirtualMachine::DivOP()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=temp1/temp2;
    m_Stack.Push(m_pop.Value,"#");

}
//x==Y
void CVirtualMachine::EqualOP()
{
   //char strTemp[50],strTemp1[50];

    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    if(temp1==temp2)
		m_Stack.Push(1, "#");
    else
		m_Stack.Push(0, "#");

#ifdef DEBUG    
    PrintMessage("%f == %f",temp1,temp2);
#endif
    //m_Stack.Push(m_pop.Value,"#");

}
//x!=y
void CVirtualMachine::NotEqual()
{
	PopValue();
	temp2 = m_pop.Value;
	PopValue();
	temp1 = m_pop.Value;
	if (temp1 != temp2)
		m_Stack.Push(1, "#");
	else
		m_Stack.Push(0, "#");

}
//x<y
void CVirtualMachine::Less()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    

    if(temp1<temp2)
        m_pop.Value=1;
    else
        m_pop.Value=0;
        

    m_Stack.Push(m_pop.Value,"#");

}
//x>y
void CVirtualMachine::Greater()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    

    if(temp1>temp2)
        m_pop.Value=1;
    else
        m_pop.Value=0;
        
   // PrintMessage("%f > %f",temp1,temp2);

    m_Stack.Push(m_pop.Value,"#");

}
//x<=y
void CVirtualMachine::LessEqual()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    

    if(temp1<=temp2)
        m_pop.Value=1;
    else
        m_pop.Value=0;

    m_Stack.Push(m_pop.Value,"#");


}

void CVirtualMachine::GreaterEqual()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    

    if(temp1>=temp2)
        m_pop.Value=1;
    else
        m_pop.Value=0;

    m_Stack.Push(m_pop.Value,"#");


}
//x=[y,z]
void CVirtualMachine::InterValOP1()
{
    //Get Values from stack
    PopValue();
    temp3=m_pop.Value;
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=0;
     
    if( (temp1 >= temp2) && (temp1 <= temp3) )
      m_pop.Value=1;
            
   m_Stack.Push(m_pop.Value,"#");
   
 //  PrintMessage("%2f,%2f,%2f",temp1,temp2,temp3);
      
}
//x=[y,z)
void CVirtualMachine::InterValOP2()
{
    PopValue();
    temp3=m_pop.Value;
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=0;
     
    if( (temp1 >= temp2) && (temp1 < temp3) )
      m_pop.Value=1;
            
   m_Stack.Push(m_pop.Value,"#");
    
}
//x=(y,z]
void CVirtualMachine::InterValOP3()
{
    PopValue();
    temp3=m_pop.Value;
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=0;
     
    if( (temp1 > temp2) && (temp1 <= temp3) )
      m_pop.Value=1;
            
   m_Stack.Push(m_pop.Value,"#");
}
//x=(y,z)
void CVirtualMachine::InterValOP4()
{
    PopValue();
    temp3=m_pop.Value;
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=0;
     
    if( (temp1 > temp2) && (temp1 < temp3) )
      m_pop.Value=1;
            
   m_Stack.Push(m_pop.Value,"#");
}
//x!=[y,z]
void CVirtualMachine::InterValOP5()
{
    //Get Values from stack
    PopValue();
    temp3=m_pop.Value;
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=0;
     
    //(x < y) || (x > z)
    if( (temp1 < temp2) || (temp1 > temp3) )
      m_pop.Value=1;
            
   m_Stack.Push(m_pop.Value,"#");
      
}
//x!=[y,z)
void CVirtualMachine::InterValOP6()
{
    PopValue();
    temp3=m_pop.Value;
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=0;
     
    if( (temp1 < temp2) || (temp1 >= temp3) )
      m_pop.Value=1;
            
   m_Stack.Push(m_pop.Value,"#");
    
}
//x!=(y,z]
void CVirtualMachine::InterValOP7()
{
    PopValue();
    temp3=m_pop.Value;
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=0;
     
     if( (temp1 <= temp2) || (temp1 > temp3) )
      m_pop.Value=1;
            
   m_Stack.Push(m_pop.Value,"#");
}
//x!=(y,z)
void CVirtualMachine::InterValOP8()
{
    PopValue();
    temp3=m_pop.Value;
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    m_pop.Value=0;
     
    if( (temp1 >= temp2) && (temp1 <= temp3) )
      m_pop.Value=1;
            
   m_Stack.Push(m_pop.Value,"#");
}


void CVirtualMachine::LogNot()
{
    PopValue();
    temp1=m_pop.Value;

#ifdef DEBUG
    PrintMessage("LogNOT");
#endif
    
    if(!(temp1>0))
        m_Stack.Push(1,"#");
    else
        m_Stack.Push(0,"#");
    
       

}

void CVirtualMachine::LogAnd()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    if( temp1>0 && temp2>0)
        m_Stack.Push(1,"#");
    else
        m_Stack.Push(0,"#"); 
    }

void CVirtualMachine::LogOr()
{

    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    if( temp1>0 || temp2>0)
        m_Stack.Push(1,"#");
    else
        m_Stack.Push(0,"#"); 

}

void CVirtualMachine::LogXor()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    if( temp1>0  && temp2==0)
        m_Stack.Push(1,"#");
    else if ( temp1==0  && temp2>0)
        m_Stack.Push(1,"#"); 
    else
        m_Stack.Push(0,"#"); 

}

void CVirtualMachine::Not()
{
    PopValue();
    
    temp1=m_pop.Value;
        
    temp1=!(int)temp1;
    m_Stack.Push(temp1,"#");

}

void CVirtualMachine::And()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    temp1=(int)temp1 & (int)temp2;
    m_Stack.Push(temp1,"#");

}

void CVirtualMachine::Or()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    temp1=(int)temp1 | (int)temp2;
    m_Stack.Push(temp1,"#");

}

void CVirtualMachine::Xor()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    temp1=(int)temp1 ^ (int)temp2;
    m_Stack.Push(temp1,"#");

}

//Square x^y
void CVirtualMachine::Square()
{
    PopValue();
    temp2=m_pop.Value;
    PopValue();
    temp1=m_pop.Value;
    
    temp1=pow(temp1,temp2);
    m_Stack.Push(temp1,"#");
}
//ABS
void CVirtualMachine::Abs()
{
    PopValue();
    temp1=m_pop.Value;
    
    temp1=fabs(temp1);
    m_Stack.Push(temp1,"#");
    
}
//Negate
void CVirtualMachine::Neg()
{
    PopValue();
    temp1=m_pop.Value;
    
    temp1=-temp1;
    m_Stack.Push(temp1,"#");

}

void CVirtualMachine::Acos()
{
    PopValue();
    temp1=m_pop.Value;
    
    temp1=acos(temp1);
    m_Stack.Push(temp1,"#");

}
//Alive
void CVirtualMachine::Alive()
{
  if(m_pPlayer1->IsPlayerAlive())
     m_Stack.Push(1.0f,"#");
  else
     m_Stack.Push(0.0f,"#");
}

//Anime
void CVirtualMachine::Anim()
{
  m_Stack.Push((float)m_pPlayer1->GetAnim(),"#");
}

//Anime Elem
void CVirtualMachine::AnimElem()
{
    ActionElement* tActionElement;
    
    tActionElement=m_pPlayer1->GetCurrAnim();
    
           
    //Time since this element
    //m_Stack.Push((float)tActionElement->nCurrTime,"#");
    //Element nummber(NOTE first element is not 0 it is 1)
    m_Stack.Push((float)tActionElement->nCurrentImage+1,"#");
  
       
/* TODO (#1#): Push the right values to the stack */


}
//AnimElemNo(exprs)
void CVirtualMachine::AnimeElemNo()
{   
    ActionElement* tActionElement;
    tActionElement=m_pPlayer1->GetCurrAnim();

    int nTimeOffset=0;
    int nTimeCheck=0;
    int nTimeToElement=0;

        
    PopValue();
    nTimeOffset=(int)m_pop.Value;
    
    nTimeCheck=nTimeOffset+tActionElement->nCurrTime;
    
    if(nTimeCheck > tActionElement->nCompletAnimTime)
    {
#ifdef DEBUG
    PrintMessage("AnimeElemNo should return SFalse");
#endif
    m_Stack.Push(0,"#");
    return;
    }
  
    //now check on which elemt the time offset is  
    for (int i=0;i<tActionElement->nNumberOfElements;i++)
    {
        nTimeToElement+=tActionElement->AnimationElement[i].nDuringTime;
        if(nTimeToElement >= nTimeCheck)
        {
            //Now we had found wich elemt it would be on this time
            m_Stack.Push((float)i+1,"#");
            return;
        
        }
        
    
    }
    
    m_Stack.Push(0,"#");


 
}
//AnimElemTime(exprs)
void CVirtualMachine::AnimeElemTime()
{
    ActionElement* tActionElement;
    tActionElement=m_pPlayer1->GetCurrAnim();
    
    int nElementToCheck;

    PopValue();
    nElementToCheck=(int)m_pop.Value;
    
    //(NOTE first element is not 0 it is 1)
    if(nElementToCheck == tActionElement->nCurrentImage+1 && !tActionElement->bLooped )
    {
		m_Stack.Push((float)tActionElement->nCurrentImageTime, "#");
    
    }
    else
    {
        //Should return SFalse
        m_Stack.Push(-1,"#");    
    }

}

//AnimExist(exprs)
void CVirtualMachine::AnimExist()
{
    s32 nAnim;
    PopValue();
    nAnim=(s32)m_pop.Value;
    //If != NULL psuh true else push false
    if(m_pPlayer1->IsAnimAviable(nAnim))
        m_Stack.Push(1.0,"#");
    else
        m_Stack.Push(0.0,"#");

}

//AnimeTime
void CVirtualMachine::AnimTime()
{
    int nAnimTime;
    ActionElement* tActionElement;
    
    tActionElement=m_pPlayer1->GetCurrAnim();

	nAnimTime = (s16)tActionElement->nCurrTime - tActionElement->nCompletAnimTime ;
	
    m_Stack.Push((int)nAnimTime,"#");
}

//Asin(expr)
void CVirtualMachine::Asin()
{
    PopValue();
    temp1=m_pop.Value;
    temp1=asin(temp1);
    
    m_Stack.Push(temp1,"#");

}

//Atan (expr)
void CVirtualMachine::Atan()
{
    PopValue();
    temp1=m_pop.Value;
    temp1=atan(temp1);
    m_Stack.Push(temp1,"#");

}

//Author Name
void CVirtualMachine::AuthorName()
{
    //PrintMessage("AuthorName %s",((CPlayer*)m_p1)->myPlayerData.strAuthor);
    m_Stack.Push(0,((CPlayer*)m_p1)->GetInfo().author);
}
 
//BackEdgeBodyDist
void CVirtualMachine::BackEdgeBodyDist()
{
    m_Stack.Push(123,"#");
    
}
//BackEdgeDist
void CVirtualMachine::BackEdgeDist()
{
        m_Stack.Push(123,"#");
}
//CanRecover
void CVirtualMachine::CanRecover()
{
    //Push false for the moment
    m_Stack.Push(1,"#");    

}

//Ceil
void CVirtualMachine::Ceil()
{
    PopValue();
    temp1=m_pop.Value;
    temp1=ceil(temp1);
    m_Stack.Push(temp1,"#");

}
//Command
void CVirtualMachine::Command()
{
	/*
	if (!m_pPlayer1->IsCtrl())
	{
		m_Stack.Push(0,NULL);
		return;
	}
	*/
	PopValue();
	temp1 = m_pop.Value;
	PopValue();
	
	if (temp1 == 0)// EQUAL
		m_Stack.Push((m_pPlayer1->GetBCommand()[(int)m_pop.Value]),"#");
	else// NOT EQUAL
		m_Stack.Push((!m_pPlayer1->GetBCommand()[(int)m_pop.Value]), "#");
	
	
}

//Const
void CVirtualMachine::Const()
{
	PopValue();
    temp1=m_pop.Value;
    //TODO: Write the GetConst function for player
   switch((int)temp1)
   {
      //data.life
      case Const_Data_Life:
        m_Stack.Push((float)((CPlayer*)m_p1)->GetConst().PlayerData.nLife,"#");
      break;
      
      //data.attack
      case 1:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerData.nAttack,"#");
      break;
      
      //data.defence
      case 2:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerData.nDefence,"#");
      break;
      
      //data.fall.defence_mul
      case 3:
         temp1=100/(m_pPlayer1->GetConst().PlayerData.nFallDefenceUp+100);
        m_Stack.Push(temp1,"#");
      break;
      
      //data.liedown.time
      case 4:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerData.nLieDownTime,"#");
      break;
      
      //data.airjuggle
      case 5:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerData.nAirjuggle,"#");
      break;

      //data.sparkno
      case 6:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerData.nSparkno,"#");
      break;   

     //data.guard.sparkno
      case 7:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerData.nGuardSparkno,"#");
      break; 
      
     //data.KO.echo
      case 8:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerData.bKoEcho,"#");
      break; 
      
     //data.IntPersistIndex
      case 9:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerData.nIntPersistIndex,"#");
      break; 

     //data.IntPersistIndex
      case 10:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerData.nFloatPersistIndex,"#");
      break; 
      
      //size.xscale
      case 11:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nXscale,"#");
      break; 
     
      //size.yscale
      case 12:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nYscale,"#");
      break; 
      
      //size.ground.back
      case 13:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nGroundBack,"#");
      break; 
      
      //size.ground.front
      case 14:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nGroundFront,"#");
      break; 
      
      //size.air.back
      case 15:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nAirBack,"#");
      break; 
      
      //size.air.front
      case 16:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nAirFront,"#");
      break; 
      
      //size.attack.dist
      case 17:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nAttackDistance,"#");
      break; 
      
      //size.proj.attack.dist
      case 18:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nProjAttackDist,"#");
      break; 
      
      //size.proj.doscale
      case 19:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.bProjDoScale,"#");
      break; 
      
      //size.head.pos.x
      case 20:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nHeadPos.x,"#");
      break;

      //size.head.pos.y
      case 21:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nHeadPos.y,"#");
      break;  
      
      //size.mid.pos.x
      case 22:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nMidPos.x,"#");
      break;
      
      //size.mid.pos.y
      case 23:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nMidPos.y,"#");
      break;
      
      //size.size.shadowoffset
      case 24:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nShadowOffset,"#");
      break;
      
      //size.draw.offset.x
      case 25:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nDrawOffset.x,"#");
      break;
      
      //size.draw.offset.x
      case 26:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerSize.nDrawOffset.x,"#");
      break;
      
      //velocity.walk.fwd.x
      case 27:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.nWalkFwd,"#");
      break;
      
      //velocity.walk.back.x
      case 28:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.nWalkBack,"#");
      break;
      
      //velocity.run.fwd.x
      case 29:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.RunFwd.x,"#");
      break;
      
      //velocity.run.fwd.y
      case 30:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.RunFwd.y,"#");
      break;
      
      //velocity.run.back.x
      case 32:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.RunBack.x,"#");
      break;
      
      //velocity.run.back.y
      case 33:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.RunBack.y,"#");
      break;
      
      //velocity.jump.neu.x
      case 34:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.JumpNeu.x,"#");
      break;
      
      //velocity.jump.back.x
      case 35:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.JumpBack.x,"#");
      break;

      //velocity.jump.fwd.x
      case 36:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.JumpFwd.x,"#");
      break;
      
      //velocity.runjump.back.x
      case 37:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.RunBack.x,"#");
      break;
      
      //velocity.runjump.fwd.x
      case 38:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.RunFwd.x,"#");
      break;
      
      //velocity.airjump.neu.x
      case 39:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.AirjumpNeu.x,"#");
      break;
      
      //velocity.airjump.back.x
      case 40:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.AirjumpBack.x,"#");
      break;
      
      //velocity.airjump.fwd.x
      case 41:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.AirjumpFwd.x,"#");
      break;
      
      //movement.airjump.num
      case 42:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.AirJumpNum,"#");
      break;
      
      //movement.airjump.height
      case 43:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.nAirJumpHight,"#");
      break;
      
      //movement.yaccel
      case 44:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.yaccel,"#");
      break;
      
      //movement.stand.friction
      case 45:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.StandFriction,"#");
      break;
	  case 46:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.CrouchFriction, "#");
		  break;
	  case 47:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.StandFrictionThreshold, "#");
		  break;
      //movement.crouch.friction
      case 48:
        m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.CrouchFrictionThreshold,"#");
      break;
	  //movement.crouch.friction.threadhold
      //velocity.jump.y
      case 49:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.JumpNeu.y, "#");
      break;
      //velocity.airjump.y
      case 50:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerVelocity.AirjumpNeu.y, "#");
      break;
	  case 51:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.air_gethit_groundlevel, "#");
		  break;
	  case 52:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.air_gethit_groundrecover_ground_threshold, "#");break;
	  case 53:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.air_gethit_groundrecover_groundlevel, "#");break;
	  case 54:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.air_gethit_airrecover_threshold, "#");break;
	  case 55:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.air_gethit_airrecover_yaccel, "#");break;
	  case 56:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.air_gethit_trip_groundlevel, "#");break;
	  case 57:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.down_bounce_offset.x, "#"); break; 
	  case 58:
			  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.down_bounce_offset.y, "#"); break;
	  case 59:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.down_bounce_yaccel, "#");break;
	  case 60:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.down_bounce_groundlevel, "#");break;
	  case 61:
		  m_Stack.Push(m_pPlayer1->GetConst().PlayerMovement.down_friction_threshold, "#");break;
      default:
        //PrintMessage("CVirtualMachine::Invalide Const Param");
		m_Stack.Push(0, "#");
      break;
   }

}
void CVirtualMachine::ConstCoordinate(){
	temp1=m_pop.Value;
	PopValue();
	temp2 = m_pop.Value;
	if (temp1 == 240)
		temp1 = 320;
	else if (temp1 == 480)
		temp1 = 640;
	else if (temp1 == 720)
		temp1 = 1024;
	m_Stack.Push(m_pPlayer1->GetInfo().localcoord.x / temp1*temp2,"#");
	
}
//cosinus
void CVirtualMachine::Cos()
{
    PopValue();
    temp1=m_pop.Value;
    
    temp1=cos(temp1);
    m_Stack.Push(temp1,"#");

}

//Check control of player
void CVirtualMachine::Ctrl()
{
   if(m_pPlayer1->IsCtrl())
        m_Stack.Push(1.0,"#");
    else
        m_Stack.Push(0.0,"#");

}
//DrawGame TODO:Complete this
void CVirtualMachine::DrawGame()
{
  m_Stack.Push(0.0,"#");
}

//Exp to e
void CVirtualMachine::Exp()
{
    PopValue();
    temp1=m_pop.Value;
    
    temp1=pow(2.71828182f,temp1);
    m_Stack.Push(temp1,"#");
 
}
//retunr the facing direction
void CVirtualMachine::Facing()
{
    //true = right facing = 1
    //flase = left facing = -1
  /*  if(m_pPlayer1->PlRtInfo.bFacing)
       m_Stack.Push(1.0,"#");
    else
       m_Stack.Push(-1.0,"#");*/

}

//Floor
void CVirtualMachine::Floor()
{
    PopValue();
    temp1=m_pop.Value;
    
    temp1=floor(temp1);
    m_Stack.Push(temp1,"#");

}

//FrontEdgeBodyDist
void CVirtualMachine::FrontEdgeBodyDist()
{
    //TODO:Compute the distance between the front and the player
     m_Stack.Push(124,"#");
}

//FrontEdgeDist
void CVirtualMachine::FrontEdgeDist()
{
    //TODO:Compute the distance between the x-axis of the player and  screen
     m_Stack.Push(124,"#");
}
//FVAR
void CVirtualMachine::FVar()
{
    PopValue();
    temp1=m_pop.Value;
    
	temp1 = m_pPlayer1->GetVar(CPN_fvar,temp1);
    m_Stack.Push(temp1,"#");

}

//GameTime
void CVirtualMachine::GameTime()
{
    //TODO:Put the real game time on Stack
  //m_Stack.Push((float)GetGameTicks(),"#");
    
}

//GetHitVar
void CVirtualMachine::GetHitVar()
{
    //TODO:Get the correct Hitvar and push it on the stack
    PopValue();
    temp1=m_pop.Value;
	HITVARDATA hitVarData = m_pPlayer2->GetHitVarData();
	switch (GetHitVarNum((int)temp1)){
	case xveladd:break;
	case yveladd:break;
	case type:break;
		case animtype:temp1 = hitVarData.animtype; break;
		case airtype:break;
		case groundtype:temp1 = hitVarData.ground_type-6; break;
		case damage:temp1 = hitVarData.hit_damage; break;
		case hitcount:break;
		case fallcount:temp1 = 0; break;
		case hitshaketime:temp1 = hitVarData.hitshaketime; break;
		case hittime:temp1 = hitVarData.ground_hittime; break;
		case slidetime:temp1 = hitVarData.ground_slidetime; break;
		case ctrltime:break;
		case recovertime:break;
		case xoff:break;
		case yoff:break;
		case zoff:break;
		case xvel:temp1 = 0; break;
		case yvel:temp1 = hitVarData.ground_velocity.y; break;
		case yaccel:temp1 = hitVarData.yaccel; break;
		case hitid:break;
		case chainid:break;
		case guarded:break;
		case fall:temp1=hitVarData.fall; break;
		case fall_damage:break;
		case fall_xvel:break;
		case fall_yvel:temp1 = hitVarData.fall_yvelocity; break;
		case fall_recover:break;
		case fall_time:break;
		case fall_recovertime:break;
		case GetHitVarCount:break;
			temp1 = 0;
			break;

	}
	
	m_Stack.Push(temp1, "#");

}

void CVirtualMachine::HitCount()
{
   //TODO:Push the correct value on stack
   m_Stack.Push(0,"#");

}


void CVirtualMachine::HitFall()
{
	//m_Stack.Push(1, "#");
	m_Stack.Push(m_pPlayer2->GetHitVarData().fall, "#");
}

void CVirtualMachine::HitOver()
{
    m_Stack.Push(m_pPlayer2->GetHitVarData().ground_hittime<0,"#");
}

void CVirtualMachine::HitPauseTime()
{
     m_Stack.Push(0,"#");
}

void CVirtualMachine::HitShakeOver()
{
	m_Stack.Push(m_pPlayer2->GetHitVarData().hitshaketime == 0, "#");
}

//HitVel [component]
void CVirtualMachine::HitVel()
{
    PopValue();
    temp1=m_pop.Value;
    
    //Pop the component value
    //1==X 2==y
     m_Stack.Push(0,"#");

}

//ID return the ID number of the player
void CVirtualMachine::PlayerIdent()
{
  //  m_Stack.Push((float)m_pPlayer1->PlRtInfo.nID,"#");

}

//IfElse(exp_cond,exp_true,exp_false)#
void CVirtualMachine::IfElse()
{
    //pops in reverse order
    //exp_false
    PopValue();
    temp3=m_pop.Value;
    //exp_true
    PopValue();
    temp2=m_pop.Value;
    //exp_cond
    PopValue();
    temp1=m_pop.Value;
    
    if(temp1!=0)
        m_Stack.Push(temp2,"#");
    else
        m_Stack.Push(temp3,"#");

}

/*        InGuardDist 
Returns 1 if the player is within guarding distance of an opponent's physicalor projectile attack.
The guarding distance is the value of the guard.dist parameter of the
opponent's HitDef. Returns 0 if out of guard distance, or the opponent is not attacking.
*/
void CVirtualMachine::InGuardDist()
{
    m_Stack.Push(0,"#");
}

//Is helper
void CVirtualMachine::IsHelper()
{
     m_Stack.Push(0,"#");
}

//IsHomeTeam
void CVirtualMachine::IsHomeTeam()
{
    m_Stack.Push(0,"#");
}
//return the life of the player
void CVirtualMachine::Life()
{
    m_Stack.Push((float)m_pPlayer1->GetLife(),"#");
}

//return the max life
void CVirtualMachine::LifeMax()
{
   m_Stack.Push((float)m_pPlayer1->GetConst().PlayerData.nLife,"#");
}

void CVirtualMachine::LogN()
{
    m_Stack.Push(m_Stack.Pop().Value,"#");

}

void CVirtualMachine::Log()
{
    //Push  the 2 arguments
    m_Stack.Pop();
    m_Stack.Pop();
    m_Stack.Push(0,"#");
}

void CVirtualMachine::Lose()
{
    //Pop the parameter 1=Lose, 2=LoseKO ,3=LoseTime
    switch((int)m_Stack.Pop().Value)
    {
        case 1:
          m_Stack.Push(0,"#");
        break;
        
        case 2:
          m_Stack.Push(0,"#");
        break;
        
        case 3:
          m_Stack.Push(0,"#");
        break;
    
    
    }

}
//Returns the current match number.
void CVirtualMachine::MatchNo()
{
    m_Stack.Push(1,"#");
}

void CVirtualMachine::MatchOver()
{
    m_Stack.Push(0,"#");
}

void CVirtualMachine::MoveContact()
{
    m_Stack.Push(0,"#");
}

void CVirtualMachine::MoveGuarded()
{
    m_Stack.Push(0,"#");
}

void CVirtualMachine::MoveHit()
{
    m_Stack.Push(0,"#");
}

/*MoveType gives the player's move-type. Refer to the section
  on StateDef in the CNS documentation for more details on MoveType.
  Useful for "move interrupts" in the CMD file.
*/
void CVirtualMachine::MoveType()
{   
    //Pop the type to check
    //Types are A(ttack),I(dle),H(it)
    m_Stack.Pop();
    
    //for now push False on the stack
    m_Stack.Push(0,"#");

}

void CVirtualMachine::MoveReversed()
{
    //for now push False on the stack
    m_Stack.Push(0,"#");
}

void CVirtualMachine::Name()
{
    //Push the name of the player
 //   m_Stack.Push(0,m_pPlayer1->myPlayerData.strName);

}

void CVirtualMachine::NumEnemy()
{
    //for now only one enemy is supported
    m_Stack.Push(1,"#");

}

void CVirtualMachine::NumExplod()
{
     if(m_Stack.Pop().Value==1)
    {
        //Pop the parameter
         PrintMessage("NumExplod Paramerter is %i",(int)m_Stack.Pop().Value);
          m_Stack.Push(0,"#");
    }
    else
    {
        //default
        m_Stack.Push(0,"#");
    }

}

//Return the Number of helpers
void CVirtualMachine::NumHelper()
{
    if(m_Stack.Pop().Value==1)
    {
        //Pop the parameter
         PrintMessage("NumHelper Paramerter is %i",(int)m_Stack.Pop().Value);
          m_Stack.Push(0,"#");
    }
    else
    {
        //default
        m_Stack.Push(0,"#");
    }
    
    

}

void CVirtualMachine::NumPartner()
{
     m_Stack.Push(0,"#");
}

void CVirtualMachine::NumProj()
{
    m_Stack.Push(0,"#");
}

void CVirtualMachine::NumProjID()
{
    m_Stack.Pop();
    m_Stack.Push(0,"#");
}

void CVirtualMachine::NumTarget()
{
   if(m_Stack.Pop().Value==1)
    {
        //Pop the parameter
         PrintMessage("NumTarget Paramerter is %i",(int)m_Stack.Pop().Value);
          m_Stack.Push(0,"#");
    }
    else
    {
        //default
        m_Stack.Push(0,"#");
    }

}

void  CVirtualMachine::P2BodyDist()
{
    //1 = X Value
    if(m_Stack.Pop().Value==1)
    {
           m_Stack.Push(0,"#");
    }//Else y value
    else
    {
        //default
        m_Stack.Push(0,"#");
    }

}

void CVirtualMachine::P2Dist()
{
    //1 = X Value
    if(m_Stack.Pop().Value==1)
    {
           m_Stack.Push(0,"#");
    }//Else y value
    else
    {
        //default
        m_Stack.Push(0,"#");
    }

}
void CVirtualMachine::P2Life()
{
  //  m_Stack.Push((float)((CPlayer*)m_p2)->PlRtInfo.nLife,"#");

}

void CVirtualMachine::P2MoveType()
{
    //default
    m_Stack.Push(0,"#");

}

void CVirtualMachine::P2Name()
{
   // m_Stack.Push(0,((CPlayer*)m_p2)->myPlayerData.strName);

}

void CVirtualMachine::P2StateNo()
{
  //   m_Stack.Push((float)((CPlayer*)m_p2)->PlRtInfo.nState,"#");
}

void CVirtualMachine::P2StateType()
{
     m_Stack.Push(0,"#");
}

void CVirtualMachine::P3Name()
{
     m_Stack.Push(0,"P3Name");
}

void CVirtualMachine::P4Name()
{
     m_Stack.Push(0,"P4Name");
}

void CVirtualMachine::PalNo()
{
    m_Stack.Push(0,"#");
}

void CVirtualMachine::ParentDist()
{
    //1 = X Value
    if(m_Stack.Pop().Value==1)
    {
           m_Stack.Push(0,"#");
    }//Else y value
    else
    {
        //default
        m_Stack.Push(0,"#");
    }

}

void CVirtualMachine::Pi()
{
    m_Stack.Push(3.141592653589f,"#");
}

void CVirtualMachine::PlayerIDExist()
{
    //default
    m_Stack.Pop();
    m_Stack.Push(0,"#");

}

void CVirtualMachine::PrevStateNo()
{
   m_Stack.Push((float)m_pPlayer1->GetPrevStateNo(),"#");
}

void CVirtualMachine::Pos()
{
    //1 = X Value
    if(m_Stack.Pop().Value==1)
    {
		m_Stack.Push(m_pPlayer1->PosGetX(), "#");
    }//Else y value
	else
    {
        //default
        m_Stack.Push(m_pPlayer1->PosGetY(),"#");
    }

}

void CVirtualMachine::Power()
{
	//m_Stack.Push((float)1000, "#");
  m_Stack.Push((float)m_pPlayer1->GetPower(),"#");
}

void CVirtualMachine::PowerMax()
{
   m_Stack.Push(3000,"#");
}

void CVirtualMachine::ProjCancelTime()
{
    m_Stack.Pop();
    m_Stack.Push(1000,"#");
}
void CVirtualMachine::Random()
{
	
  m_Stack.Push((float)(rand()%1000),"#"); 

}

void CVirtualMachine::RootDist()
{
 //1 = X Value
    if(m_Stack.Pop().Value==1)
    {
           m_Stack.Push(0,"#");
    }//Else y value
    else
    {
        //default
        m_Stack.Push(0,"#");
    }

}

void CVirtualMachine::RoundNo()
{
     m_Stack.Push(0,"#");
}

void CVirtualMachine::RoundsExisted()
{
    m_Stack.Push(0,"#");
}

void CVirtualMachine::RoundState()
{
    //2= do battle
    m_Stack.Push(2,"#");

}
void CVirtualMachine::ScreenPos()
{
//1 = X Value
 /*   if(m_Stack.Pop().Value==1)
    {
       m_Stack.Push(m_pPlayer1->PlRtInfo.x,"#");
    }//Else y value
    else
    {
        //default
        m_Stack.Push(m_pPlayer1->PlRtInfo.y,"#");
    }
*/
}

void CVirtualMachine::SelfAnimExist()
{
    int nAnim;
    PopValue();
    nAnim=(int)m_pop.Value;
    //If != NULL push true else push false
    if(m_pPlayer1->GetAirAction(nAnim) != NULL)
        m_Stack.Push(1,"#");
    else
        m_Stack.Push(0,"#");
    

}


void CVirtualMachine::Sin()
{
    m_Stack.Push(sin(m_Stack.Pop().Value),"#");
}

void CVirtualMachine::StateNo()
{
    m_Stack.Push((float)m_pPlayer1->GetStateNo(),"#");
}

void CVirtualMachine::StateType()
{
	m_Stack.Push((float)m_pPlayer1->GetStateType(), "#");
}

void CVirtualMachine::SysFVar()
{
	PopValue();
	temp1 = m_pop.Value;

	temp1 = m_pPlayer1->GetVar(CPN_sysfvar, temp1);
	m_Stack.Push(temp1, "#");

}

void CVirtualMachine::SysVar()
{
	PopValue();
	temp1 = m_pop.Value;

	temp1 = m_pPlayer1->GetVar(CPN_sysvar, temp1);
	m_Stack.Push(temp1, "#");

}

void CVirtualMachine::Tan()
{
    m_Stack.Push(tan(m_Stack.Pop().Value),"#");
}

void CVirtualMachine::TeamMode()
{
    m_Stack.Push(0,"#");
}

void CVirtualMachine::TeamSide()
{
     m_Stack.Push(1,"#");
}

void CVirtualMachine::TicksPerSecond()
{
     m_Stack.Push(60,"#");
}

void CVirtualMachine::Time()
{
	m_Stack.Push((m_pPlayer1->GetTime()), "#");
}

void CVirtualMachine::UniqHitCount()
{
     m_Stack.Push(1,"#");
}

void CVirtualMachine::Var()
{
	PopValue();
	temp1 = m_pop.Value;

	temp1 = m_pPlayer1->GetVar(CPN_var, temp1);
	m_Stack.Push(temp1, "#");

}

void CVirtualMachine::Vel()
{
	
    //1 = X Value
	
	PopValue();
    if(m_pop.Value==1)
    {
    m_Stack.Push(m_pPlayer1->VelGetX(),"#");
    }//Else y value
	else
    {
        //default
		m_Stack.Push(m_pPlayer1->VelGetY(), "#");
    }
	
}

void CVirtualMachine::Win()
{
    switch((int)m_Stack.Pop().Value)
    {
        //Win
        case 1:
          m_Stack.Push(0,"#");      
        break;
        //WinKO
        case 2:
         m_Stack.Push(0,"#");
        break;
        //WinTime
        case 3:
         m_Stack.Push(0,"#");
        break;
        //WinPerfect
        case 4:
         m_Stack.Push(0,"#");
        break;
   
    }


}

void CVirtualMachine::ProjContact()
{
    m_Stack.Push(1,"#");
    m_Stack.Push(2,"#");

}

void CVirtualMachine::ProjContactTime()
{
    m_Stack.Pop();
    m_Stack.Push(0,"#");

}

void CVirtualMachine::ProjGuarded()
{
    m_Stack.Push(1,"#");
    m_Stack.Push(2,"#");

}

void CVirtualMachine::ProjGuardedTime()
{
    m_Stack.Pop();
    m_Stack.Push(0,"#");

}

void CVirtualMachine::MODOP()
{
    int nDividend,nDivisor;
    
    PopValue();
    nDivisor=(int)m_pop.Value;
    PopValue();
    nDividend=(int)m_pop.Value;
 #ifdef DEBUG
    PrintMessage("ModOp %i Mod %i=%i",nDividend,nDivisor);
#endif   
    
    nDividend=nDividend % nDivisor;

    
    if(nDividend==0)
        m_Stack.Push(1,"#");
    else
        m_Stack.Push(0,"#");
    


}

//Save one Value from stack for tempory 
void CVirtualMachine::Save()
{
    nSave=m_Stack.Pop().Value;
#ifdef DEBUG 
  PrintMessage("Save %f",nSave);
#endif    
    
}

//Restore the tempory Value to stack
void CVirtualMachine::Restore()
{
#ifdef DEBUG
    PrintMessage("restore %f",nSave);
#endif
    m_Stack.Push(nSave,"#");
    
}


