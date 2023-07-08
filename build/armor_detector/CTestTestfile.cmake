# CMake generated Testfile for 
# Source directory: /home/dan/MA/CJ/src/rm_auto_aim/armor_detector
# Build directory: /home/dan/MA/CJ/build/armor_detector
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_node_startup "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/test_node_startup.gtest.xml" "--package-name" "armor_detector" "--output-file" "/home/dan/MA/CJ/build/armor_detector/ament_cmake_gtest/test_node_startup.txt" "--command" "/home/dan/MA/CJ/build/armor_detector/test_node_startup" "--gtest_output=xml:/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/test_node_startup.gtest.xml")
set_tests_properties(test_node_startup PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/dan/MA/CJ/build/armor_detector/test_node_startup" TIMEOUT "60" WORKING_DIRECTORY "/home/dan/MA/CJ/build/armor_detector" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;53;ament_add_gtest;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;0;")
add_test(test_number_cls "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/test_number_cls.gtest.xml" "--package-name" "armor_detector" "--output-file" "/home/dan/MA/CJ/build/armor_detector/ament_cmake_gtest/test_number_cls.txt" "--command" "/home/dan/MA/CJ/build/armor_detector/test_number_cls" "--gtest_output=xml:/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/test_number_cls.gtest.xml")
set_tests_properties(test_number_cls PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/dan/MA/CJ/build/armor_detector/test_number_cls" TIMEOUT "60" WORKING_DIRECTORY "/home/dan/MA/CJ/build/armor_detector" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;56;ament_add_gtest;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;0;")
add_test(cppcheck "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/cppcheck.xunit.xml" "--package-name" "armor_detector" "--output-file" "/home/dan/MA/CJ/build/armor_detector/ament_cppcheck/cppcheck.txt" "--command" "/opt/ros/humble/bin/ament_cppcheck" "--xunit-file" "/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/cppcheck.xunit.xml" "--include_dirs" "/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/include")
set_tests_properties(cppcheck PROPERTIES  LABELS "cppcheck;linter" TIMEOUT "300" WORKING_DIRECTORY "/home/dan/MA/CJ/src/rm_auto_aim/armor_detector" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_cppcheck/cmake/ament_cppcheck.cmake;66;ament_add_test;/opt/ros/humble/share/ament_cmake_cppcheck/cmake/ament_cmake_cppcheck_lint_hook.cmake;83;ament_cppcheck;/opt/ros/humble/share/ament_cmake_cppcheck/cmake/ament_cmake_cppcheck_lint_hook.cmake;0;;/opt/ros/humble/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;21;ament_execute_extensions;/opt/ros/humble/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;0;;/opt/ros/humble/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/share/ament_cmake_core/cmake/core/ament_package.cmake;66;ament_execute_extensions;/opt/ros/humble/share/ament_cmake_auto/cmake/ament_auto_package.cmake;102;ament_package;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;65;ament_auto_package;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;0;")
add_test(lint_cmake "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/lint_cmake.xunit.xml" "--package-name" "armor_detector" "--output-file" "/home/dan/MA/CJ/build/armor_detector/ament_lint_cmake/lint_cmake.txt" "--command" "/opt/ros/humble/bin/ament_lint_cmake" "--xunit-file" "/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/lint_cmake.xunit.xml")
set_tests_properties(lint_cmake PROPERTIES  LABELS "lint_cmake;linter" TIMEOUT "60" WORKING_DIRECTORY "/home/dan/MA/CJ/src/rm_auto_aim/armor_detector" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_lint_cmake/cmake/ament_lint_cmake.cmake;47;ament_add_test;/opt/ros/humble/share/ament_cmake_lint_cmake/cmake/ament_cmake_lint_cmake_lint_hook.cmake;21;ament_lint_cmake;/opt/ros/humble/share/ament_cmake_lint_cmake/cmake/ament_cmake_lint_cmake_lint_hook.cmake;0;;/opt/ros/humble/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;21;ament_execute_extensions;/opt/ros/humble/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;0;;/opt/ros/humble/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/share/ament_cmake_core/cmake/core/ament_package.cmake;66;ament_execute_extensions;/opt/ros/humble/share/ament_cmake_auto/cmake/ament_auto_package.cmake;102;ament_package;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;65;ament_auto_package;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;0;")
add_test(xmllint "/usr/bin/python3.10" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/xmllint.xunit.xml" "--package-name" "armor_detector" "--output-file" "/home/dan/MA/CJ/build/armor_detector/ament_xmllint/xmllint.txt" "--command" "/opt/ros/humble/bin/ament_xmllint" "--xunit-file" "/home/dan/MA/CJ/build/armor_detector/test_results/armor_detector/xmllint.xunit.xml")
set_tests_properties(xmllint PROPERTIES  LABELS "xmllint;linter" TIMEOUT "60" WORKING_DIRECTORY "/home/dan/MA/CJ/src/rm_auto_aim/armor_detector" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_xmllint/cmake/ament_xmllint.cmake;50;ament_add_test;/opt/ros/humble/share/ament_cmake_xmllint/cmake/ament_cmake_xmllint_lint_hook.cmake;18;ament_xmllint;/opt/ros/humble/share/ament_cmake_xmllint/cmake/ament_cmake_xmllint_lint_hook.cmake;0;;/opt/ros/humble/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;21;ament_execute_extensions;/opt/ros/humble/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;0;;/opt/ros/humble/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/share/ament_cmake_core/cmake/core/ament_package.cmake;66;ament_execute_extensions;/opt/ros/humble/share/ament_cmake_auto/cmake/ament_auto_package.cmake;102;ament_package;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;65;ament_auto_package;/home/dan/MA/CJ/src/rm_auto_aim/armor_detector/CMakeLists.txt;0;")
subdirs("gtest")
