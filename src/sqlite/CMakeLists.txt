project(sqlite)

set (SQLITE_SOURCES
    sqlite3.c
    )

set (SQLITE_HEADERS
    sqlite3.h
    )

include_directories(
    )

add_library(sqlite ${SQLITE_SOURCES} ${SQLITE_HEADERS})