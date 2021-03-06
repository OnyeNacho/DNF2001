#ifndef __KRNINC_H__
#define __KRNINC_H__
//****************************************************************************
//**
//**    KRNINC.H
//**    Header - Kernel Includes
//**
//****************************************************************************
//============================================================================
//    HEADERS
//============================================================================
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
#include <stdarg.h>
#include <math.h>
#include <float.h>

#ifdef KRNINC_WIN32
	#ifdef KRNINC_MFC
		#define VC_EXTRALEAN
		#include <afxwin.h>
		#include <afxext.h>
		#include <afxdisp.h>
		#include <afxdtctl.h>
		#ifndef _AFX_NO_AFXCMN_SUPPORT
			#include <afxcmn.h>
		#endif // _AFX_NO_AFXCMN_SUPPORT
	#else // KRNINC_MFC
		#include <windows.h>
		#include <windowsx.h>
	#endif // KRNINC_MFC
#endif // KRNINC_WIN32

//============================================================================
//    DEFINITIONS / ENUMERATIONS / SIMPLE TYPEDEFS
//============================================================================
//============================================================================
//    CLASSES / STRUCTURES
//============================================================================
//============================================================================
//    GLOBAL DATA
//============================================================================
//============================================================================
//    GLOBAL FUNCTIONS
//============================================================================
//============================================================================
//    INLINE CLASS METHODS
//============================================================================
//============================================================================
//    TRAILING HEADERS
//============================================================================

//****************************************************************************
//**
//**    END HEADER KRNINC.H
//**
//****************************************************************************
#endif // __KRNINC_H__
