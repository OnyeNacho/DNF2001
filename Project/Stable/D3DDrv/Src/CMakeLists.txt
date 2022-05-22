set(PROJECT_NAME D3DDrv)

################################################################################
# Source groups
################################################################################
set(Sources
    "Direct3D8.cpp"
)
source_group("Sources" FILES ${Sources})

set(ALL_FILES
    ${Sources}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} SHARED ${ALL_FILES})

target_precompile_headers(${PROJECT_NAME} PRIVATE
    "$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_CURRENT_SOURCE_DIR}/EnginePrivate.h>"
)

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "D3DDrv"
    TARGET_NAME_RELEASE "D3DDrv"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../../System"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../../System"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./Debug"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./../Lib"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_NAME_DEBUG   "D3DDrv"
    ARCHIVE_OUTPUT_NAME_RELEASE "D3DDrv"
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
        MultiThreadedDebug
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
    "$<$<CONFIG:Release>:"
        "${CMAKE_CURRENT_SOURCE_DIR}/../../Engine/Src"
    ">"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Core/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Engine/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../DirectX7/Inc"
)

################################################################################
# Compile definitions
################################################################################
target_compile_definitions(${PROJECT_NAME} PRIVATE
    "_MBCS;"
    "_USRDLL;"
    "D3DDRV_EXPORTS;"
    "_WINDOWS;"
    "NDEBUG;"
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
            /Od;
            /RTC1
        >
        $<$<CONFIG:Release>:
            /O2;
            /Ob1;
            /GF;
            /Gy;
            /FAs
        >
        /W4;
        /Zi;
        /Zp4;
        ${DEFAULT_CXX_EXCEPTION_HANDLING}
    )
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Release>:"
            "/Y-"
        ">"
    )
    source_file_compile_options(Direct3D8.cpp ${FILE_CL_OPTIONS})
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
target_link_libraries(${PROJECT_NAME} PUBLIC
    Engine
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "../../DirectX7/Lib/DxGuid;"
    "../../DirectX7/Lib/d3dim;"
    "../../Engine/Lib/Engine"
)
target_link_libraries(${PROJECT_NAME} PUBLIC "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PUBLIC
    "$<$<CONFIG:Debug>:"
        "${CMAKE_CURRENT_SOURCE_DIR}/../core/lib;"
        "${CMAKE_CURRENT_SOURCE_DIR}/../engine/lib"
    ">"
)

