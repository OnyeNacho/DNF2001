set(PROJECT_NAME xcore)

################################################################################
# Source groups
################################################################################
set(no_group_source_files
    "makefile"
    "xcore.bsc"
)
source_group("" FILES ${no_group_source_files})

set(Header_Files
    "filex.h"
    "winalloc.h"
    "xclass.h"
    "xcore.h"
    "xipc.h"
    "xstream.h"
    "xstring.h"
)
source_group("Header Files" FILES ${Header_Files})

set(Source_Files
    "dll.cpp"
    "error.cpp"
    "file.cpp"
    "find.cpp"
#    "gendata.cpp"
#    "genmem.cpp"
    "global.cpp"
#    "ipc.cpp"
    "list.cpp"
#    "malloc.asm"
    "printf.cpp"
#    "stat.cpp"
    "stdcore.cpp"
    "stream.cpp"
    "string.cpp"
    "stuff.cpp"
    "win.cpp"
    "winalloc.cpp"
    "winfile.cpp"
    "winmem.cpp"
    "xcore.def"
    "xmisc.cpp"
)
source_group("Source Files" FILES ${Source_Files})

set(ALL_FILES
    ${no_group_source_files}
    ${Header_Files}
    ${Source_Files}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} ${ALL_FILES})

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
set_target_properties(${PROJECT_NAME} PROPERTIES
    VS_GLOBAL_KEYWORD "MakeFileProj"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./obj/"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./obj/"
)

################################################################################
# Include directories
################################################################################
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ../Core/Inc)

################################################################################
# Compile definitions
################################################################################
target_compile_definitions(${PROJECT_NAME} PRIVATE XCORE_LIBRARY)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        ${DEFAULT_CXX_DEBUG_INFORMATION_FORMAT};
        ${DEFAULT_CXX_EXCEPTION_HANDLING}
    )
    target_link_options(${PROJECT_NAME} PRIVATE
        /DEBUG:FULL
    )
endif()

