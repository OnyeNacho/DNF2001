set(PROJECT_NAME Launch)

################################################################################
# Source groups
################################################################################
set(no_group_source_files
    "Res/Logo.bmp"
)
source_group("" FILES ${no_group_source_files})

set(Bugslayer
    "BugslayerUtil.h"
    "CrashHandler.h"
    "CriticalSection.h"
    "DiagAssert.h"
    "MemDumperValidator.h"
    "MemStress.h"
    "MSJDBG.h"
    "PSAPI.H"
    "SymbolEngine.h"
    "WarningsOff.h"
    "WarningsOn.h"
)
source_group("Bugslayer" FILES ${Bugslayer})

set(Fortify
    "Fortify.c"
    "Fortify.doc"
    "Fortify.h"
    "Ufortify.h"
    "Ufortify.hpp"
    "Zfortify.cpp"
    "Zfortify.hpp"
)
source_group("Fortify" FILES ${Fortify})

set(Res
    "Res/Unreal.ico"
)
source_group("Res" FILES ${Res})

set(Src
    "Launch.cpp"
    "LaunchPrivate.h"
    "Res/LaunchRes.h"
)
source_group("Src" FILES ${Src})

set(ALL_FILES
    ${no_group_source_files}
    ${Bugslayer}
    ${Fortify}
    ${Res}
    ${Src}
)

################################################################################
# Target
################################################################################
add_executable(${PROJECT_NAME} ${ALL_FILES})

target_precompile_headers(${PROJECT_NAME} PRIVATE
    "$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_CURRENT_SOURCE_DIR}/LaunchPrivate.h>"
)

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "DukeForever"
    TARGET_NAME_RELEASE "DukeForever"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../../System"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../../System"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    PDB_OUTPUT_DIRECTORY         "${CMAKE_CURRENT_SOURCE_DIR}/../../system"
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
    "${CMAKE_CURRENT_SOURCE_DIR}/../../DirectX8/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Core/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Engine/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Window/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/.;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Engine/Src"
)

################################################################################
# Compile definitions
################################################################################
target_compile_definitions(${PROJECT_NAME} PRIVATE
    "_WINDOWS;"
    "NDEBUG;"
    "UNICODE;"
    "WIN32;"
    "_UNICODE"
)
set_source_files_properties(Fortify.c PROPERTIES
    COMPILE_DEFINITIONS_DEBUG "FORTIFY"
)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /Gm;
            /Od
        >
        $<$<CONFIG:Release>:
            /O2;
            /Ob2;
            /GF;
            /Gy
        >
        /W4;
        /WX;
        /Zi;
        /Zp4;
        /Zm256;
        ${DEFAULT_CXX_EXCEPTION_HANDLING}
    )
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Debug>:"
            "/W1"
        ">"
        "$<$<CONFIG:Release>:"
            "/W3"
        ">"
        "/Y-"
    )
    source_file_compile_options(Fortify.c ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "/Y-"
    )
    source_file_compile_options(Zfortify.cpp ${FILE_CL_OPTIONS})
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
    Engine
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "../../Engine/Lib/Engine"
)
target_link_libraries(${PROJECT_NAME} PRIVATE "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/../../DirectX8/Lib"
)

