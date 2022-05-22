set(PROJECT_NAME SoftDrv)

################################################################################
# Source groups
################################################################################
set(Headers
    "Line.h"
    "Line1.h"
    "SoftDrvPrivate.h"
)
source_group("Headers" FILES ${Headers})

set(Sources
    "DrawPoly.cpp"
    "DrawSurf.cpp"
    "DrawTile.cpp"
    "Hit.cpp"
    "Line2D.cpp"
    "SoftDrv.cpp"
)
source_group("Sources" FILES ${Sources})

set(ALL_FILES
    ${Headers}
    ${Sources}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} SHARED ${ALL_FILES})

target_precompile_headers(${PROJECT_NAME} PRIVATE
    "$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_CURRENT_SOURCE_DIR}/SoftDrvPrivate.h>"
)

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "SoftDrv"
    TARGET_NAME_RELEASE "SoftDrv"
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
    ARCHIVE_OUTPUT_NAME_DEBUG   "SoftDrv"
    ARCHIVE_OUTPUT_NAME_RELEASE "SoftDrv"
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
            /Od
        >
        $<$<CONFIG:Release>:
            /O2;
            /Ob2;
            /Oi;
            /Ot;
            /O2x
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
            "/O2"
        ">"
    )
    source_file_compile_options(DrawPoly.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Release>:"
            "/O2"
        ">"
    )
    source_file_compile_options(DrawSurf.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Release>:"
            "/O2"
        ">"
    )
    source_file_compile_options(DrawTile.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Release>:"
            "/O2"
        ">"
    )
    source_file_compile_options(Hit.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Release>:"
            "/O2"
        ">"
    )
    source_file_compile_options(Line2D.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Release>:"
            "/O2"
        ">"
    )
    source_file_compile_options(SoftDrv.cpp ${FILE_CL_OPTIONS})
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
set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "../../Engine/Lib/Engine"
)
target_link_libraries(${PROJECT_NAME} PUBLIC "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/../../DirectX8/Lib"
)

