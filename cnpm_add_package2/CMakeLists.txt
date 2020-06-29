cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    test
    LANGUAGES
        NONE
)

#[[ 

All this code is copied from original NPM_ADD_PACKAGE.
The checking for duplicates was removed to allow generation
of a big list with all packages.

]]
# yes, all info is stored in global vars...
set(
    NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_NAMES
    ""
)

set(
    NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_VERSIONS
    ""
)

set(
    NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_ARCHITECTURES
    ""
)

set(
    NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_NUMBERS
    ""
)

set(
    NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_TAGS
    ""
)

function(CNPM_ADD_PACKAGE)
    set(
        oneValueArgs
        NAME VERSION ARCHITECTURE BUILD_NUMBER TAG
    )

    cmake_parse_arguments(
        NPM_ARGS
        ""
        "${oneValueArgs}"
        ""
        ${ARGN}
    )

    if(NOT NPM_ARGS_NAME)
        message(
            FATAL_ERROR
            "CNPM_ADD_PACKAGE: NAME is the required argument."
        )
    endif()

    if(NOT NPM_ARGS_VERSION MATCHES "^[0-9]+(\.[0-9]+)*$")
        message(
            FATAL_ERROR
            "CNPM_ADD_PACKAGE: VERSION is the required argument. (NAME = '${NPM_ARGS_NAME}')"
            " Current value - '${NPM_ARGS_VERSION}' - does not conform to the version format."
        )
    endif()

    string(
        TOLOWER
            "${NPM_ARGS_NAME}"
            LOWERED_PACKAGE_NAME
    )

    if(NPM_ARGS_UNPARSED_ARGUMENTS)
        message(
            FATAL_ERROR
            "NPM_ADD_PACKAGE: there are redundant arguments: '${NPM_ARGS_UNPARSED_ARGUMENTS}'."
        )
    endif()

    if(NPM_ARGS_ARCHITECTURE)
        set(
            ARCH
            "${NPM_ARGS_ARCHITECTURE}"
        )
    else()
        set(
            ARCH
            "x86"
        )

        if(${CMAKE_SIZEOF_VOID_P} EQUAL 8)
            set(
                ARCH
                "amd64"
            )
        endif()
    endif()

    set(
        BUILD
        0
    )
    if(NPM_ARGS_BUILD_NUMBER)
        set(
            BUILD
            "${NPM_ARGS_BUILD_NUMBER}"
        )
    endif()

    set(
        TAG
        ""
    )
    if(NPM_ARGS_TAG)
        set(
            TAG
            "${NPM_ARGS_TAG}"
        )
    endif()

    set(
        COUNT
        0
    )
    if(DEFINED NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_COUNT)
        set(
            COUNT
            ${NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_COUNT}
        )
    endif()

    if(COUNT GREATER 0)
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_NAMES
            "${NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_NAMES};${LOWERED_PACKAGE_NAME}"
            PARENT_SCOPE
        )
    else()
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_NAMES
            "${LOWERED_PACKAGE_NAME}"
            PARENT_SCOPE
        )
    endif()

    if(COUNT GREATER 0)
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_VERSIONS
            "${NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_VERSIONS};${NPM_ARGS_VERSION}"
            PARENT_SCOPE
        )
    else()
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_VERSIONS
            "${NPM_ARGS_VERSION}"
            PARENT_SCOPE
        )
    endif()

    if(COUNT GREATER 0)
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_ARCHITECTURES
            "${NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_ARCHITECTURES};${ARCH}"
            PARENT_SCOPE
        )
    else()
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_ARCHITECTURES
            "${ARCH}"
            PARENT_SCOPE
        )
    endif()

    if(COUNT GREATER 0)
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_NUMBERS
            "${NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_NUMBERS};${BUILD}"
            PARENT_SCOPE
        )
    else()
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_NUMBERS
            "${BUILD}"
            PARENT_SCOPE
        )
    endif()

    if(COUNT GREATER 0)
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_TAGS
            "${NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_TAGS};${TAG}"
            PARENT_SCOPE
        )
    else()
        set(
            NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_TAGS
            "${TAG}"
            PARENT_SCOPE
        )
    endif()

    math(
        EXPR
            COUNT
            "${COUNT} + 1"
    )
    set(
        NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C_COUNT
        ${COUNT}
        PARENT_SCOPE
    )
endfunction()

function(
    test

    COMPONENT_NAME
    DISTORTED_COMPONENT_NAME
    FILEPATH
)
    message(
        STATUS
        "ARGV = ${ARGV}"
    )

    execute_process(
        COMMAND
            ${CMAKE_COMMAND}
            -DSHOW_ARGUMENT=${DISTORTED_COMPONENT_NAME}
            -DFILEPATH=${FILEPATH}
            -P ${CNPM_SOURCE_ROOT}/show_package_component.cmake
        WORKING_DIRECTORY
            ${PROJECT_SOURCE_DIR}
        RESULT_VARIABLE
            STATUS
        OUTPUT_VARIABLE
            OUTPUT
    )

    if(NOT STATUS EQUAL 0)
        message(
            FATAL_ERROR
            "Failed to run the script."
        )
    endif()

    message(
        STATUS
        "OUTPUT = '${OUTPUT}'."
        " ${COMPONENT_NAME} = '${${COMPONENT_NAME}}'."
    )

    if(NOT OUTPUT STREQUAL ${COMPONENT_NAME})
        message(
            FATAL_ERROR
            "Values don't match."
        )
    endif()
endfunction()

include(${PROJECT_SOURCE_DIR}/../version0/wellKnownLinux/env.cmake)
include(${PROJECT_SOURCE_DIR}/../version0/wellKnownWindows/env.cmake)

# at this point we have all packages info in global vars
set(
    P
    NPM_4D2BB0BB_9AFC_4A44_B81A_8F025831AC8C
)

message(
    STATUS
    "COUNT = ${${P}_COUNT}"
)

math(
    EXPR
        LAST_INDEX
        "${${P}_COUNT} - 1"
)

foreach(I RANGE ${LAST_INDEX})
    message(
        STATUS
        "I = ${I}"
    )

    # retrieve all components of the current package
    list(
        GET
            ${P}_NAMES
            ${I}
            NAME
    )

    list(
        GET
            ${P}_VERSIONS
            ${I}
            VERSION
    )

    list(
        GET
            ${P}_ARCHITECTURES
            ${I}
            ARCHITECTURE
    )

    list(
        GET
            ${P}_NUMBERS
            ${I}
            BUILD_NUMBER
    )

    list(
        GET
            ${P}_TAGS
            ${I}
            TAG
    )

    # generate file with the single NPM_ADD_PACKAGE call
    configure_file(
        ${PROJECT_SOURCE_DIR}/template__package.cmake
        ${PROJECT_BINARY_DIR}/package.cmake
        @ONLY
    )

    # get & test component value
    test(
        NAME
        Name
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    file(
        RELATIVE_PATH
        FILEPATH
        ${CNPM_SOURCE_ROOT}
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    test(
        NAME
        Name
        ${FILEPATH}
    )

    # VERSION
    test(
        VERSION
        VeRsiON
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    file(
        RELATIVE_PATH
        FILEPATH
        ${CNPM_SOURCE_ROOT}
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    test(
        VERSION
        vERSIOn
        ${FILEPATH}
    )

    # ARCHITECTURE
    test(
        ARCHITECTURE
        ARCHITECTURE
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    file(
        RELATIVE_PATH
        FILEPATH
        ${CNPM_SOURCE_ROOT}
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    test(
        ARCHITECTURE
        architecture
        ${FILEPATH}
    )

    # BUILD_NUMBER
    test(
        BUILD_NUMBER
        BuilD_nuMBeR
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    file(
        RELATIVE_PATH
        FILEPATH
        ${CNPM_SOURCE_ROOT}
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    test(
        BUILD_NUMBER
        BUILD_NUMBER
        ${FILEPATH}
    )

    # TAG
    test(
        TAG
        TAG
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    file(
        RELATIVE_PATH
        FILEPATH
        ${CNPM_SOURCE_ROOT}
        ${PROJECT_BINARY_DIR}/package.cmake
    )

    test(
        TAG
        TAg
        ${FILEPATH}
    )
endforeach()

