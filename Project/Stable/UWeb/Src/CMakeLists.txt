set(PROJECT_NAME UWeb)

################################################################################
# Source groups
################################################################################
set(Classes
    "../Classes/HelloWeb.uc"
    "../Classes/ImageServer.uc"
    "../Classes/UWeb.upkg"
    "../Classes/WebApplication.uc"
    "../Classes/WebConnection.uc"
    "../Classes/WebRequest.uc"
    "../Classes/WebResponse.uc"
    "../Classes/WebServer.uc"
)
source_group("Classes" FILES ${Classes})

set(Inc
    "UWebPrivate.h"
)
source_group("Inc" FILES ${Inc})

set(Src
    "UWeb.cpp"
    "WebServer.cpp"
)
source_group("Src" FILES ${Src})

set(ALL_FILES
    ${Classes}
    ${Inc}
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
    TARGET_NAME_DEBUG   "UWeb"
    TARGET_NAME_RELEASE "UWeb"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/../../System"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/../System"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./../Lib"
    ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./../Lib"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    ARCHIVE_OUTPUT_NAME_DEBUG   "UWeb"
    ARCHIVE_OUTPUT_NAME_RELEASE "UWeb"
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    PDB_OUTPUT_DIRECTORY         "${CMAKE_CURRENT_SOURCE_DIR}/./../Lib"
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
    "$<$<CONFIG:Debug>:"
        "${CMAKE_CURRENT_SOURCE_DIR}/../Inc"
    ">"
    "$<$<CONFIG:Release>:"
        "${CMAKE_CURRENT_SOURCE_DIR}/../../Inc"
    ">"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../DirectX8/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/.;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Core/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Engine/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Engine/Src"
)

################################################################################
# Compile definitions
################################################################################
target_compile_definitions(${PROJECT_NAME} PRIVATE
    "UWEB_API=__declspec(dllexport);"
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
        /O2;
        /Ob2;
        /GF;
        /Gy;
        /W4;
        /WX;
        /Zi;
        /Zp4;
        /Zm256;
        ${DEFAULT_CXX_EXCEPTION_HANDLING}
    )
    target_link_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /DEBUG:FULL
        >
        $<$<CONFIG:Release>:
            /DEBUG
        >
        /NOLOGO;
        /MACHINE:X86;
        /SUBSYSTEM:WINDOWS;
        /DYNAMICBASE:NO;
        /INCREMENTAL
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

