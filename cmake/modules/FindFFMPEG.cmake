# Should work well only in MSVC

if (WIN32)
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        # 64bit
        set(LIB_PATH ${CMAKE_CURRENT_LIST_DIR}/../../prebuilt/x64-MT)
    else ()
        # 32bit
        set(LIB_PATH ${CMAKE_CURRENT_LIST_DIR}/../../prebuilt/x86-MT)
    endif ()
else ()
    set(LIB_PATH ${CMAKE_CURRENT_LIST_DIR}/../../prebuilt/linux-x86)
endif ()

FIND_PATH(FFMPEG_INCLUDE_DIR libavcodec/avcodec.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(FFMPEG_AVCODEC_LIBRARY
    NAMES libavcodec avcodec
    HINTS
    ${LIB_PATH}/ffmpeg
    PATHS
    /usr/local/lib
    /usr/lib
)

FIND_LIBRARY(FFMPEG_AVDEVICE_LIBRARY
    NAMES libavdevice avdevice
    HINTS
    ${LIB_PATH}/ffmpeg
    PATHS
    /usr/local/lib
    /usr/lib
)

FIND_LIBRARY(FFMPEG_AVFILTER_LIBRARY
    NAMES libavfilter avfilter
    HINTS
    ${LIB_PATH}/ffmpeg
    PATHS
    /usr/local/lib
    /usr/lib
)

FIND_LIBRARY(FFMPEG_AVFORMAT_LIBRARY
    NAMES libavformat avformat
    HINTS
    ${LIB_PATH}/ffmpeg
    PATHS
    /usr/local/lib
    /usr/lib
)

FIND_LIBRARY(FFMPEG_AVUTIL_LIBRARY
    NAMES libavutil avutil
    HINTS
    ${LIB_PATH}/ffmpeg
    PATHS
    /usr/local/lib
    /usr/lib
)

FIND_LIBRARY(FFMPEG_SWRESAMPLE_LIBRARY
    NAMES libswresample swresample
    HINTS
    ${LIB_PATH}/ffmpeg
    PATHS
    /usr/local/lib
    /usr/lib
)

FIND_LIBRARY(FFMPEG_SWSCALE_LIBRARY
    NAMES libswscale swscale
    HINTS
    ${LIB_PATH}/ffmpeg
    PATHS
    /usr/local/lib
    /usr/lib
)

set( FFMPEG_LIBRARIES
    ${FFMPEG_AVCODEC_LIBRARY}
    ${FFMPEG_AVDEVICE_LIBRARY}
    ${FFMPEG_AVFILTER_LIBRARY}
    ${FFMPEG_AVFORMAT_LIBRARY}
    ${FFMPEG_AVUTIL_LIBRARY}
    ${FFMPEG_SWRESAMPLE_LIBRARY}
    ${FFMPEG_SWSCALE_LIBRARY}
    )

SET(FFMPEG_FOUND "NO")
IF(FFMPEG_LIBRARIES AND FFMPEG_INCLUDE_DIR)
    SET(FFMPEG_FOUND "YES")
ENDIF()
