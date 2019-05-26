# Should work well only in MSVC

if (UNIX)
    find_package(ZLIB ONLY_CMAKE_FIND_ROOT_PATH)
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

FIND_PATH(ZLIB_INCLUDE_DIR zlib.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(ZLIB_LIBRARY
    NAMES libzlib zlib
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

SET(ZLIB_FOUND "NO")
IF(ZLIB_LIBRARY AND ZLIB_INCLUDE_DIR)
    SET(ZLIB_FOUND "YES")
ENDIF(ZLIB_LIBRARY AND ZLIB_INCLUDE_DIR)
