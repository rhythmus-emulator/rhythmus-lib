# Should work well only in MSVC

if (UNIX)
    find_package(OpenSSL ONLY_CMAKE_FIND_ROOT_PATH)
    return ()
endif ()

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

FIND_PATH(OPENSSL_INCLUDE_DIR openssl/opensslv.h
    HINTS
    ${CMAKE_SOURCE_DIR}/../rparser-lib/include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(OPENSSL_SSL_LIBRARY
    NAMES libsslMD sslMD libssl ssl
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

FIND_LIBRARY(OPENSSL_CRYPTO_LIBRARY
    NAMES libcryptoMD cryptoMD libcrypto crypto
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

set(OPENSSL_LIBRARY ${OPENSSL_SSL_LIBRARY} ${OPENSSL_CRYPTO_LIBRARY} )

#mark_as_advanced(OPENSSL_INCLUDE_DIR OPENSSL_LIBRARY)

SET(OPENSSL_FOUND "NO")
IF(OPENSSL_LIBRARY AND OPENSSL_INCLUDE_DIR)
    SET(OPENSSL_FOUND "YES")
ENDIF(OPENSSL_LIBRARY AND OPENSSL_INCLUDE_DIR)
