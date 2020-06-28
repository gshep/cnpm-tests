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
        Qt
    VERSION
        5.9.0
    ARCHITECTURE
        amd64
)

CNPM_ADD_PACKAGE(
    NAME
        Manual
    VERSION
        1.0
    ARCHITECTURE
        AnyArch
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

