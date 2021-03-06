cmake_minimum_required(
    VERSION
    3.9.6
)

project(
    cnpm_tests
    LANGUAGES
        NONE
)

enable_testing()

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/emptyTag
)

add_test(
    NAME
        emptyTag
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/cnpm/tests/emptyTag/test
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/emptyTag
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/twoEmptyTags
)

add_test(
    NAME
        twoEmptyTags
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/cnpm/tests/twoEmptyTags/test
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/twoEmptyTags
)

# this will fail because its CMakeLists doesn't
# specify no languages in its project command. Won't be fixed:
# just specify non-Studio generator
file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/defaultUrlList
)

add_test(
    NAME
        defaultUrlList
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/cnpm/tests/defaultUrlList/test
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/defaultUrlList
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/severalAddPackage
)

add_test(
    NAME
        severalAddPackage
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/cnpm/tests/severalAddPackage
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/severalAddPackage
)

add_test(
    NAME
        corruptedLocalPackages
    COMMAND
        ${CMAKE_COMMAND}
        -DPROJECT_BINARY_DIR=${PROJECT_BINARY_DIR}
        -DPROJECT_SOURCE_DIR=${PROJECT_SOURCE_DIR}
        -DCMAKE_GENERATOR=${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        -P
        ${PROJECT_SOURCE_DIR}/corruptedLocalPackages/test.cmake
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/version0
)

add_test(
    NAME
        version0
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/version0
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/version0
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/version0/linux
)

add_test(
    NAME
        version0wellKnownLinux
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/version0/wellKnownLinux
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/version0/linux
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/version0/windows
)

add_test(
    NAME
        version0wellKnownWindows
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/version0/wellKnownWindows
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/version0/windows
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/version0/jpegLetters
)

add_test(
    NAME
        version0jpegLetters
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/version0/jpeg-letters
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/version0/jpegLetters
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/version0/opensslLetters
)

add_test(
    NAME
        version0opensslLetters
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/version0/openssl-letters
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/version0/opensslLetters
)

set_tests_properties(
    version0jpegLetters
    version0opensslLetters

    PROPERTIES

    WILL_FAIL
    1
)

add_subdirectory(interruptDownloading)
add_subdirectory(interruptExtracting)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/variablesOverride
)

add_test(
    NAME
        variablesOverride
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${PROJECT_SOURCE_DIR}/cnpm
        ${PROJECT_SOURCE_DIR}/variablesOverride
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/variablesOverride
)


