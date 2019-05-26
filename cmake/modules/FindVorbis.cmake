# Should work well only in MSVC

if (UNIX)
    find_package(VORBIS ONLY_CMAKE_FIND_ROOT_PATH)
    return ()
endif ()

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

FIND_PATH(VORBIS_INCLUDE_DIR vorbis/vorbisfile.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(VORBIS_STATIC_LIBRARY
    NAMES libvorbis_static
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

FIND_LIBRARY(VORBISFILE_STATIC_LIBRARY
    NAMES libvorbisfile_static
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

set(VORBIS_LIBRARY VORBIS_STATIC_LIBRARY VORBISFILE_STATIC_LIBRARY)

SET(VORBIS_FOUND "NO")
IF(VORBIS_LIBRARY AND VORBIS_INCLUDE_DIR)
    SET(VORBIS_FOUND "YES")
ENDIF(VORBIS_LIBRARY AND VORBIS_INCLUDE_DIR)
