# Should work well only in MSVC

if (UNIX)
    find_package(OGG ONLY_CMAKE_FIND_ROOT_PATH)
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

FIND_PATH(OGG_INCLUDE_DIR ogg/ogg.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(OGG_LIBRARY
    NAMES libogg_static libogg ogg
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

SET(OGG_FOUND "NO")
IF(OGG_LIBRARY AND OGG_INCLUDE_DIR)
    SET(OGG_FOUND "YES")
ENDIF(OGG_LIBRARY AND OGG_INCLUDE_DIR)
