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

FIND_PATH(FREETYPE_INCLUDE_DIR freetype/freetype.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(FREETYPE_LIBRARY
    NAMES libfreetype_static libfreetype freetype
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

SET(FREETYPE_FOUND "NO")
IF(FREETYPE_LIBRARY AND FREETYPE_INCLUDE_DIR)
    SET(FREETYPE_FOUND "YES")
	SET(FREETYPE_LIBRARIES ${FREETYPE_LIBRARY})
ENDIF(FREETYPE_LIBRARY AND FREETYPE_INCLUDE_DIR)
