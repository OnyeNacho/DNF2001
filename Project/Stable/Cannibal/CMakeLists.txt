set(PROJECT_NAME Cannibal)

################################################################################
# Source groups
################################################################################
set(no_group_source_files
    "Cannibal.h"
)
source_group("" FILES ${no_group_source_files})

set(Files
    "FileBox.cpp"
    "FileBox.h"
    "FileMain.cpp"
    "FileMain.h"
)
source_group("Files" FILES ${Files})

set(Input
    "InDefs.h"
    "InMain.cpp"
    "InMain.h"
    "InWin.cpp"
    "InWin.h"
)
source_group("Input" FILES ${Input})

set(Kernel
    "CorMain.cpp"
    "CorMain.h"
    "Kernel.cpp"
    "Kernel.h"
    "KrnBuild.h"
    "KrnDefs.h"
    "KrnInc.h"
    "KrnTypes.h"
    "msg.asm"
    "StrMain.cpp"
    "StrMain.h"
)
source_group("Kernel" FILES ${Kernel})

set(Logging
    "LogMain.cpp"
    "LogMain.h"
)
source_group("Logging" FILES ${Logging})

set(Mathematics
    "MathFlt.h"
    "VecMain.h"
    "VecPrim.h"
)
source_group("Mathematics" FILES ${Mathematics})

set(Memory
    "MemMain.cpp"
    "MemMain.h"
)
source_group("Memory" FILES ${Memory})

set(Models__Model_Actors
    "MacEdit.cpp"
    "MacEdit.h"
    "MacMain.cpp"
    "MacMain.h"
)
source_group("Models\\Model Actors" FILES ${Models__Model_Actors})

set(Models__Model_Actors__Res
    "Res/CpjCpj.bmp"
    "Res/CpjFrm.bmp"
    "Res/CpjGeo.bmp"
    "Res/CpjLod.bmp"
    "Res/CpjMac.bmp"
    "Res/CpjSeq.bmp"
    "Res/CpjSkl.bmp"
    "Res/CpjSrf.bmp"
    "Res/FileClosed.bmp"
    "Res/FileOpen.bmp"
    "Res/resource.h"
)
source_group("Models\\Model Actors\\Res" FILES ${Models__Model_Actors__Res})

set(Models__Project_Files
    "CpjFmt.h"
    "CpjFrm.cpp"
    "CpjFrm.h"
    "CpjGeo.cpp"
    "CpjGeo.h"
    "CpjLod.cpp"
    "CpjLod.h"
    "CpjMac.cpp"
    "CpjMac.h"
    "CpjMain.cpp"
    "CpjMain.h"
    "CpjProj.cpp"
    "CpjProj.h"
    "CpjSeq.cpp"
    "CpjSeq.h"
    "CpjSkl.cpp"
    "CpjSkl.h"
    "CpjSrf.cpp"
    "CpjSrf.h"
)
source_group("Models\\Project Files" FILES ${Models__Project_Files})

set(Objects
    "MsgMain.cpp"
    "MsgMain.h"
    "ObjMain.cpp"
    "ObjMain.h"
)
source_group("Objects" FILES ${Objects})

set(Parsing
    "LexMain.cpp"
    "LexMain.h"
    "PrsMain.cpp"
    "PrsMain.h"
)
source_group("Parsing" FILES ${Parsing})

set(Platform
    "IpcMain.cpp"
    "IpcMain.h"
    "WinCtrl.cpp"
    "WinCtrl.h"
)
source_group("Platform" FILES ${Platform})

set(Plugins
    "PlgMain.cpp"
    "PlgMain.h"
)
source_group("Plugins" FILES ${Plugins})

set(Timing
    "TimeMain.cpp"
    "TimeMain.h"
)
source_group("Timing" FILES ${Timing})

set(ALL_FILES
    ${no_group_source_files}
    ${Files}
    ${Input}
    ${Kernel}
    ${Logging}
    ${Mathematics}
    ${Memory}
    ${Models__Model_Actors}
    ${Models__Model_Actors__Res}
    ${Models__Project_Files}
    ${Objects}
    ${Parsing}
    ${Platform}
    ${Plugins}
    ${Timing}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} SHARED ${ALL_FILES})

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "Cannibal"
    TARGET_NAME_RELEASE "Cannibal"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../System"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../System"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./Debug"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./Release"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_NAME_DEBUG   "Cannibal"
    ARCHIVE_OUTPUT_NAME_RELEASE "Cannibal"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    PDB_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./Debug"
    PDB_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./Release"
)
################################################################################
# MSVC runtime library
################################################################################
get_property(MSVC_RUNTIME_LIBRARY_DEFAULT TARGET ${PROJECT_NAME} PROPERTY MSVC_RUNTIME_LIBRARY)
string(CONCAT "MSVC_RUNTIME_LIBRARY_STR"
    $<$<CONFIG:Debug>:
        MultiThreadedDebugDLL
    >
    $<$<CONFIG:Release>:
        MultiThreadedDLL
    >
    $<$<NOT:$<OR:$<CONFIG:Debug>,$<CONFIG:Release>>>:${MSVC_RUNTIME_LIBRARY_DEFAULT}>
)
set_target_properties(${PROJECT_NAME} PROPERTIES MSVC_RUNTIME_LIBRARY ${MSVC_RUNTIME_LIBRARY_STR})

################################################################################
# Include directories
################################################################################
target_include_directories(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/../xcore;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../Core/Inc"
)

################################################################################
# Compile definitions
################################################################################
target_compile_definitions(${PROJECT_NAME} PRIVATE
    "$<$<CONFIG:Debug>:"
        "_DEBUG"
    ">"
    "$<$<CONFIG:Release>:"
        "NDEBUG"
    ">"
    "WIN32;"
    "_WINDOWS;"
    "_USRDLL;"
    "CANNIBAL_EXPORTS;"
    "KRN_EXPORTS;"
    "KRN_DLL;"
    "XCORE_PURE;"
    "_MBCS"
)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /Gm;
            /Od;
            /RTC1;
            /ZI
        >
        $<$<CONFIG:Release>:
            /O2;
            /Ob2;
            /GF;
            /Gy;
            /Zi
        >
        /W3;
        ${DEFAULT_CXX_EXCEPTION_HANDLING}
    )
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Release>:"
            "/FAs"
        ">"
    )
    source_file_compile_options(MacMain.cpp ${FILE_CL_OPTIONS})
    target_link_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /INCREMENTAL
        >
        $<$<CONFIG:Release>:
            /INCREMENTAL:NO
        >
        /NOLOGO;
        /DEBUG;
        /MACHINE:X86;
        /DYNAMICBASE:NO
    )
endif()

################################################################################
# Dependencies
################################################################################
# Link with other targets.
target_link_directories(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR};"
    "${CMAKE_CURRENT_SOURCE_DIR}/../xcore"
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "xcore;"
#    "odbc32;"
#    "odbccp32;"
    "comctl32"
)
target_link_libraries(${PROJECT_NAME} PUBLIC "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

