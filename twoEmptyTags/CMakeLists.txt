cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    twoEmptyTagsTest
    LANGUAGES
        NONE
)

file(
    MAKE_DIRECTORY
    "${PROJECT_BINARY_DIR}/test"
)

add_test(
    NAME
        twoEmptyTags
    COMMAND
        "${CMAKE_COMMAND}"
        -G
        ${CMAKE_GENERATOR}
        "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
        "-DCNPM_SOURCE_ROOT=${PROJECT_SOURCE_DIR}/../cnpm"
        "${PROJECT_SOURCE_DIR}/test"
    WORKING_DIRECTORY
        "${PROJECT_BINARY_DIR}/test"
)
