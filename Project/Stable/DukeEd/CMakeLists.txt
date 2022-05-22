set(PROJECT_NAME DukeEd)

################################################################################
# Source groups
################################################################################
set(Bugslayer
    "Inc/Bugslayer/BugslayerUtil.h"
    "Inc/Bugslayer/CrashHandler.h"
    "Inc/Bugslayer/CriticalSection.h"
    "Inc/Bugslayer/DiagAssert.h"
    "Inc/Bugslayer/MemDumperValidator.h"
    "Inc/Bugslayer/MemStress.h"
    "Inc/Bugslayer/MSJDBG.h"
    "Inc/Bugslayer/PSAPI.H"
    "Inc/Bugslayer/SymbolEngine.h"
    "Inc/Bugslayer/WarningsOff.h"
    "Inc/Bugslayer/WarningsOn.h"
)
source_group("Bugslayer" FILES ${Bugslayer})

set(Inc
    "Inc/BottomBar.h"
    "Inc/Browser.h"
    "Inc/BrowserActor.h"
    "Inc/BrowserGroup.h"
    "Inc/BrowserMaster.h"
    "Inc/BrowserMesh.h"
    "Inc/BrowserMusic.h"
    "Inc/BrowserSound.h"
    "Inc/BrowserTexture.h"
    "Inc/BuildPropSheet.h"
    "Inc/ButtonBar.h"
    "Inc/CodeFrame.h"
    "Inc/DlgAddSpecial.h"
    "Inc/DlgBevel.h"
    "Inc/DlgBrushBuilder.h"
    "Inc/DlgBrushImport.h"
    "Inc/DlgBuildOptions.h"
    "Inc/DlgDepth.h"
    "Inc/DlgGeneric.h"
    "Inc/DlgMapError.h"
    "Inc/DlgMapImport.h"
    "Inc/DlgProgress.h"
    "Inc/DlgRename.h"
    "Inc/DlgScaleLights.h"
    "Inc/DlgSearchActors.h"
    "Inc/DlgTexProp.h"
    "Inc/DlgTexReplace.h"
    "Inc/DlgTexUsage.h"
    "Inc/DlgViewportConfig.h"
    "Inc/Extern.h"
    "Inc/MRUList.h"
    "Inc/SurfacePropSheet.h"
    "Inc/TerrainEditSheet.h"
    "Inc/TopBar.h"
    "Inc/TwoDeeShapeEditor.h"
    "Inc/ViewportFrame.h"
    "Src/Res/resource.h"
)
source_group("Inc" FILES ${Inc})

set(Res
    "Src/Res/bb_grid1.bmp"
    "Src/Res/bb_lock1.bmp"
    "Src/Res/bb_log_w.bmp"
    "Src/Res/bb_rotat.bmp"
    "Src/Res/bb_vtx_s.bmp"
    "Src/Res/bb_zoomc.bmp"
    "Src/Res/bmp00001.bmp"
    "Src/Res/bmp00002.bmp"
    "Src/Res/bmp00003.bmp"
    "Src/Res/bmp00004.bmp"
    "Src/Res/bmp00005.bmp"
    "Src/Res/bmp00006.bmp"
    "Src/Res/bmp00007.bmp"
    "Src/Res/bmp00008.bmp"
    "Src/Res/bmp00009.bmp"
    "Src/Res/bmp00010.bmp"
    "Src/Res/bmp00011.bmp"
    "Src/Res/bmp00012.bmp"
    "Src/Res/bmp00013.bmp"
    "Src/Res/bmp00014.bmp"
    "Src/Res/bmp00015.bmp"
    "Src/Res/bmp00016.bmp"
    "Src/Res/bmp00017.bmp"
    "Src/Res/bmp00018.bmp"
    "Src/Res/bmp00019.bmp"
    "Src/Res/bmp00020.bmp"
    "Src/Res/bmp00021.bmp"
    "Src/Res/bmp00025.bmp"
    "Src/Res/bmp00026.bmp"
    "Src/Res/bmp00027.bmp"
    "Src/Res/bmp00028.bmp"
    "Src/Res/browsers.bmp"
    "Src/Res/browsert.bmp"
    "Src/Res/cf_toolb.bmp"
    "Src/Res/Duke.ico"
    "Src/Res/idbm_2ds.bmp"
    "Src/Res/idbm_bui.bmp"
    "Src/Res/idbm_buildall.bmp"
    "Src/Res/idbm_cam.bmp"
    "Src/Res/idbm_dow.bmp"
    "Src/Res/idbm_edi.bmp"
    "Src/Res/idbm_fil.bmp"
    "Src/Res/idbm_mes.bmp"
    "Src/Res/IDBM_MUS.BMP"
    "Src/Res/idbm_pla.bmp"
    "Src/Res/idbm_sur.bmp"
    "Src/Res/idbm_tex.bmp"
    "Src/Res/idbm_unr.bmp"
    "Src/Res/idbm_vie.bmp"
    "Src/Res/toolbar1.bmp"
)
source_group("Res" FILES ${Res})

set(Src
    "Src/Main.cpp"
)
source_group("Src" FILES ${Src})

set(ALL_FILES
    ${Bugslayer}
    ${Inc}
    ${Res}
    ${Src}
)

################################################################################
# Target
################################################################################
add_executable(${PROJECT_NAME} ${ALL_FILES})

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "DukeEd"
    TARGET_NAME_RELEASE "DukeEd"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../System"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../System"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    PDB_OUTPUT_DIRECTORY         "${CMAKE_CURRENT_SOURCE_DIR}/../system"
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
    "${CMAKE_CURRENT_SOURCE_DIR}/../DirectX8/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../xcore;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../Core/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../Engine/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../Window/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../Editor/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/Inc/Bugslayer;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../Engine/Src"
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
    "_WINDOWS;"
    "UNICODE;"
    "WIN32;"
    "_WIN32_IE=0x0200;"
    "_UNICODE"
)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /Od;
            /RTC1;
            /W3
        >
        $<$<CONFIG:Release>:
            /O2;
            /Ob2;
            /GF;
            /Gy;
            /W4
        >
        /WX;
        /Zi;
        /Zp4;
        ${DEFAULT_CXX_EXCEPTION_HANDLING}
    )
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
        /SUBSYSTEM:WINDOWS;
        /DYNAMICBASE:NO
    )
endif()

################################################################################
# Dependencies
################################################################################
# Link with other targets.
target_link_libraries(${PROJECT_NAME} PRIVATE
    Editor
    Engine
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "comctl32;"
    "../Engine/Lib/Engine;"
    "../Editor/Lib/Editor;"
    "BugslayerUtil;"
    "winmm;"
    "../Cannibal/Release/Cannibal"
)
target_link_libraries(${PROJECT_NAME} PRIVATE "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/../DirectX8/Lib"
)

