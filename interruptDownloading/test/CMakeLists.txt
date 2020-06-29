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

include(${PROJECT_SOURCE_DIR}/packageInfo.cmake)

CNPM_ADD_PACKAGE(
    NAME
        ${PACKAGE_NAME}
    VERSION
        ${PACKAGE_VERSION}
    ARCHITECTURE
        ${PACKAGE_ARCHITECTURE}
    BUILD_NUMBER
        ${PACKAGE_BUILD_NUMBER}
    TAG
        "${PACKAGE_TAG}"
)

set(
    CNPM_ONLY
    1
)

CNPM_PREPARE_PACKAGES(
    DEFAULT_REPOSITORY_URLS

    "file:///${PROJECT_SOURCE_DIR}"
)

