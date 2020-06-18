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
        package
    VERSION
        0
    ARCHITECTURE
        AnyCPU
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

