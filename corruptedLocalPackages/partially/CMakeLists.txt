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
        boost
    VERSION
        1.72.0
    ARCHITECTURE
        amd64
    BUILD_NUMBER
        0
    TAG
        "sdk18362_vsbt19"
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

