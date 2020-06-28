cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    emptyTagTest
    LANGUAGES
        NONE
)

include(${CNPM_SOURCE_ROOT}/Include.cmake)

CNPM_ADD_PACKAGE(
    NAME
        Qt
    VERSION
        5.9.0
    ARCHITECTURE
        amd64
)

set(
    CNPM_ROOT
    "${CMAKE_SOURCE_DIR}"
)

set(
    CNPM_ONLY
    1
)

CNPM_PREPARE_PACKAGES()

