set(PROJECT_NAME GalaxyLib)

################################################################################
# Source groups
################################################################################
set(no_group_source_files
    "Hdr/Galaxy.ah"
    "K3d.asm"
    "Kni.asm"
    "Mmx.asm"
    "Sbs.asm"
    "X86.asm"
)
source_group("" FILES ${no_group_source_files})

set(Headers
    "Hdr/EAX.H"
    "Hdr/Eax2.h"
    "Hdr/EaxMan.h"
    "Hdr/Galaxy.h"
    "Hdr/Glx-669.h"
    "Hdr/glx-ae.h"
    "Hdr/Glx-ai.h"
    "Hdr/Glx-am.h"
    "Hdr/Glx-as.h"
    "Hdr/Glx-au.h"
    "Hdr/Glx-dls.h"
    "Hdr/Glx-dmus.h"
    "Hdr/Glx-far.h"
    "Hdr/Glx-ima.h"
    "Hdr/Glx-it.h"
    "Hdr/Glx-mid.h"
    "Hdr/Glx-mod.h"
    "Hdr/Glx-mpa.h"
    "Hdr/Glx-mtm.h"
    "Hdr/Glx-ptm.h"
    "Hdr/Glx-s3m.h"
    "Hdr/Glx-sf2.h"
    "Hdr/Glx-smp.h"
    "Hdr/Glx-st3.h"
    "Hdr/Glx-stm.h"
    "Hdr/Glx-ult.h"
    "Hdr/Glx-voc.h"
    "Hdr/Glx-wav.h"
    "Hdr/Glx-xm.h"
    "Hdr/IA3D.H"
    "Hdr/ia3dapi.h"
    "Hdr/Loaders.h"
    "hufftab.h"
    "hufftab2.h"
)
source_group("Headers" FILES ${Headers})

set(Sources
    "Galaxy.c"
    "Glx-669.c"
    "glx-ae.c"
    "Glx-ai.c"
    "Glx-am.c"
    "Glx-as.c"
    "Glx-au.c"
    "Glx-dls.c"
    "Glx-dmus.c"
    "Glx-far.c"
    "Glx-ima.c"
    "Glx-mid.c"
    "Glx-mod.c"
    "Glx-mpa.c"
    "Glx-mtm.c"
    "Glx-ptm.c"
    "Glx-s3m.c"
    "Glx-sf2.c"
    "Glx-smp.c"
    "Glx-st3.c"
    "Glx-stm.c"
    "Glx-ult.c"
    "Glx-voc.c"
    "Glx-wav.c"
    "Glx-xm.c"
    "HUFFDEC.C"
    "Loaders.c"
)
source_group("Sources" FILES ${Sources})

set(ALL_FILES
    ${no_group_source_files}
    ${Headers}
    ${Sources}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} STATIC ${ALL_FILES})

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "GalaxyLib"
    TARGET_NAME_RELEASE "GalaxyLib"
)
################################################################################
# Output directory
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/./Debug"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/./GalaxyLib___Win32_Release"
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
        MultiThreaded
    >
    $<$<NOT:$<OR:$<CONFIG:Debug>,$<CONFIG:Release>>>:${MSVC_RUNTIME_LIBRARY_DEFAULT}>
)
set_target_properties(${PROJECT_NAME} PROPERTIES MSVC_RUNTIME_LIBRARY ${MSVC_RUNTIME_LIBRARY_STR})

################################################################################
# Include directories
################################################################################
target_include_directories(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/../../DirectX8/Inc"
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
    "_WINDOWS"
)

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /Gm;
            /Od;
            /RTC1;
            /ZI
        >
        $<$<CONFIG:Release>:
            /O2;
            /Ob1;
            /GF;
            /Gy;
            ${DEFAULT_CXX_DEBUG_INFORMATION_FORMAT}
        >
        ${DEFAULT_CXX_EXCEPTION_HANDLING}
    )
    target_link_options(${PROJECT_NAME} PRIVATE
        /NOLOGO
    )
endif()

