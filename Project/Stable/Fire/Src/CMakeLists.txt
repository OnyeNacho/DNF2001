set(PROJECT_NAME Fire)

################################################################################
# Source groups
################################################################################
set(Classes
    "../Classes/Fire.upkg"
    "../Classes/FireTexture.uc"
    "../Classes/FractalTexture.uc"
    "../Classes/IceTexture.uc"
    "../Classes/WaterTexture.uc"
    "../Classes/WaveTexture.uc"
    "../Classes/WetTexture.uc"
)
source_group("Classes" FILES ${Classes})

set(Src
    "FractalPrivate.h"
    "UnFire.asm"
    "UnFireP2.asm"
    "UnFractal.cpp"
    "UnWater.asm"
)
source_group("Src" FILES ${Src})

set(ALL_FILES
    ${Classes}
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
    TARGET_NAME_DEBUG   "Fire"
    TARGET_NAME_RELEASE "Fire"
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
    ARCHIVE_OUTPUT_NAME_DEBUG   "Fire"
    ARCHIVE_OUTPUT_NAME_RELEASE "Fire"
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
    "${CMAKE_CURRENT_SOURCE_DIR}/../Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Engine/Src"
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
    "_UNICODE"
)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /Od;
            /D
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
        "$<$<CONFIG:Release>:"
            "/FAcs"
        ">"
    )
    source_file_compile_options(UnFractal.cpp ${FILE_CL_OPTIONS})
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
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "../../Engine/Lib/Engine"
)
target_link_libraries(${PROJECT_NAME} PUBLIC "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/../../DirectX8/Lib"
)

