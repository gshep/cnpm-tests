cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    test
    LANGUAGES
        NONE
)

include(${CNPM_SOURCE_ROOT}/Include.cmake)

CNPM_ADD_PACKAGE(
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
    CNPM_ROOT
    "${PROJECT_BINARY_DIR}/3rd_party"
)

set(
    CNPM_ONLY
    1
)

CNPM_PREPARE_PACKAGES()

