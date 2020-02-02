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

FIND_PATH(GLEW_INCLUDE_DIR GL/glew.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

# find static version first
FIND_LIBRARY(GLEW_LIBRARIES
    NAMES libglews libglew libglew32s libglew32 glew32s glew32
    HINTS ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

SET(GLEW_FOUND "NO")
IF(GLEW_LIBRARIES AND GLEW_INCLUDE_DIR)
    SET(GLEW_FOUND "YES")
ENDIF(GLEW_LIBRARIES AND GLEW_INCLUDE_DIR)
