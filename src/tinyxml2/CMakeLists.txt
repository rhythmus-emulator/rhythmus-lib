project(tinyxml2)

set (TINYXML2_SOURCES
    tinyxml2.cpp
    )

set (TINYXML2_HEADERS
    tinyxml2.h
    )

include_directories(
    )

add_library(tinyxml2 ${TINYXML2_SOURCES} ${TINYXML2_HEADERS})