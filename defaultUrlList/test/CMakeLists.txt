cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    test
    LANGUAGES
        NONE
)

include("${CNPM_SOURCE_ROOT}/Include.cmake")

CNPM_ADD_PACKAGE(
    NAME
        Qt
    VERSION
        5.9.6
    ARCHITECTURE
        amd64
    BUILD_NUMBER
        4
)

CNPM_ADD_PACKAGE(
    NAME
        Manual
    VERSION
        1.0
    ARCHITECTURE
        AnyArch
)

CNPM_ADD_PACKAGE(
    NAME
        GTest
    VERSION
        1.8.0
    ARCHITECTURE
        x86
    BUILD_NUMBER
        3
    TAG
        "sdk14393_vs2015up3"
)

CNPM_ADD_PACKAGE(
    NAME
        zlib
    VERSION
        1.2.8
    ARCHITECTURE
        amd64
    BUILD_NUMBER
        1
    TAG
        "sdk14393_vs2015up3"
)

set(
    CNPM_ONLY
    1
)

set(
    CNPM_ROOT
    ${PROJECT_BINARY_DIR}/cnpm
)

# URLs may be specified on a separate lines/separated by space-symbols or
# as a list or even combined
CNPM_PREPARE_PACKAGES(
    DEFAULT_REPOSITORY_URLS
        "file:///${PROJECT_SOURCE_DIR};file:///${PROJECT_SOURCE_DIR}/3repository"
        "file:///${PROJECT_SOURCE_DIR}/private_repository"
        #"file:///${PROJECT_SOURCE_DIR};file:///${PROJECT_SOURCE_DIR}/3repository;file:///${PROJECT_SOURCE_DIR}/private_repository"
)

