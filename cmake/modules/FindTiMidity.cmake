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

FIND_PATH(TIMIDITY_INCLUDE_DIR timidity.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(TIMIDITY_LIBRARY
    NAMES libtimidity timidity timidity_static
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

SET(TIMIDITY_FOUND "NO")
IF(TIMIDITY_LIBRARY AND TIMIDITY_INCLUDE_DIR)
    SET(TIMIDITY_FOUND "YES")
ENDIF(TIMIDITY_LIBRARY AND TIMIDITY_INCLUDE_DIR)
