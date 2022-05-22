set(PROJECT_NAME vidglide)

################################################################################
# Source groups
################################################################################
set(no_group_source_files
    "vidglide.def"
)
source_group("" FILES ${no_group_source_files})

set(inc
    "vidglide.h"
)
source_group("inc" FILES ${inc})

set(src
    "font.cpp"
    "main.cpp"
    "vid_main.cpp"
    "vidtex.cpp"
)
source_group("src" FILES ${src})

set(ALL_FILES
    ${no_group_source_files}
    ${inc}
    ${src}
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
    TARGET_NAME_DEBUG   "vidglide"
    TARGET_NAME_RELEASE "vidglide"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../drivers"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./../drivers"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./Debug"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./../drivers"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_NAME_DEBUG   "vidglide"
    ARCHIVE_OUTPUT_NAME_RELEASE "vidglide"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    PDB_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./Debug"
    PDB_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./../drivers"
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
    "${CMAKE_CURRENT_SOURCE_DIR}/..;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../ximage;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../xcore;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Core/Inc"
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
    "__MSC__;"
    "XCORE_PURE"
)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /Gm;
            /Od;
            /Zi
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
# Dependencies
################################################################################
# Link with other targets.
target_link_libraries(${PROJECT_NAME} PUBLIC
    xcore
    ximage
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "msvcrt;"
    "../../xcore/xcore;"
    "../../ximage/ximage;"
    "odbc32;"
    "odbccp32;"
    "fxmisc;"
    "fxpci;"
    "glide2x;"
    "texus"
)
target_link_libraries(${PROJECT_NAME} PUBLIC "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

