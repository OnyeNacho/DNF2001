set(PROJECT_NAME CannibalEditor)

################################################################################
# Source groups
################################################################################
set(Header_Files__Overlay_Headers
    "ovl_cc.h"
    "ovl_defs.h"
    "ovl_frm.h"
    "ovl_mdl.h"
    "ovl_seq.h"
    "ovl_skin.h"
    "ovl_work.h"
)
source_group("Header Files\\Overlay Headers" FILES ${Header_Files__Overlay_Headers})

set(Header_Files__System_Headers
    "cam_man.h"
    "cbl_defs.h"
    "con_man.h"
    "file_imp.h"
    "in_main.h"
    "in_win.h"
    "math_vec.h"
    "mdx_man.h"
    "ovl_man.h"
    "resource.h"
    "sys_main.h"
    "sys_win.h"
    "vcr_man.h"
    "vid_main.h"
)
source_group("Header Files\\System Headers" FILES ${Header_Files__System_Headers})

set(Resource_Files
    "cannibal.ico"
)
source_group("Resource Files" FILES ${Resource_Files})

set(Source_Files__Overlays
    "ovl_cc.cpp"
    "ovl_defs.cpp"
    "ovl_frm.cpp"
    "ovl_mdl.cpp"
    "ovl_seq.cpp"
    "ovl_skin.cpp"
    "ovl_work.cpp"
)
source_group("Source Files\\Overlays" FILES ${Source_Files__Overlays})

set(Source_Files__System
    "cam_man.cpp"
    "con_man.cpp"
    "file_imp.cpp"
    "in_main.cpp"
    "in_win.cpp"
    "math_vec.cpp"
    "mdx_man.cpp"
    "ovl_man.cpp"
    "sys_main.cpp"
    "sys_win.cpp"
    "vcr_man.cpp"
    "vid_main.cpp"
)
source_group("Source Files\\System" FILES ${Source_Files__System})

set(ALL_FILES
    ${Header_Files__Overlay_Headers}
    ${Header_Files__System_Headers}
    ${Resource_Files}
    ${Source_Files__Overlays}
    ${Source_Files__System}
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
    TARGET_NAME_DEBUG   "CannibalEd"
    TARGET_NAME_RELEASE "CannibalEd"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../System"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../System"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    PDB_OUTPUT_DIRECTORY         "${CMAKE_CURRENT_SOURCE_DIR}/../System"
)
################################################################################
# MSVC runtime library
################################################################################
get_property(MSVC_RUNTIME_LIBRARY_DEFAULT TARGET ${PROJECT_NAME} PROPERTY MSVC_RUNTIME_LIBRARY)
string(CONCAT "MSVC_RUNTIME_LIBRARY_STR"
    MultiThreadedDLL
)
set_target_properties(${PROJECT_NAME} PROPERTIES MSVC_RUNTIME_LIBRARY ${MSVC_RUNTIME_LIBRARY_STR})

################################################################################
# Include directories
################################################################################
target_include_directories(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/../DirectX8/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../Core/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../xcore"
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
    "CANNIBAL_TOOL;"
    "XCORE_PURE"
)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /Od;
            /ZI
        >
        $<$<CONFIG:Release>:
            /O2;
            /Ob1;
            /GF;
            /Gy;
            ${DEFAULT_CXX_DEBUG_INFORMATION_FORMAT}
        >
        /W3;
        ${DEFAULT_CXX_EXCEPTION_HANDLING}
    )
    target_link_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /DEBUG;
            /INCREMENTAL
        >
        $<$<CONFIG:Release>:
            /DEBUG:FULL;
            /INCREMENTAL:NO
        >
        /NOLOGO;
        /MACHINE:X86;
        /SUBSYSTEM:WINDOWS;
        /DYNAMICBASE:NO
    )
endif()

################################################################################
# Post build events
################################################################################
add_custom_command_if(
    TARGET ${PROJECT_NAME}
    POST_BUILD
    COMMANDS
    COMMAND   $<CONFIG:Debug> copy ..\\system\\xcore.dll .
    COMMAND $<CONFIG:Release> copy ..\\system\\xcore.dll .
    COMMAND $<CONFIG:Release> copy ..\\system\\cannibaled.exe .
)

################################################################################
# Dependencies
################################################################################
# Link with other targets.
target_link_libraries(${PROJECT_NAME} PRIVATE
    xcore
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "msvcrt;"
    "../xcore/xcore;"
    "dinput8;"
    "odbc32;"
    "odbccp32;"
    "dxguid;"
    "comctl32;"
    "winmm"
)
target_link_libraries(${PROJECT_NAME} PRIVATE "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/../DirectX8/Lib"
)

