cmake_minimum_required(VERSION 3.16.0 FATAL_ERROR)

project(Duke4 C CXX)

################################################################################
# Set target arch type if empty. Visual studio solution generator provides it.
################################################################################
if(NOT CMAKE_VS_PLATFORM_NAME)
    set(CMAKE_VS_PLATFORM_NAME "x64")
endif()
message("${CMAKE_VS_PLATFORM_NAME} architecture in use")

if(NOT ("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32"))
    message(FATAL_ERROR "${CMAKE_VS_PLATFORM_NAME} arch is not supported!")
endif()

################################################################################
# Global configuration types
################################################################################
set(CMAKE_CONFIGURATION_TYPES
    "Debug"
    "Release"
    CACHE STRING "" FORCE
)

################################################################################
# Global compiler options
################################################################################
if(MSVC)
    # remove default flags provided with CMake for MSVC
    set(CMAKE_C_FLAGS "")
    set(CMAKE_C_FLAGS_DEBUG "")
    set(CMAKE_C_FLAGS_RELEASE "")
    set(CMAKE_CXX_FLAGS "")
    set(CMAKE_CXX_FLAGS_DEBUG "")
    set(CMAKE_CXX_FLAGS_RELEASE "")
endif()

################################################################################
# Global linker options
################################################################################
if(MSVC)
    # remove default flags provided with CMake for MSVC
    set(CMAKE_EXE_LINKER_FLAGS "")
    set(CMAKE_MODULE_LINKER_FLAGS "")
    set(CMAKE_SHARED_LINKER_FLAGS "")
    set(CMAKE_STATIC_LINKER_FLAGS "")
    set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_DEBUG "${CMAKE_STATIC_LINKER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "${CMAKE_STATIC_LINKER_FLAGS}")
	
	# Make easy the code to compile for now
    add_link_options("/SAFESEH:NO" "/LARGEADDRESSAWARE")
    add_compile_definitions(_CRT_NO_VA_START_VALIDATION)
    add_compile_definitions(_CRT_SECURE_NO_WARNINGS)
    add_compile_options("/permissive" "/Zc:forScope-" "/Zc:strictStrings-" "/Zc:wchar_t-")
endif()

################################################################################
# Nuget packages function stub.
################################################################################
function(use_package TARGET PACKAGE VERSION)
    message(WARNING "No implementation of use_package. Create yours. "
                    "Package \"${PACKAGE}\" with version \"${VERSION}\" "
                    "for target \"${TARGET}\" is ignored!")
endfunction()

################################################################################
# Common utils
################################################################################
include(CMake/Utils.cmake)

################################################################################
# Additional Global Settings(add specific info there)
################################################################################
include(CMake/GlobalSettingsInclude.cmake OPTIONAL)

################################################################################
# Use solution folders feature
################################################################################
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

################################################################################
# Compiler-specific includes/libraries
################################################################################
if(MSVC)
include_directories(BEFORE 
    "DirectX8/Inc"
)
link_directories(BEFORE 
    "DirectX8/Lib;"
    "VC6Libs"
)
endif()

################################################################################
# Sub-projects
################################################################################
add_subdirectory(BuildRelease)
add_subdirectory(Cannibal)
add_subdirectory(CannibalEditor)
add_subdirectory(CannibalEditor/vidglide)
add_subdirectory(CblMacEd)
add_subdirectory(D3DDrv/Src)
add_subdirectory(dnAI)
add_subdirectory(dnGame)
add_subdirectory(dnWindow)
add_subdirectory(DukeEd)
add_subdirectory(Editor/Src)
add_subdirectory(Engine/Src)
add_subdirectory(Fire/Src)
add_subdirectory(Galaxy/Src)
add_subdirectory(GalaxyLib)
add_subdirectory(GlideDrv/Src)
add_subdirectory(Imp3DS)
add_subdirectory(ImpBP2)
add_subdirectory(ImpGMA)
add_subdirectory(ImpLWO)
add_subdirectory(ImpMDX)
add_subdirectory(IpServer)
add_subdirectory(Launch/Src)
add_subdirectory(SoftDrv/Src)
add_subdirectory(UBrowser/Src)
add_subdirectory(UCC/Src)
add_subdirectory(UWeb/Src)
add_subdirectory(UWindow/Src)
add_subdirectory(xcore)
add_subdirectory(ximage)

