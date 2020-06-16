cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    interruptDownloading
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

add_test(
    NAME
        interruptDownloading
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
        ${PROJECT_BINARY_DIR}
)

set_tests_properties(
    interruptDownloading

    PROPERTIES

    SKIP_RETURN_CODE
    254
)

