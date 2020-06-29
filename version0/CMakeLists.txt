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
        package
    VERSION
        0
    ARCHITECTURE
        AnyCPU
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

