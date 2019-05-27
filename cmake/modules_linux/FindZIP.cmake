# Locate libzip
# This module defines
# LIBZIP_LIBRARY
# LIBZIP_FOUND, if false, do not try to link to libzip
# LIBZIP_INCLUDE_DIR, where to find the headers
#

set(LIB_PATH ${CMAKE_CURRENT_LIST_DIR}/../../prebuilt/linux-x86)

FIND_PATH(ZIP_INCLUDE_DIR zip.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
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
