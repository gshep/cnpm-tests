# prepare data for test with package that has wrong checksum
file(
    REMOVE_RECURSE
    ${PROJECT_BINARY_DIR}/corruptedLocalPackages_checksum
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/corruptedLocalPackages_checksum
)

file(
    COPY
        ${PROJECT_SOURCE_DIR}/corruptedLocalPackages/checksum/msvs-2019-amd64-1.7z
    DESTINATION
        ${PROJECT_BINARY_DIR}/corruptedLocalPackages_checksum/3rd_party
)

execute_process(
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${CNPM_SOURCE_ROOT}
        ${PROJECT_SOURCE_DIR}/corruptedLocalPackages/checksum
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/corruptedLocalPackages_checksum
    RESULT_VARIABLE
        EXTRACTING_STATUS
)

if(EXISTS ${PROJECT_BINARY_DIR}/corruptedLocalPackages_checksum/3rd_party/msvs-2019-amd64-1.7z)
    message(
        FATAL_ERROR
        "Package file wasn't deleted"
    )
endif()

if(EXTRACTING_STATUS EQUAL 0)
    message(
        FATAL_ERROR
        "CMake didn't failed"
    )
endif()

file(
    REMOVE_RECURSE
    ${PROJECT_BINARY_DIR}/corruptedLocalPackages_partially
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/corruptedLocalPackages_partially
)

file(
    COPY
        ${PROJECT_SOURCE_DIR}/corruptedLocalPackages/partially/boost-1.72.0-amd64-0sdk18362_vsbt19.7z
    DESTINATION
        ${PROJECT_BINARY_DIR}/corruptedLocalPackages_partially/3rd_party
)

execute_process(
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${CNPM_SOURCE_ROOT}
        ${PROJECT_SOURCE_DIR}/corruptedLocalPackages/partially
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/corruptedLocalPackages_partially
    RESULT_VARIABLE
        EXTRACTING_STATUS
)

if(EXISTS ${PROJECT_BINARY_DIR}/corruptedLocalPackages_partially/3rd_party/boost-1.72.0-amd64-0sdk18362_vsbt19.7z)
    message(
        FATAL_ERROR
        "Package file wasn't deleted"
    )
endif()

if(EXTRACTING_STATUS EQUAL 0)
    message(
        FATAL_ERROR
        "CMake didn't failed"
    )
endif()

