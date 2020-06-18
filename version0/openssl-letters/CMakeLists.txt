cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    test
    LANGUAGES
        NONE
)

include(${CNPM_SOURCE_ROOT}/NastyPackageManager.cmake)

NPM_ADD_PACKAGE(
    NAME
        OpenSSL
    VERSION
        1.1.1g
    ARCHITECTURE
        amd64
    BUILD_NUMBER
        3
)

set(
    NPM_ROOT
    "${PROJECT_SOURCE_DIR}"
)

set(
    NPM_ONLY
    1
)

NPM_PREPARE_PACKAGES()

