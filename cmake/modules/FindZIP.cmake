# Locate libzip
# This module defines
# LIBZIP_LIBRARY
# LIBZIP_FOUND, if false, do not try to link to libzip
# LIBZIP_INCLUDE_DIR, where to find the headers
#

if (WIN32)
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        # 64bit
        set(LIB_PATH ${CMAKE_SOURCE_DIR}/../rparser-lib/prebuilt/x64-MT)
    else ()
        # 32bit
        set(LIB_PATH ${CMAKE_SOURCE_DIR}/../rparser-lib/prebuilt/x86-MT)
    endif ()
else ()
    set(LIB_PATH ${CMAKE_SOURCE_DIR}/../rparser-lib/prebuilt/linux-x86)
endif ()

FIND_PATH(ZIP_INCLUDE_DIR zip.h
    HINTS
    ${CMAKE_SOURCE_DIR}/../rparser-lib/include
    PATHS
    $ENV{LIBZIP_DIR}
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(ZIP_LIBRARY
    NAMES libzip zip
    HINTS
    ${LIB_PATH}
    PATHS
    $ENV{LIBZIP_DIR}/lib
    /usr/local/lib
    /usr/lib
)

SET(ZIP_FOUND "NO")
IF(ZIP_LIBRARY AND ZIP_INCLUDE_DIR)
    SET(ZIP_FOUND "YES")
ENDIF(ZIP_LIBRARY AND ZIP_INCLUDE_DIR)
