set(PROJECT_NAME Galaxy)

################################################################################
# Source groups
################################################################################
set(Miles6
    "Mss.h"
)
source_group("Miles6" FILES ${Miles6})

set(Src
    "../../GalaxyLib/Hdr/Galaxy.h"
    "A3D.cpp"
    "A3D.h"
    "ia3dapi.h"
    "UnGalaxy.cpp"
)
source_group("Src" FILES ${Src})

set(ALL_FILES
    ${Miles6}
    ${Src}
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
    TARGET_NAME_DEBUG   "Galaxy"
    TARGET_NAME_RELEASE "Galaxy"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../../System"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../../System"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./../Lib"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./../Lib"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_NAME_DEBUG   "Galaxy"
    ARCHIVE_OUTPUT_NAME_RELEASE "Galaxy"
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
    "${CMAKE_CURRENT_SOURCE_DIR}/../../GalaxyLib/Hdr;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Render/Src;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Engine/Src"
)

################################################################################
# Compile definitions
################################################################################
target_compile_definitions(${PROJECT_NAME} PRIVATE
    "$<$<CONFIG:Debug>:"
        "_DEBUG;"
        "_REALLY_WANT_DEBUG"
    ">"
    "$<$<CONFIG:Release>:"
        "NDEBUG"
    ">"
    "_WINDOWS;"
    "UNICODE;"
    "WIN32;"
    "_UNICODE"
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
target_link_libraries(${PROJECT_NAME} PUBLIC
    Engine
    GalaxyLib
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "$<$<CONFIG:Debug>:"
        "../../GalaxyLib/Debug/GalaxyLib"
    ">"
    "$<$<CONFIG:Release>:"
        "../../GalaxyLib/GalaxyLib___Win32_Release/GalaxyLib"
    ">"
    "../../Engine/Lib/Engine;"
    "../Lib/DxGuid;"
    "winmm;"
    "dsound"
)
target_link_libraries(${PROJECT_NAME} PUBLIC "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/../../DirectX8/Lib"
)

