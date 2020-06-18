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

include(${PROJECT_SOURCE_DIR}/env.cmake)

set(
    NPM_ROOT
    "${PROJECT_SOURCE_DIR}/3rd_party"
)

set(
    NPM_ONLY
    1
)

NPM_PREPARE_PACKAGES()

