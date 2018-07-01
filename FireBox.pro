#-------------------------------------------------
#
# Project created by QtCreator 2011-05-26T17:27:40
#
#-------------------------------------------------

# Define version
__VERSION=60.0

#JamesMcCrae: define this when doing Oculus-submitted builds (either for Rift of GearVR app categories)
#DEFINES += OCULUS_SUBMISSION_BUILD
#Daydream store build
DEFINES += DAYDREAM_SUBMISSION_BUILD

DEFINES += __JANUS_VERSION=\\\"$$__VERSION\\\"
DEFINES += __JANUS_VERSION_COMPLETE=__JANUS_VERSION\\\".$$system(git --git-dir ./.git --work-tree . describe --always --tags --abbrev=7)\\\"
DEFINES += RIFT_ID=\\\"$$system(more riftid.txt)\\\"
DEFINES += GEAR_ID=\\\"$$system(more gearid.txt)\\\"
DEFINES += GOOGLE_ANALYTICS_ID=\\\"$$system(more googleanalyticsid.txt)\\\"

# Default rules for deployment.
android:include(deployment.pri)

# ensure one "debug_and_release" in CONFIG, for clarity...
debug_and_release {
    CONFIG -= debug_and_release
    CONFIG += debug_and_release
}
    # ensure one "debug" or "release" in CONFIG so they can be used as
    #   conditionals instead of writing "CONFIG(debug, debug|release)"...
CONFIG(debug, debug|release) {
    CONFIG -= debug release
    CONFIG += debug
}
CONFIG(release, debug|release) {
    CONFIG -= debug release
    CONFIG += release force_debug_info
# force_debug_info
}

QT       += core opengl gui network xml script scripttools websockets

#!android {
#    QT += webengine webenginewidgets
#}
android{
    QT += androidextras sensors
}

win32-msvc* {
    QMAKE_CXXFLAGS += /wd4251
    QMAKE_CXXFLAGS += /F 32000000
    QMAKE_LFLAGS += /STACK:32000000
    DEFINES += _VARIADIC_MAX=6
}

unix:!macx{
    QMAKE_CXXFLAGS += -Wl,--stack,32000000
    QMAKE_CXXFLAGS += -std=c++11 -Wno-unused-local-typedefs
}

unix:macx{
    QMAKE_CXXFLAGS += -Wl,--stack,32000000
    QMAKE_CXXFLAGS += -std=c++11 -stdlib=libc++
    QMAKE_LFLAGS += -stdlib=libc++
}

CONFIG += c++11
CONFIG += qtnamespace
CONFIG += -opengl desktop -no-angle

TARGET = janusvr
TEMPLATE = app

SOURCES += main.cpp \
    mainwindow.cpp \
    mathutil.cpp \
    game.cpp \
    player.cpp \
    htmlpage.cpp \
    spinanimation.cpp \
    textgeom.cpp \
    soundmanager.cpp \
    assetimage.cpp \
    assetobject.cpp \
    assetsound.cpp \
    assetskybox.cpp \
    assetvideo.cpp \
    assetscript.cpp \
    assetshader.cpp \
    assetghost.cpp \
    multiplayermanager.cpp \
    scriptbuiltins.cpp \
    scriptvalueconversions.cpp \
    cookiejar.cpp \
    assetwebsurface.cpp \
    leaphands.cpp \
    webview.cpp \
    room.cpp \
    roomtemplate.cpp \
    environment.cpp \
    roomobject.cpp \
    menu.cpp \
    webasset.cpp \
    particlesystem.cpp \
    unittests.cpp \
    domnode.cpp \
    framebuffermanager.cpp \
    audioutil.cpp \
    gamepad.c \
    abstractrenderer.cpp \
    renderer.cpp \
    renderergl33_renderthread.cpp \
    renderergl44.cpp \
    renderergl44_viewportinstancing.cpp \
    frustumcullingmanager.cpp \
    debugrenderer.cpp \
    lightmanager.cpp \
    virtualkeyboard.cpp \
    bookmarkmanager.cpp \
    asset.cpp \
    controllermanager.cpp \
    hierarchywindow.cpp \
    propertieswindow.cpp \
    filteredcubemapmanager.cpp \
    abstractwebsurface.cpp \
    mem_istream.cpp \   
    contentimporter.cpp \
    baseassetdata.cpp \
    assetimagedata.cpp \
    abstracthmdmanager.cpp \
    geom.cpp \
    roomphysics.cpp \
    performancelogger.cpp \
    texturemanager.cpp \
    assetimagedataq.cpp \
    textureimporterexr.cpp \
    textureimportergli.cpp \
    textureimporterqimage.cpp \
    analytics.cpp \
    assetwebsurface_pdf.cpp \
    glwidget.cpp \
    settingswindow.cpp \
    settingsmanager.cpp \
    assetwindow.cpp \
    socialwindow.cpp \
    assetrecording.cpp \
    rendererinterface.cpp \
    codeeditorwindow.cpp \
    navigationwindow.cpp \
    scriptablexmlhttprequest.cpp \
    renderergl44_loadingthread.cpp \
    renderergl33_loadingthread.cpp \
    renderergl44_renderthread.cpp \
    textureimportercmft.cpp \
    assetvideo3d.cpp \
    abstractwebview.cpp \
    mediaplayer.cpp \
    scriptablevector.cpp \
    cefwebview.cpp

win32:SOURCES += slughelper.cpp


unix:!macx:SOURCES += ./resources/cef/linux/libcef_dll/base/cef_atomicops_x86_gcc.cc

HEADERS += \
    mainwindow.h \
    mathutil.h \
    game.h \
    player.h \
    htmlpage.h \
    spinanimation.h \
    textgeom.h \
    soundmanager.h \
    assetimage.h \
    assetobject.h \
    assetsound.h \
    assetskybox.h \
    assetvideo.h \
    assetscript.h \
    assetshader.h \
    assetghost.h \
    multiplayermanager.h \
    scriptbuiltins.h \
    scriptvalueconversions.h \
    cookiejar.h \
    assetwebsurface.h \
    leaphands.h \
    webview.h \
    room.h \
    roomtemplate.h \
    environment.h \
    roomobject.h \
    menu.h \
    webasset.h \
    particlesystem.h \
    unittests.h \
    domnode.h \
    framebuffermanager.h \
    audioutil.h \
    gamepad.h \
    rendererinterface.h \
    abstractrenderer.h \
    renderer.h \
    renderergl33_renderthread.h \
    renderergl44.h \
    renderergl44_viewportinstancing.h \
    frustumcullingmanager.h \
    debugrenderer.h \
    lightmanager.h \
    virtualkeyboard.h \
    bookmarkmanager.h \
    asset.h \
    controllermanager.h \
    hierarchywindow.h \
    propertieswindow.h \
    filteredcubemapmanager.h \
    abstractwebsurface.h \
    abstracthmdmanager.h \
    geom.h \
    roomphysics.h \
    mem_istream.h \
    contentimporter.h \
    baseassetdata.h \
    assetimagedata.h \
    roomphysics.h \
    performancelogger.h \
    assetimagedataq.h \
    textureimporterqimage.h \
    textureimporterexr.h \
    textureimportergli.h \
    texturemanager.h \
    analytics.h \
    assetwebsurface_pdf.h \
    glwidget.h \
    settingswindow.h \
    settingsmanager.h \
    assetwindow.h \
    socialwindow.h \
    assetrecording.h \
    codeeditorwindow.h \
    navigationwindow.h \
    scriptablexmlhttprequest.h \
    renderergl44_loadingthread.h \
    renderergl44_renderthread.h \
    renderergl33_loadingthread.h \
    textureimportercmft.h \
    assetvideo3d.h \
    abstractwebview.h \
    mediaplayer.h \
    scriptablevector.h \
    cefwebview.h

win32:HEADERS += slughelper.h

# NVIDIA HBAO
#win32:INCLUDEPATH += "./resources/HBAOPlus/include"
#win32:LIBS += -L"$$PWD/resources/HBAOPlus/lib"
#win32:LIBS += "-lGFSDK_SSAO_GL.win64"

# Vive support (if not an Oculus Submission)
!contains(DEFINES, OCULUS_SUBMISSION_BUILD) {
    win32:HEADERS += vivemanager.h
    win32:SOURCES += vivemanager.cpp   
}

unix:!macx:HEADERS += vivemanager.h
unix:!macx:SOURCES += vivemanager.cpp

#Gamepad not working on OSX
unix:macx:SOURCES -= "gamepad.c"
unix:macx:HEADERS -= "gamepad.h"

#Remove dependencies unused by Android
android:SOURCES -= "webview.cpp" \
    "assetwebsurface_pdf.cpp" \
    "gamepad.c" \
    "unittests.cpp" \
    "vivemanager.cpp" \
    "mem_istream.cpp" \
    "textureimporterexr.cpp" \
    "cefwebview.cpp"
android:HEADERS -= "webview.h" \
    "assetwebsurface_pdf.h" \
    "gamepad.h" \
    "unittests.h" \
    "vivemanager.h" \
    "mem_istream.h" \
    "textureimporterexr.h" \
    "cefwebview.h"
android:SOURCES += "androidwebview.cpp" \
    "slidingtabwidget.cpp" \
    "jniutil.cpp" \
    "gvrmanager.cpp"
android:HEADERS += "androidwebview.h" \
    "slidingtabwidget.h" \
    "jniutil.h" \
    "gvrmanager.h"

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    android:SOURCES += "gearmanager.cpp"
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    android:HEADERS += "gearmanager.h"
}

# Chromium Embedded Framework CEF
win32:INCLUDEPATH += "./resources/cef/windows/"
unix:!macx:!android:INCLUDEPATH += "./resources/cef/linux"

win32:LIBS += -L"$$PWD/dependencies/windows/"
unix:!macx:!android:LIBS += -L"$$PWD/dependencies/linux/"

CONFIG(debug) {
    win32:LIBS += -L"$$PWD/resources/cef/windows/lib/debug/"
    unix:!macx:!android:LIBS += -L"$$PWD/resources/cef/linux/lib/debug/"
}
CONFIG(release) {
    win32:LIBS += -L"$$PWD/resources/cef/windows/lib/release/"
    unix:!macx:!android:LIBS += -L"$$PWD/resources/cef/linux/lib/release/"
}

win32:LIBS += -llibcef -llibcef_dll_wrapper
unix:!macx:!android:LIBS += -lcef -lcef_dll_wrapper

#GoogleVR
contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    INCLUDEPATH += "./resources/gvr-android-sdk/libraries/headers"
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lgvr
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libgvr.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    INCLUDEPATH += "./resources/gvr-android-sdk/libraries/headers"
    LIBS += -L"$$PWD/dependencies/android/x86/"
    LIBS += -lgvr
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/x86/libgvr.so
}

#Oculus Mobile
contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    INCLUDEPATH += "./resources/ovr_sdk_mobile/VrApi/Include"

    CONFIG(debug) {
        LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/Debug/"
        LIBS += -lvrapi
        ANDROID_EXTRA_LIBS += \
            $$PWD/dependencies/android/armeabi-v7a/Debug/libvrapi.so
    }
    CONFIG(release) {
        LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/Release/"
        LIBS += -lvrapi
        ANDROID_EXTRA_LIBS += \
            $$PWD/dependencies/android/armeabi-v7a/Release/libvrapi.so
    }
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    INCLUDEPATH += "./resources/ovr_sdk_mobile/VrApi/Include"

    CONFIG(debug) {
        LIBS += -L"$$PWD/dependencies/android/armeabi/Debug/"
        LIBS += -lvrapi
        ANDROID_EXTRA_LIBS += \
            $$PWD/dependencies/android/armeabi/Debug/libvrapi.so
    }
    CONFIG(release) {
        LIBS += -L"$$PWD/dependencies/android/armeabi/Release/"
        LIBS += -lvrapi
        ANDROID_EXTRA_LIBS += \
            $$PWD/dependencies/android/armeabi/Release/libvrapi.so
    }
}

# cmft: Cross-platform open-source command-line cubemap filtering tool.
win32:INCLUDEPATH += "./resources/cmft/dependency/bx/include/compat/msvc"
unix:macx:INCLUDEPATH += "./resources/cmft/dependency/bx/include/compat/osx"
INCLUDEPATH += "./resources/cmft/dependency"
INCLUDEPATH += "./resources/cmft/dependency/bx/include"
INCLUDEPATH += "./resources/cmft/dependency/bx/3rdparty"
INCLUDEPATH += "./resources/cmft/dependency/cl/include"
INCLUDEPATH += "./resources/cmft/dependency/dm/include"
INCLUDEPATH += "./resources/cmft/dependency/stb"
INCLUDEPATH += "./resources/cmft/include"
win32:LIBS += -L"$$PWD/resources/cmft/lib"
unix:!macx:!android:LIBS += -L"$$PWD/resources/cmft/lib"
unix:macx:LIBS += -L"$$PWD/resources/cmft/lib/Mac"

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lcmft
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libcmft.so
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    LIBS += -L"$$PWD/dependencies/android/armeabi/"
    LIBS += -lcmft
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi/libcmft.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    LIBS += -L"$$PWD/dependencies/android/x86/"
    LIBS += -lcmft
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/x86/libcmft.so
}

CONFIG(debug) {
    win32:LIBS += -lcmftDebug
    unix:macx:LIBS += -lcmftDebug
    unix:!macx:!android:LIBS += -lcmftRelease
}
CONFIG(release) {
    !android:LIBS += -lcmftRelease
}

# gli
INCLUDEPATH += "./resources/gli"
INCLUDEPATH += "./resources/glm"

# half
INCLUDEPATH += "./resources/half_1.12/include"

# Slug
win32:INCLUDEPATH += "./resources/SlugLib/include"
win32:LIBS += -L"$$PWD/resources/SlugLib/lib"
win32:LIBS += -lSlug

#OVR Platform on Windows
win32:HEADERS += riftmanager.h
win32:SOURCES += riftmanager.cpp

# OVR Platform SDK (essential for Oculus Home build)
win32:SOURCES += "./resources/OVRPlatformSDK_v1.24.0/Windows/OVR_PlatformLoader.cpp"
win32:INCLUDEPATH += "./resources/OVRPlatformSDK_v1.24.0/Include" #note that Windows version is built against latest version (0.8+) of LibOVR
win32:LIBS += -L"$$PWD/resources/OVRPlatformSDK_v1.24.0/Windows"
win32:LIBS += -lLibOVRPlatform64_1

#OVR Platform on Android
android:INCLUDEPATH += "./resources/OVRPlatformSDK_v1.24.0/Include" #note that Windows version is built against latest version (0.8+) of LibOVR
contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lovrplatformloader
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libovrplatformloader.so
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    LIBS += -L"$$PWD/dependencies/android/armeabi/"
    LIBS += -lovrplatformloader
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi/libovrplatformloader.so
}

# LibOVR
win32:INCLUDEPATH += "./resources/LibOVR_v1.24.0/Include" #note that Windows version is built against latest version (0.8+) of LibOVR
CONFIG(debug) {
    win32:LIBS += -L"$$PWD/resources/LibOVR_v1.24.0/Lib/Windows/x64/Debug/VS2015"
}
CONFIG(release) {
    win32:LIBS += -L"$$PWD/resources/LibOVR_v1.24.0/Lib/Windows/x64/Release/VS2015"
}
win32:LIBS += -llibOVR

# LeapSDK
win32:INCLUDEPATH += "./resources/LeapSDK/include" #note that Linux/OSX are built against an old gcc compatible version (2.2) of libLeap
win32:LIBS += -L"$$PWD/resources/LeapSDK/lib/x64"
win32:LIBS += -lleap
unix:!android:!macx:INCLUDEPATH += "./resources/LeapSDK_2.2/include"
unix:!android:!macx:LIBS += -L"$$PWD/resources/LeapSDK_2.2/lib/x64"

# openVR (note that we only include it if OCULUS_SUBMISSION_BUILD is not defined)
!contains(DEFINES, OCULUS_SUBMISSION_BUILD) {
win32:INCLUDEPATH += "./resources/openvr/headers"
win32:LIBS += -L"$$PWD/resources/openvr/lib/win64"
win32:LIBS += -lopenvr_api
}
unix:!macx:!android:INCLUDEPATH += "./resources/openvr/headers"
unix:!macx:!android:LIBS += -L"$$PWD/resources/openvr/lib/linux64"
unix:!macx:!android:LIBS += -lopenvr_api

# OpenAL
INCLUDEPATH += "./resources/openal-soft-1.17.2/include"
win32:LIBS += -L"$$PWD/resources/OpenAL/libs/Win64"
win32:LIBS += -L"$$PWD/resources/OpenAL/libs/Win64/EFX-Util_MT"
win32:LIBS += -lOpenAL32 -lEFX-Util
unix:macx:LIBS += -L"$$PWD/resources/openal-soft-1.17.2/bin"
unix:macx:LIBS += -lopenal

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lopenal
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libopenal.so
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    LIBS += -L"$$PWD/dependencies/android/armeabi/"
    LIBS += -lopenal
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi/libopenal.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    LIBS += -L"$$PWD/dependencies/android/x86/"
    LIBS += -lopenal
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/x86/libopenal.so
}

# OpenSSL
INCLUDEPATH +="./resources/openssl_win64/include"
win32:LIBS += -L"$$PWD/resources/openssl_win64/libs"
win32:LIBS += -llibeay32 -lssleay32
OPENSSL_LIBS ='-L"$$PWD/resources/openssl_win64/libs" -llibeay32 -lssleay32'
CONFIG += openssl-linked

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    INCLUDEPATH +="./resources/openssl_android/openssl-1.0.2l_arm/include"
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lcrypto -lssl
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libcrypto.so \
        $$PWD/dependencies/android/armeabi-v7a/libssl.so
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    INCLUDEPATH +="./resources/openssl_android/openssl-1.0.2l_arm/include"
    LIBS += -L"$$PWD/dependencies/android/armeabi/"
    LIBS += -lcrypto -lssl
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi/libcrypto.so \
        $$PWD/dependencies/android/armeabi/libssl.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    INCLUDEPATH +="./resources/openssl_android/openssl-1.0.2l_x86/include"
    LIBS += -L"$$PWD/dependencies/android/x86/"
    LIBS += -lcrypto -lssl
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/x86/libcrypto.so \
        $$PWD/dependencies/android/x86/libssl.so
}

# Opus
INCLUDEPATH +="./resources/opus-1.1.2/include"
CONFIG(debug) {
    win32:LIBS += -L"$$PWD/resources/opus-1.1.2/lib/x64/debug"
}
CONFIG(release) {
    win32:LIBS += -L"$$PWD/resources/opus-1.1.2/lib/x64/release"
}
unix:macx:LIBS += -L"/usr/local/lib" #used for Opus - OSX
!android:LIBS += -lopus

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lopus
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libopus.so
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    LIBS += -L"$$PWD/dependencies/android/armeabi/"
    LIBS += -lopus
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi/libopus.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    LIBS += -L"$$PWD/dependencies/android/x86/"
    LIBS += -lopus
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/x86/libopus.so
}

# VLC
win32:INCLUDEPATH +="./resources/libvlc/include"
macx:INCLUDEPATH +="./resources/libvlc/include"
unix:android:INCLUDEPATH +="./resources/libvlc/include"

win32:LIBS += -L"$$PWD/resources/libvlc/libs"
macx:LIBS += -L"$$PWD/resources/libvlc/libs/Mac/lib"
unix:android:LIBS += -L"$$PWD/resources/libvlc/libs"

win32:LIBS += -lvlc
unix:!android:LIBS += -lvlc

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lvlcjni
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libvlcjni.so
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    LIBS += -L"$$PWD/dependencies/android/armeabi/"
    LIBS += -lvlcjni
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi/libvlcjni.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    LIBS += -L"$$PWD/dependencies/android/x86/"
    LIBS += -lvlcjni
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/x86/libvlcjni.so
}

# QtPdf
!android:INCLUDEPATH +="./resources/qtpdf/include/QtPdf"
win32:LIBS += -L"$$PWD/resources/qtpdf/lib"
win32:LIBS += Qt5Pdf.lib
unix:!macx:!android:LIBS += -L"$$PWD/resources/qtpdf/lib"
unix:!macx:!android:LIBS += -lQt5Pdf

# Bullet Physics - on Linux, this is 2.87 and installed via libbullet-dev
win32:INCLUDEPATH +="./resources/bullet3/src"
CONFIG(debug) {
    win32:LIBS += -L"$$PWD/resources/bullet3/lib/Debug"
}
CONFIG(release) {
    win32:LIBS += -L"$$PWD/resources/bullet3/lib/Release"
}
win32:LIBS += -lBulletDynamics -lBulletCollision -lLinearMath

android:INCLUDEPATH +="./resources/bullet3/src"
unix:!macx:!android:INCLUDEPATH += "/usr/include/bullet"
unix:macx:INCLUDEPATH +="./resources/bullet3/src"
unix:macx:LIBS += -L"/usr/local/lib" #used for Bullet - OSX
unix:!android:LIBS += -lBulletDynamics -lBulletCollision -lLinearMath

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lBullet
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libBullet.so
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    LIBS += -L"$$PWD/dependencies/android/armeabi/"
    LIBS += -lBullet
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi/libBullet.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    LIBS += -L"$$PWD/dependencies/android/x86/"
    LIBS += -lBullet
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/x86/libBullet.so
}

# Assimp
INCLUDEPATH += "./resources/assimp/include"

CONFIG(debug) {
    LIBS += -L"$$PWD/resources/assimp/lib/Debug"
    win32:LIBS += -lassimp-vc140-mt -lIrrXML
}
CONFIG(release) {
    LIBS += -L"$$PWD/resources/assimp/lib/Release"
    win32:LIBS += -lassimp-vc140-mt -lIrrXML
}
LIBS += -L"$$PWD/resources/assimp/lib"
unix:macx:LIBS += -L"$$PWD/resources/assimp/lib/Mac"
unix:!android:LIBS += -lassimp

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lassimp
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libassimp.so
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    LIBS += -L"$$PWD/dependencies/android/armeabi/"
    LIBS += -lassimp
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi/libassimp.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    LIBS += -L"$$PWD/dependencies/android/x86/"
    LIBS += -lassimp
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/x86/libassimp.so
}

# RenderDoc
INCLUDEPATH += "./resources/RenderDoc"

# Generic Windows libs
win32:LIBS += -lopengl32 -lglu32 -ladvapi32 -lwinmm

# Other Linux libs (need to be separately installed via apt, etc.)
unix:!macx:!android:LIBS += -lLeap -lX11 -ludev -lGLU -lrt -ldl -lopenal -lz #-lXrandr -lXinerama
unix:!macx:!android:{
   QMAKE_LFLAGS += -Wl,-rpath,"'\$$ORIGIN'"
}

unix:macx:LIBS += -lz -framework IOKit -framework CoreFoundation
unix:macx:QMAKE_LFLAGS += -F"$$PWD/resources/qtpdf/lib/mac"
unix:macx:LIBS += -framework QtPdf
unix:macx:{
   QMAKE_LFLAGS += -Wl,-rpath,"@loader_path/../Frameworks"
}

android:LIBS += -ljnigraphics -landroid -lz -lOpenSLES -lEGL

#C++ STL
contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    LIBS += -L"$$PWD/dependencies/android/armeabi-v7a/"
    LIBS += -lc++_shared
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi-v7a/libc++_shared.so
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    LIBS += -L"$$PWD/dependencies/android/armeabi/"
    LIBS += -lc++_shared
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/armeabi/libc++_shared.so
}

contains(ANDROID_TARGET_ARCH,x86) {
    LIBS += -L"$$PWD/dependencies/android/x86/"
    LIBS += -lc++_shared
    ANDROID_EXTRA_LIBS += \
        $$PWD/dependencies/android/x86/libc++_shared.so
}

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    INCLUDEPATH += "./resources/androidAPI21/arch-arm/usr/include"
}

contains(ANDROID_TARGET_ARCH,armeabi) {
    INCLUDEPATH += "./resources/androidAPI21/arch-arm/usr/include"
}

contains(ANDROID_TARGET_ARCH,x86) {
    INCLUDEPATH += "./resources/androidAPI21/arch-x86/usr/include"
}

#icon
win32:RC_FILE = janusvr.rc
unix:macx:ICON = janusvr.icns

RESOURCES +=

DISTFILES +=

android:DISTFILES += \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/libs/* \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/src/org/janus/JanusActivity.java \
    android/src/org/janus/WebViewManager.java \
    android/src/org/janus/GearManager.java \
    android/src/org/janus/GVRManager.java \
    android/src/org/janus/JoystickView.java \
    android/src/org/janus/ButtonView.java \
    android/src/org/janus/SplashView.java

ASSETS.path = /assets
ASSETS.files = $$files($$PWD/android/assets/*)
INSTALLS += ASSETS

# OpenEXR
win32:DEFINES += OPENEXR_DLL
INCLUDEPATH += "./resources/openexr-2.2.0/build/include"

win32:LIBS += -L"$$PWD/resources/openexr-2.2.0/build/win"
win32:LIBS += half.lib Iex-2_2.lib IexMath-2_2.lib IlmImf-2_2.lib IlmImfUtil-2_2.lib IlmThread-2_2.lib Imath-2_2.lib

unix:!android:INCLUDEPATH += "/usr/local/include/OpenEXR"
unix:!android:LIBS += -lIlmImf -lImath -lHalf -lIex -lIexMath -lIlmThread -pthread

# OpenGL
DEFINES += OPENGL

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
