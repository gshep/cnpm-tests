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
        OpenSSL
    VERSION
        1.1.1g
    ARCHITECTURE
        amd64
    BUILD_NUMBER
        3
)

set(
    CNPM_ROOT
    "${PROJECT_SOURCE_DIR}"
)

set(
    CNPM_ONLY
    1
)

CNPM_PREPARE_PACKAGES()

