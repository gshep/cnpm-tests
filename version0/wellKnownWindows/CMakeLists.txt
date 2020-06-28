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

include(${PROJECT_SOURCE_DIR}/env.cmake)

set(
    CNPM_ROOT
    "${PROJECT_SOURCE_DIR}/3rd_party"
)

set(
    CNPM_ONLY
    1
)

CNPM_PREPARE_PACKAGES()

