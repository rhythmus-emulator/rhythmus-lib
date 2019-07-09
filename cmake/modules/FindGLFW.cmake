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

FIND_PATH(GLFW_INCLUDE_DIR GLFW/glfw3.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(GLFW_LIBRARY
    NAMES libglfw3 glfw3 libglfw glfw
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

SET(GLFW_FOUND "NO")
IF(GLFW_LIBRARY AND GLFW_INCLUDE_DIR)
    SET(GLFW_FOUND "YES")
ENDIF(GLFW_LIBRARY AND GLFW_INCLUDE_DIR)
