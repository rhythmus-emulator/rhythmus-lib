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

FIND_PATH(FREEIMAGE_INCLUDE_DIR FreeImage.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(FREEIMAGE_LIBRARY
    NAMES libfreeimage freeimage
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

SET(FREEIMAGE_FOUND "NO")
IF(FREEIMAGE_LIBRARY AND FREEIMAGE_INCLUDE_DIR)
    SET(FREEIMAGE_FOUND "YES")
ENDIF(FREEIMAGE_LIBRARY AND FREEIMAGE_INCLUDE_DIR)
