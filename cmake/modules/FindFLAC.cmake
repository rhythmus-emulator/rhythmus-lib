# Should work well only in MSVC

if (UNIX)
    find_package(FLAC ONLY_CMAKE_FIND_ROOT_PATH)
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

FIND_PATH(FLAC_INCLUDE_DIR FLAC/all.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(FLAC_LIBRARY
    NAMES libFLAC_static libFLAC FLAC
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

SET(FLAC_FOUND "NO")
IF(FLAC_LIBRARY AND FLAC_INCLUDE_DIR)
    SET(FLAC_FOUND "YES")
ENDIF(FLAC_LIBRARY AND FLAC_INCLUDE_DIR)
