# Download and unpack tesseract at configure time
configure_file(${CMAKE_CURRENT_LIST_DIR}/tesseract.in ${CMAKE_CURRENT_BINARY_DIR}/tesseract-download/CMakeLists.txt)

find_program(CPPAN_COMMAND cppan.exe)

execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/tesseract-download
    )

execute_process(COMMAND ${CMAKE_COMMAND} --build .  
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/tesseract-download 
    )

execute_process(COMMAND ${CPPAN_COMMAND} . --generate
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/tesseract-src
)

add_subdirectory(${CMAKE_CURRENT_BINARY_DIR}/tesseract-src ${CMAKE_CURRENT_BINARY_DIR}/tesseract-build)
