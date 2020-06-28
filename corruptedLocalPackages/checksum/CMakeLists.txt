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
        msvs
    VERSION
        2019
    ARCHITECTURE
        amd64
    BUILD_NUMBER
        1
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

