set(PROJECT_NAME Editor)

################################################################################
# Source groups
################################################################################
set(Classes
    "../Classes/BrushBuilder.uc"
    "../Classes/ConeBuilder.uc"
    "../Classes/CubeBuilder.uc"
    "../Classes/CurvedStairBuilder.uc"
    "../Classes/CylinderBuilder.uc"
    "../Classes/Editor.upkg"
    "../Classes/EditorEngine.uc"
    "../Classes/LinearStairBuilder.uc"
    "../Classes/Options2DShaper.uc"
    "../Classes/Options2DShaperBezierDetail.uc"
    "../Classes/Options2DShaperExtrude.uc"
    "../Classes/Options2DShaperExtrudeToBevel.uc"
    "../Classes/Options2DShaperExtrudeToPoint.uc"
    "../Classes/Options2DShaperRevolve.uc"
    "../Classes/Options2DShaperSheet.uc"
    "../Classes/OptionsBrushScale.uc"
    "../Classes/OptionsProxy.uc"
    "../Classes/OptionsSurfBevel.uc"
    "../Classes/OptionsTexAlign.uc"
    "../Classes/OptionsTexAlignFace.uc"
    "../Classes/OptionsTexAlignPlanar.uc"
    "../Classes/SheetBuilder.uc"
    "../Classes/SpiralStairBuilder.uc"
    "../Classes/TerrainBuilder.uc"
    "../Classes/TetrahedronBuilder.uc"
    "../Classes/VolumetricBuilder.uc"
)
source_group("Classes" FILES ${Classes})

set(Inc
    "../Inc/Editor.h"
    "../Inc/EditorClasses.h"
    "../Inc/UBrushBuilder.h"
)
source_group("Inc" FILES ${Inc})

set(Int
    "../../System/Editor.int"
)
source_group("Int" FILES ${Int})

set(Src
    "CoolBsp.cpp"
    "EdHook.cpp"
    "Editor.cpp"
    "EditorPrivate.h"
    "TTFontImport.cpp"
    "UBatchExportCommandlet.cpp"
    "UBrushBuilder.cpp"
    "UConformCommandlet.cpp"
    "UKillUnrealCommandlet.cpp"
    "UMakeCommandlet.cpp"
    "UMapConvertCommandlet.cpp"
    "UMasterCommandlet.cpp"
    "UMergeDXTCommandlet.cpp"
    "UnBsp.cpp"
    "UnEdAct.cpp"
    "UnEdCam.cpp"
    "UnEdClick.cpp"
    "UnEdCnst.cpp"
    "UnEdCsg.cpp"
    "UnEdExp.cpp"
    "UnEdFact.cpp"
    "UnEditor.cpp"
    "UnEdRend.cpp"
    "UnEdSrv.cpp"
    "UnEdTran.cpp"
    "UnEdTran.h"
    "UnMeshEd.cpp"
    "UnMeshLP.cpp"
    "UnParams.cpp"
    "UnScrCom.cpp"
    "UnScrCom.h"
    "UnShadow.cpp"
    "UnSyntax.cpp"
    "UnTopics.cpp"
    "UnTopics.h"
    "UnVisi.cpp"
    "UTextureCheckCommandlet.cpp"
)
source_group("Src" FILES ${Src})

set(ALL_FILES
    ${Classes}
    ${Inc}
    ${Int}
    ${Src}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} SHARED ${ALL_FILES})

target_precompile_headers(${PROJECT_NAME} PRIVATE
    "$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_CURRENT_SOURCE_DIR}/EditorPrivate.h>"
)

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
################################################################################
# Target name
################################################################################
set_target_properties(${PROJECT_NAME} PROPERTIES
    TARGET_NAME_DEBUG   "Editor"
    TARGET_NAME_RELEASE "Editor"
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
    ARCHIVE_OUTPUT_NAME_DEBUG   "Editor"
    ARCHIVE_OUTPUT_NAME_RELEASE "Editor"
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
    "${CMAKE_CURRENT_SOURCE_DIR}/../../xcore;"
    "${CMAKE_CURRENT_SOURCE_DIR}/.;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Core/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Engine/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Window/Inc;"
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
    "EDITOR_API=__declspec(dllexport);"
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
        "/Y-"
    )
    source_file_compile_options(EdHook.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "/Y-"
    )
    source_file_compile_options(UnEdClick.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "/Y-"
    )
    source_file_compile_options(UnEdCsg.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "/Y-"
    )
    source_file_compile_options(UnEditor.cpp ${FILE_CL_OPTIONS})
    target_link_options(${PROJECT_NAME} PRIVATE
        /NOLOGO;
        /DEBUG;
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

