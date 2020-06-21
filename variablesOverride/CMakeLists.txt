cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    test
    LANGUAGES
        NONE
)

string(
    TIMESTAMP
    RANDOM_VALUE
    "%s"
)

string(
    RANDOM
    RANDOM_SEED
    ${RANDOM_VALUE}
    RANDOM_VALUE
)

set(
    P
    "${RANDOM_VALUE}"
)

set(
    oneValueArgs
    "${RANDOM_VALUE}"
)

set(
    multiValueArgs
    "${RANDOM_VALUE}"
)

set(
    REPOSITORY_URLS
    "${RANDOM_VALUE}"
)

set(
    FORCE
    "${RANDOM_VALUE}"
)

set(
    ROOT
    "${RANDOM_VALUE}"
)

set(
    TIMESTAMP
    "${RANDOM_VALUE}"
)

set(
    ONLY
    "${RANDOM_VALUE}"
)

set(
    INDEX
    "${RANDOM_VALUE}"
)

set(
    NAME
    "${RANDOM_VALUE}"
)

set(
    VERSION
    "${RANDOM_VALUE}"
)

set(
    ARCHITECTURE
    "${RANDOM_VALUE}"
)

set(
    BUILD
    "${RANDOM_VALUE}"
)

set(
    TAG
    "${RANDOM_VALUE}"
)

set(
    TAGS_COUNT
    "${RANDOM_VALUE}"
)

set(
    PACKAGE_NAME
    "${RANDOM_VALUE}"
)

unset(RANDOM_VALUE)

get_directory_property(
    BEFORE_VARIABLES
    VARIABLES
)

foreach(VARNAME ${BEFORE_VARIABLES})
    set(
        CNPM_test_variablesOverride_${VARNAME}
        "${${VARNAME}}"
    )
endforeach()

unset(VARNAME)

message(STATUS "=====================")
message(STATUS "VARIABLES = ${BEFORE_VARIABLES}")
message(STATUS "=====================")

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

NPM_PREPARE_PACKAGES()

get_directory_property(
    AFTER_VARIABLES
    VARIABLES
)

message(STATUS "=====================")
message(STATUS "VARIABLES = ${AFTER_VARIABLES}")
message(STATUS "=====================")

# test
foreach(VARNAME ${BEFORE_VARIABLES})
    if(NOT VARNAME IN_LIST AFTER_VARIABLES)
        message(
            FATAL_ERROR
            "'${VARNAME}' removed."
            " Old value = '${CNPM_test_variablesOverride_${VARNAME}}'."
        )
    endif()

    if(NOT "${${VARNAME}}" STREQUAL "${CNPM_test_variablesOverride_${VARNAME}}")
        message(
            FATAL_ERROR
            "'${VARNAME}' overriden. Current value = '${${VARNAME}}'."
            " Old value = '${CNPM_test_variablesOverride_${VARNAME}}'."
        )
    endif()
endforeach()

