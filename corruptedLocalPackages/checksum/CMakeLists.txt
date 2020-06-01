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
        msvs
    VERSION
        2019
    ARCHITECTURE
        amd64
    BUILD_NUMBER
        1
)

set(
    NPM_ROOT
    "${PROJECT_BINARY_DIR}/3rd_party"
)

set(
    NPM_ONLY
    1
)

NPM_PREPARE_PACKAGES()

