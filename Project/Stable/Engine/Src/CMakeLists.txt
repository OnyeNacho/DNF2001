set(PROJECT_NAME Engine)

################################################################################
# Source groups
################################################################################
set(Bink
    "../Inc/BINK.H"
)
source_group("Bink" FILES ${Bink})

set(Core_Inc
    "../../Core/Inc/Core.h"
    "../../Core/Inc/DnExec.h"
    "../../Core/Inc/FCodec.h"
    "../../Core/Inc/FConfigCacheIni.h"
    "../../Core/Inc/FFeedbackContextAnsi.h"
    "../../Core/Inc/FFeedbackContextWindows.h"
    "../../Core/Inc/FFileManagerAnsi.h"
    "../../Core/Inc/FFileManagerGeneric.h"
    "../../Core/Inc/FFileManagerLinux.h"
    "../../Core/Inc/FFileManagerWindows.h"
    "../../Core/Inc/FMallocAnsi.h"
    "../../Core/Inc/FMallocDebug.h"
    "../../Core/Inc/FMallocWindows.h"
    "../../Core/Inc/FOutputDeviceAnsiError.h"
    "../../Core/Inc/FOutputDeviceFile.h"
    "../../Core/Inc/FOutputDeviceNull.h"
    "../../Core/Inc/FOutputDeviceStdout.h"
    "../../Core/Inc/FOutputDeviceWindowsError.h"
    "../../Core/Inc/FRiffChunk.h"
    "../../Core/Inc/mail.h"
    "../../Core/Inc/UExporter.h"
    "../../Core/Inc/UFactory.h"
    "../../Core/Inc/UnArc.h"
    "../../Core/Inc/UnBits.h"
    "../../Core/Inc/UnBuild.h"
    "../../Core/Inc/UnCache.h"
    "../../Core/Inc/UnCId.h"
    "../../Core/Inc/UnClass.h"
    "../../Core/Inc/UnCoreNet.h"
    "../../Core/Inc/UnCorObj.h"
    "../../Core/Inc/UnFile.h"
    "../../Core/Inc/UnGnuG.h"
    "../../Core/Inc/UnLinker.h"
    "../../Core/Inc/UnMath.h"
    "../../Core/Inc/UnMem.h"
    "../../Core/Inc/UnMsg.h"
    "../../Core/Inc/UnName.h"
    "../../Core/Inc/UnNames.h"
    "../../Core/Inc/UnObjBas.h"
    "../../Core/Inc/UnObjVer.h"
    "../../Core/Inc/UnScript.h"
    "../../Core/Inc/UnStack.h"
    "../../Core/Inc/UnTemplate.h"
    "../../Core/Inc/UnType.h"
    "../../Core/Inc/UnUnix.h"
    "../../Core/Inc/UnVcWin32.h"
    "../../Core/Inc/UnVcWn32SSE.h"
    "../../Core/Inc/xtypes.h"
)
source_group("Core Inc" FILES ${Core_Inc})

set(Core_Src
    "../../Core/Src/DnExec.cpp"
    "../../Core/Src/mail.cpp"
    "../../Core/Src/UExporter.cpp"
    "../../Core/Src/UFactory.cpp"
    "../../Core/Src/UnAnsi.cpp"
    "../../Core/Src/UnBits.cpp"
    "../../Core/Src/UnCache.cpp"
    "../../Core/Src/UnClass.cpp"
    "../../Core/Src/UnCoreNet.cpp"
    "../../Core/Src/UnCorSc.cpp"
    "../../Core/Src/UnLinker.cpp"
    "../../Core/Src/UnMath.cpp"
    "../../Core/Src/UnMem.cpp"
    "../../Core/Src/UnMisc.cpp"
    "../../Core/Src/UnName.cpp"
    "../../Core/Src/UnObj.cpp"
    "../../Core/Src/UnProp.cpp"
    "../../Core/Src/UnVcWin32.cpp"
)
source_group("Core Src" FILES ${Core_Src})

set(Engine_Classes
    "../Classes/Actor.uc"
    "../Classes/ActorDamageEffect.uc"
    "../Classes/ActorFreeze.uc"
    "../Classes/ActorImmolation.uc"
    "../Classes/AlternatePath.uc"
    "../Classes/AlwaysTrigger.uc"
    "../Classes/AmbientSound.uc"
    "../Classes/Ambushpoint.uc"
    "../Classes/Ammo.uc"
    "../Classes/AnalogClockDispatcher.uc"
    "../Classes/AnimPlayer.uc"
    "../Classes/AnyDamage.uc"
    "../Classes/BeamAnchor.uc"
    "../Classes/BeamSystem.uc"
    "../Classes/BiochemicalDamage.uc"
    "../Classes/Bitmap.uc"
    "../Classes/BlockAll.uc"
    "../Classes/BlockedPath.uc"
    "../Classes/BlockMonsters.uc"
    "../Classes/BlockPlayer.uc"
    "../Classes/BoneRope.uc"
    "../Classes/BootSmashDamage.uc"
    "../Classes/BotPawn.uc"
    "../Classes/BreakableGlass.uc"
    "../Classes/Brush.uc"
    "../Classes/BulletDamage.uc"
    "../Classes/ButtonMarker.uc"
    "../Classes/Camera.uc"
    "../Classes/Canvas.uc"
    "../Classes/Carcass.uc"
    "../Classes/ClientBeaconReceiver.uc"
    "../Classes/ClipMarker.uc"
    "../Classes/ColdDamage.uc"
    "../Classes/Commandlet.uc"
    "../Classes/Console.uc"
    "../Classes/ConstraintJoint.uc"
    "../Classes/ControlRemapper.uc"
    "../Classes/Coordaxis.uc"
    "../Classes/Counter.uc"
    "../Classes/CriticalEventMessage.uc"
    "../Classes/CriticalString.uc"
    "../Classes/CrushingDamage.uc"
    "../Classes/DamageType.uc"
    "../Classes/DebugAnimView.uc"
    "../Classes/DebugView.uc"
    "../Classes/Decal.uc"
    "../Classes/DecapitationDamage.uc"
    "../Classes/Decoration.uc"
    "../Classes/DefensePoint.uc"
    "../Classes/deleteme.uc"
    "../Classes/DigitalClockDispatcher.uc"
    "../Classes/Dispatcher.uc"
    "../Classes/Dispatchers.uc"
    "../Classes/dnDecal.uc"
    "../Classes/dnDecal_Delayed.uc"
    "../Classes/DoorHandle.uc"
    "../Classes/DoorMover.uc"
    "../Classes/DOTAffector.uc"
    "../Classes/DOTTrigger.uc"
    "../Classes/DrawActorMount.uc"
    "../Classes/DrowningDamage.uc"
    "../Classes/DukeNet.uc"
    "../Classes/DukeVoice.uc"
    "../Classes/Effects.uc"
    "../Classes/ElectricalDamage.uc"
    "../Classes/Engine.uc"
    "../Classes/Engine.upkg"
    "../Classes/ExplosionDamage.uc"
    "../Classes/FallingDamage.uc"
    "../Classes/FireDamage.uc"
    "../Classes/FlareLight.uc"
    "../Classes/FlicTexture.uc"
    "../Classes/FocalPoint.uc"
    "../Classes/FocusPoint.uc"
    "../Classes/FogMorphDispatcher.uc"
    "../Classes/FontBaseBlargo.uc"
    "../Classes/Fragment.uc"
    "../Classes/GameInfo.uc"
    "../Classes/GameReplicationInfo.uc"
    "../Classes/GlassMover.uc"
    "../Classes/GlassShatterEffect.uc"
    "../Classes/HelloWorldCommandlet.uc"
    "../Classes/HitPackage.uc"
    "../Classes/HitPackage_Decoration.uc"
    "../Classes/HitPackage_Glass.uc"
    "../Classes/HitPackage_GlassDir.uc"
    "../Classes/HitPackage_Inventory.uc"
    "../Classes/HitPackage_Level.uc"
    "../Classes/HoldSpot.uc"
    "../Classes/HomeBase.uc"
    "../Classes/HUD.uc"
    "../Classes/Info.uc"
    "../Classes/InfoActor.uc"
    "../Classes/Inpatcher.uc"
    "../Classes/InternalTrigger.uc"
    "../Classes/InternetInfo.uc"
    "../Classes/InternetLink.uc"
    "../Classes/InterpolationPoint.uc"
    "../Classes/InterpolationStation.uc"
    "../Classes/Inventory.uc"
    "../Classes/InventorySpot.uc"
    "../Classes/Item.uc"
    "../Classes/KeyframeDispatch.uc"
    "../Classes/KeyframeDispatchDispatcher.uc"
    "../Classes/Keypoint.uc"
    "../Classes/KillTrigger.uc"
    "../Classes/KungFuDamage.uc"
    "../Classes/LaserBeam.uc"
    "../Classes/LevelInfo.uc"
    "../Classes/LevelSummary.uc"
    "../Classes/LiftCenter.uc"
    "../Classes/LiftExit.uc"
    "../Classes/Light.uc"
    "../Classes/Locale.uc"
    "../Classes/LocalMessage.uc"
    "../Classes/locationid.uc"
    "../Classes/LogicGate.uc"
    "../Classes/LookAtDispatch.uc"
    "../Classes/MapList.uc"
    "../Classes/MapLocations.uc"
    "../Classes/Material.uc"
    "../Classes/MeshDecal.uc"
    "../Classes/MeshEffect.uc"
    "../Classes/MeshImmolation.uc"
    "../Classes/MeshInstance.uc"
    "../Classes/Mover.uc"
    "../Classes/MusicEvent.uc"
    "../Classes/MusicTrigger.uc"
    "../Classes/Mutator.uc"
    "../Classes/NavigationPoint.uc"
    "../Classes/Object.uc"
    "../Classes/Palette.uc"
    "../Classes/ParticleCollisionActor.uc"
    "../Classes/ParticleSystem.uc"
    "../Classes/PathAttach.uc"
    "../Classes/PathNode.uc"
    "../Classes/PatrolPoint.uc"
    "../Classes/Pawn.uc"
    "../Classes/PawnImmolation.uc"
    "../Classes/PawnShrink.uc"
    "../Classes/PawnTrackingInfo.uc"
    "../Classes/PeriodicTrigger.uc"
    "../Classes/Player.uc"
    "../Classes/PlayerCanSeeMe.uc"
    "../Classes/PlayerPawn.uc"
    "../Classes/PlayerReplicationInfo.uc"
    "../Classes/PlayerStart.uc"
    "../Classes/PoisonDamage.uc"
    "../Classes/PolyMarker.uc"
    "../Classes/Primitive.uc"
    "../Classes/ProceduralTexture.uc"
    "../Classes/Projectile.uc"
    "../Classes/Puppet.uc"
    "../Classes/PuppetIterator.uc"
    "../Classes/PuppetIteratorGlobal.uc"
    "../Classes/PuppetIteratorRadius.uc"
    "../Classes/PuppetWorker.uc"
    "../Classes/QuestItem.uc"
    "../Classes/QuestTrigger.uc"
    "../Classes/RadiationDamage.uc"
    "../Classes/RandomDispatcher.uc"
    "../Classes/RenderActor.uc"
    "../Classes/ReplicationInfo.uc"
    "../Classes/RespawnMarker.uc"
    "../Classes/RotaryTrigger.uc"
    "../Classes/RouletteWheelDispatcher.uc"
    "../Classes/RoundRobin.uc"
    "../Classes/SavedMove.uc"
    "../Classes/ScaledSprite.uc"
    "../Classes/ScoreBoard.uc"
    "../Classes/Scout.uc"
    "../Classes/ScriptedTexture.uc"
    "../Classes/ShrinkerDamage.uc"
    "../Classes/SkyZoneInfo.uc"
    "../Classes/SmackerTexture.uc"
    "../Classes/SoftParticleAffector.uc"
    "../Classes/SoftParticleSystem.uc"
    "../Classes/SoftParticleSystemAssign.uc"
    "../Classes/SOSMessage.uc"
    "../Classes/SpawnNotify.uc"
    "../Classes/SpecialEvent.uc"
    "../Classes/Spotlight.uc"
    "../Classes/SpriteManager.uc"
    "../Classes/StaticTexture.uc"
    "../Classes/SteroidBurnoutDamage.uc"
    "../Classes/StringMessage.uc"
    "../Classes/Subsystem.uc"
    "../Classes/SuicideDamage.uc"
    "../Classes/TcpLink.uc"
    "../Classes/Teleporter.uc"
    "../Classes/TentacleDamage.uc"
    "../Classes/TestMeshEffect.uc"
    "../Classes/Texture.uc"
    "../Classes/TextureCanvas.uc"
    "../Classes/thirdpersondecoration.uc"
    "../Classes/Time.uc"
    "../Classes/Trigger.uc"
    "../Classes/TriggerAnim.uc"
    "../Classes/TriggerArrangeActors.uc"
    "../Classes/TriggerAssign.uc"
    "../Classes/TriggerDestroy.uc"
    "../Classes/TriggerEtherial.uc"
    "../Classes/TriggerExternalForce.uc"
    "../Classes/TriggerFlic.uc"
    "../Classes/TriggerForward.uc"
    "../Classes/TriggerFOV.uc"
    "../Classes/TriggerLight.uc"
    "../Classes/TriggerLightStyle.uc"
    "../Classes/TriggerMarker.uc"
    "../Classes/TriggerMaterial.uc"
    "../Classes/TriggerMeshChannel.uc"
    "../Classes/TriggerMount.uc"
    "../Classes/TriggerPortal.uc"
    "../Classes/TriggerRelay.uc"
    "../Classes/Triggers.uc"
    "../Classes/TriggerSelfForward.uc"
    "../Classes/TriggerSetPhysics.uc"
    "../Classes/TriggerSlomo.uc"
    "../Classes/TriggerSmacker.uc"
    "../Classes/TriggerSpawn.uc"
    "../Classes/TriggerTextureCanvas.uc"
    "../Classes/TriggerTimeWarp.uc"
    "../Classes/TriggerToggleExistance.uc"
    "../Classes/TriggerToggleHidden.uc"
    "../Classes/TriggerTransmission.uc"
    "../Classes/TriggerZoneAssign.uc"
    "../Classes/UdpBeacon.uc"
    "../Classes/UdpLink.uc"
    "../Classes/UniqueTextureBank.uc"
    "../Classes/Variable.uc"
    "../Classes/VariableModify.uc"
    "../Classes/VoicePack.uc"
    "../Classes/WarpZoneInfo.uc"
    "../Classes/WarpZoneMarker.uc"
    "../Classes/WayBeacon.uc"
    "../Classes/Weapon.uc"
    "../Classes/WhippedDownDamage.uc"
    "../Classes/WhippedLeftDamage.uc"
    "../Classes/WhippedRightDamage.uc"
    "../Classes/ZoneInfo.uc"
    "../Classes/ZoneTrigger.uc"
)
source_group("Engine Classes" FILES ${Engine_Classes})

set(Engine_Inc
    "../Inc/AActor.h"
    "../Inc/ABeamSystem.h"
    "../Inc/ABoneRope.h"
    "../Inc/ABrush.h"
    "../Inc/ACamera.h"
    "../Inc/ACarcass.h"
    "../Inc/ADoorMover.h"
    "../Inc/ADukeNet.h"
    "../Inc/AFocalPoint.h"
    "../Inc/AGameReplicationInfo.h"
    "../Inc/AInventory.h"
    "../Inc/AMover.h"
    "../Inc/APawn.h"
    "../Inc/APlayerPawn.h"
    "../Inc/APlayerReplicationInfo.h"
    "../Inc/ARenderActor.h"
    "../Inc/ASoftParticleSystem.h"
    "../Inc/AZoneInfo.h"
    "../Inc/DnCinematic.h"
    "../Inc/dnclient.h"
    "../Inc/DnMesh.h"
    "../Inc/DnMeshPrivate.h"
    "../Inc/DnTextureCanvas.h"
    "../Inc/Engine.h"
    "../Inc/EngineClasses.h"
    "../Inc/MeshBase.h"
    "../Inc/network.h"
    "../Inc/Palette.h"
    "../Inc/Rope.h"
    "../Inc/S3tc.h"
    "../Inc/ULevelSummary.h"
    "../Inc/UnActor.h"
    "../Inc/UnAudio.h"
    "../Inc/UnCamera.h"
    "../Inc/UnCon.h"
    "../Inc/UnDDraw.h"
    "../Inc/UnDynBsp.h"
    "../Inc/UnEngine.h"
    "../Inc/UnEngineGnuG.h"
    "../Inc/UnEngineWin.h"
    "../Inc/UnGame.h"
    "../Inc/UnIn.h"
    "../Inc/UnLevel.h"
    "../Inc/UnMesh.h"
    "../Inc/UnMeshPrivate.h"
    "../Inc/UnModel.h"
    "../Inc/UnNetStuff.h"
    "../Inc/UnObj.h"
    "../Inc/UnPlayer.h"
    "../Inc/UnPrim.h"
    "../Inc/UnReach.h"
    "../Inc/UnRender.h"
    "../Inc/UnRenderIterator.h"
    "../Inc/UnRenDev.h"
    "../Inc/UnScrTex.h"
    "../Inc/UnTex.h"
    "../Inc/UnURL.h"
    "Amd3d.h"
    "flic.cpp"
    "res/resource.h"
)
source_group("Engine Inc" FILES ${Engine_Inc})

set(Engine_Src
    "../../Render/Src/Amd3d.h"
    "../../Render/Src/Render.cpp"
    "../../Render/Src/RenderPrivate.h"
    "../../Render/Src/UnLight.cpp"
    "../../Render/Src/UnMeshRn.cpp"
    "../../Render/Src/UnRandom.cpp"
    "../../Render/Src/UnRender.cpp"
    "../../Render/Src/UnSoftLn.cpp"
    "../../Render/Src/UnSpan.cpp"
    "../../Render/Src/UnSpan.h"
    "../../Render/Src/UnSprite.cpp"
    "../../Render/Src/UnTest.cpp"
    "../Inc/Flic.h"
    "ABeamSystem.cpp"
    "ABreakableGlass.cpp"
    "ADukeNet.cpp"
    "AFocalPoint.cpp"
    "ASoftParticleSystem.cpp"
    "BoneWarp.cpp"
    "DnCinematic.cpp"
    "dnclient.c"
    "DnMesh.cpp"
    "dnParentalLock.cpp"
    "dnPlayerProfile.cpp"
    "dnSaveLoad.cpp"
    "dnScreenshot.cpp"
    "DnTextureCanvas.cpp"
    "Engine.cpp"
    "EnginePrivate.h"
    "network.c"
    "palette.cpp"
    "Rope.cpp"
    "ULodMesh.cpp"
    "UnActCol.cpp"
    "UnActor.cpp"
    "UnAudio.cpp"
    "UnCamera.cpp"
    "UnCamMgr.cpp"
    "UnCanvas.cpp"
    "UnCon.cpp"
    "UnDynBsp.cpp"
    "UnEngine.cpp"
    "UnFont.cpp"
    "UnFPoly.cpp"
    "UnGame.cpp"
    "UnIn.cpp"
    "UnLevAct.cpp"
    "UnLevel.cpp"
    "UnLevTic.cpp"
    "UnMain.cpp"
    "UnMesh.cpp"
    "UnModel.cpp"
    "UnMover.cpp"
    "UnObjEngine.cpp"
    "UnParams.cpp"
    "UnPath.cpp"
    "UnPath.h"
    "UnPawn.cpp"
    "UnPhysic.cpp"
    "UnPlayer.cpp"
    "UnPrim.cpp"
    "UnReach.cpp"
    "UnRenderIterator.cpp"
    "UnRoute.cpp"
    "UnScript.cpp"
    "UnScrTex.cpp"
    "UnTex.cpp"
    "UnTrace.cpp"
    "UnURL.cpp"
)
source_group("Engine Src" FILES ${Engine_Src})

set(IPDrv_Classes
    "../../IpDrv/Classes/ClientBeaconReceiver.uc"
    "../../IpDrv/Classes/InternetLink.uc"
    "../../IpDrv/Classes/TcpLink.uc"
    "../../IpDrv/Classes/UdpBeacon.uc"
    "../../IpDrv/Classes/UdpLink.uc"
)
source_group("IPDrv Classes" FILES ${IPDrv_Classes})

set(IPServer_Classes
    "../../IpServer/Classes/UdpServerQuery.uc"
    "../../IpServer/Classes/UdpServerUplink.uc"
)
source_group("IPServer Classes" FILES ${IPServer_Classes})

set(Int
    "../../System/Engine.int"
)
source_group("Int" FILES ${Int})

set(IpDrv_Inc
    "../../IpDrv/Inc/AInternetLink.h"
    "../../IpDrv/Inc/ATcpLink.h"
    "../../IpDrv/Inc/AUdpLink.h"
    "../../IpDrv/Inc/GameSpyClasses.h"
    "../../IpDrv/Inc/GameSpyClassesPublic.h"
    "../../IpDrv/Inc/IpDrvClasses.h"
)
source_group("IpDrv Inc" FILES ${IpDrv_Inc})

set(IpDrv_Src
    "../../IpDrv/Src/InternetLink.cpp"
    "../../IpDrv/Src/TcpLink.cpp"
    "../../IpDrv/Src/TcpNetDriver.cpp"
    "../../IpDrv/Src/UdpLink.cpp"
    "../../IpDrv/Src/UMasterServerCommandlet.cpp"
    "../../IpDrv/Src/UnSocket.cpp"
    "../../IpDrv/Src/UnSocket.h"
    "../../IpDrv/Src/UUpdateServerCommandlet.cpp"
)
source_group("IpDrv Src" FILES ${IpDrv_Src})

set(Net
    "../Inc/UnBunch.h"
    "../Inc/UnChan.h"
    "../Inc/UnConn.h"
    "../Inc/UnDemoPenLev.h"
    "../Inc/UnDemoRec.h"
    "../Inc/UnNet.h"
    "../Inc/UnNetDrv.h"
    "../Inc/UnPenLev.h"
    "UnBunch.cpp"
    "UnChan.cpp"
    "UnConn.cpp"
    "UnDemoPenLev.cpp"
    "UnDemoRec.cpp"
    "UnNetDrv.cpp"
    "UnPenLev.cpp"
)
source_group("Net" FILES ${Net})

set(SapiSDK
    "Buildnum.h"
    "Spchtel.h"
    "Spchwrap.h"
    "Speech.h"
)
source_group("SapiSDK" FILES ${SapiSDK})

set(Smacker
    "../Inc/rad.h"
    "../Inc/smack.h"
)
source_group("Smacker" FILES ${Smacker})

set(WinDrv_Inc
    "../../WinDrv/Inc/WinDrv.h"
)
source_group("WinDrv Inc" FILES ${WinDrv_Inc})

set(WinDrv_Src
    "../../WinDrv/Src/WinClient.cpp"
    "../../WinDrv/Src/WinDrv.cpp"
    "../../WinDrv/Src/WinViewport.cpp"
)
source_group("WinDrv Src" FILES ${WinDrv_Src})

set(Window_Inc
    "../../Window/Inc/Window.h"
)
source_group("Window Inc" FILES ${Window_Inc})

set(Window_Src
    "../../Window/Src/Window.cpp"
)
source_group("Window Src" FILES ${Window_Src})

set(ALL_FILES
    ${Bink}
    ${Core_Inc}
    ${Core_Src}
    ${Engine_Classes}
    ${Engine_Inc}
    ${Engine_Src}
    ${IPDrv_Classes}
    ${IPServer_Classes}
    ${Int}
    ${IpDrv_Inc}
    ${IpDrv_Src}
    ${Net}
    ${SapiSDK}
    ${Smacker}
    ${WinDrv_Inc}
    ${WinDrv_Src}
    ${Window_Inc}
    ${Window_Src}
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
    TARGET_NAME_DEBUG   "Engine"
    TARGET_NAME_RELEASE "Engine"
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
    ARCHIVE_OUTPUT_NAME_DEBUG   "Engine"
    ARCHIVE_OUTPUT_NAME_RELEASE "Engine"
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
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Core/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Render/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../WinDrv/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../Window/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../IpDrv/Inc;"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../IpDrv/Src"
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
    "CORE_API=__declspec(dllexport);"
    "ENGINE_API=__declspec(dllexport);"
    "WINDOW_API=__declspec(dllexport);"
    "WINDRV_API=__declspec(dllexport);"
    "IPDRV_API=__declspec(dllexport);"
    "_WINDOWS;"
    "UNICODE;"
    "WIN32;"
    "_WIN32_IE=0x0200;"
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
            "/Y-"
        ">"
    )
    source_file_compile_options(../../Core/Src/mail.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Debug>:"
            "/Y-"
        ">"
    )
    source_file_compile_options(DnCinematic.cpp ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "/W3;/Y-"
    )
    source_file_compile_options(dnclient.c ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "/W3;/Y-"
    )
    source_file_compile_options(network.c ${FILE_CL_OPTIONS})
    string(CONCAT FILE_CL_OPTIONS
        "$<$<CONFIG:Release>:"
            "/FAs"
        ">"
    )
    source_file_compile_options(../../Render/Src/UnRender.cpp ${FILE_CL_OPTIONS})
    target_link_options(${PROJECT_NAME} PRIVATE
        $<$<CONFIG:Debug>:
            /INCREMENTAL
        >
        $<$<CONFIG:Release>:
            /INCREMENTAL:NO
        >
        /NODEFAULTLIB:LIBC;
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
    Cannibal
    GalaxyLib
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    "../../xcore/xcore;"
    "../lib/spchwrap;"
    "comctl32;"
    "dinput8;"
    "dxguid;"
    "winmm;"
    "../Lib/s3tc"
)
target_link_libraries(${PROJECT_NAME} PUBLIC "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

target_link_directories(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/../../DirectX8/Lib"
)

