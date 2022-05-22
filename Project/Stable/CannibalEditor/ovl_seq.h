#ifndef __OVL_SEQ_H__
#define __OVL_SEQ_H__
//****************************************************************************
//**
//**    OVL_SEQ.H
//**    Header - Overlays - Sequence
//**
//****************************************************************************
//----------------------------------------------------------------------------
//    Headers
//----------------------------------------------------------------------------
#include "cbl_defs.h"
#include "ovl_defs.h"
#include "ovl_work.h"
#include "ovl_skin.h"
#include "ovl_frm.h"

//----------------------------------------------------------------------------
//    Definitions
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//    Class Prototypes
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//    Required External Class References
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//    Structures
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//    Public Data Declarations
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//    Public Function Declarations
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//    Class Headers
//----------------------------------------------------------------------------
///////////////////////////////////////////
////    OSequence
///////////////////////////////////////////

OVLTYPE(OSequence, OWindow)
{
public:
	modelSequence_t *seq;
	char sName[64];

    OVL_DEFINE(OSequence, OWindow)
    {
		seq = NULL;
		sName[0] = 0;
	}

    ~OSequence() {}

    void OnSave();
    void OnLoad();
    //void OnResize();
	void OnCalcLogicalDim(int dx, int dy);
    void OnDraw(int sx, int sy, int dx, int dy, ovlClipBox_t *clipbox);
    boolean OnPress(inputevent_t *event);
    boolean OnDrag(inputevent_t *event);
    boolean OnRelease(inputevent_t *event);
    boolean OnPressCommand(int argNum, char **argList);
    //boolean OnDragCommand(int argNum, char **argList);
    //boolean OnReleaseCommand(int argNum, char **argList);
    //boolean OnMessage(ovlmsg_t *msg);
};
extern OSequence OSequence_ovlprototype;

//****************************************************************************
//**
//**    END HEADER OVL_SEQ.H
//**
//****************************************************************************
#endif // __OVL_SEQ_H__
