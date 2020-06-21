cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    interruptExtracting
    LANGUAGES
        NONE
)

find_program(
    Dart
    dart
)

message(STATUS "Dart = ${Dart}")

if(Dart STREQUAL "Dart-NOTFOUND")
    message(
        STATUS
        "Dart is not found. Test skipped."
    )
    return()
endif()

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/test
)

add_test(
    NAME
        interruptExtracting
    COMMAND
        ${Dart}
        --enable-asserts
        ${PROJECT_SOURCE_DIR}/test.dart
        "${CMAKE_COMMAND}"
        "${CMAKE_GENERATOR}"
        "${CMAKE_BUILD_TYPE}"
        "${CMAKE_SOURCE_DIR}/cnpm"
        "${PROJECT_SOURCE_DIR}/test"
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/test
)

set_tests_properties(
    interruptExtracting

    PROPERTIES

    SKIP_RETURN_CODE
    254
)

