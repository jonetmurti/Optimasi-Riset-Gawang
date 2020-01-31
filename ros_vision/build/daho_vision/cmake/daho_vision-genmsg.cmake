# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "daho_vision: 3 messages, 1 services")

set(MSG_I_FLAGS "-Idaho_vision:/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(daho_vision_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg" NAME_WE)
add_custom_target(_daho_vision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "daho_vision" "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg" ""
)

get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv" NAME_WE)
add_custom_target(_daho_vision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "daho_vision" "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv" ""
)

get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg" NAME_WE)
add_custom_target(_daho_vision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "daho_vision" "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg" ""
)

get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg" NAME_WE)
add_custom_target(_daho_vision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "daho_vision" "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/daho_vision
)
_generate_msg_cpp(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/daho_vision
)
_generate_msg_cpp(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/daho_vision
)

### Generating Services
_generate_srv_cpp(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/daho_vision
)

### Generating Module File
_generate_module_cpp(daho_vision
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/daho_vision
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(daho_vision_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(daho_vision_generate_messages daho_vision_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_cpp _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv" NAME_WE)
add_dependencies(daho_vision_generate_messages_cpp _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_cpp _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_cpp _daho_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(daho_vision_gencpp)
add_dependencies(daho_vision_gencpp daho_vision_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS daho_vision_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/daho_vision
)
_generate_msg_eus(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/daho_vision
)
_generate_msg_eus(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/daho_vision
)

### Generating Services
_generate_srv_eus(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/daho_vision
)

### Generating Module File
_generate_module_eus(daho_vision
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/daho_vision
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(daho_vision_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(daho_vision_generate_messages daho_vision_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_eus _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv" NAME_WE)
add_dependencies(daho_vision_generate_messages_eus _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_eus _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_eus _daho_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(daho_vision_geneus)
add_dependencies(daho_vision_geneus daho_vision_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS daho_vision_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/daho_vision
)
_generate_msg_lisp(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/daho_vision
)
_generate_msg_lisp(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/daho_vision
)

### Generating Services
_generate_srv_lisp(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/daho_vision
)

### Generating Module File
_generate_module_lisp(daho_vision
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/daho_vision
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(daho_vision_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(daho_vision_generate_messages daho_vision_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_lisp _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv" NAME_WE)
add_dependencies(daho_vision_generate_messages_lisp _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_lisp _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_lisp _daho_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(daho_vision_genlisp)
add_dependencies(daho_vision_genlisp daho_vision_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS daho_vision_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/daho_vision
)
_generate_msg_nodejs(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/daho_vision
)
_generate_msg_nodejs(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/daho_vision
)

### Generating Services
_generate_srv_nodejs(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/daho_vision
)

### Generating Module File
_generate_module_nodejs(daho_vision
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/daho_vision
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(daho_vision_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(daho_vision_generate_messages daho_vision_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_nodejs _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv" NAME_WE)
add_dependencies(daho_vision_generate_messages_nodejs _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_nodejs _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_nodejs _daho_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(daho_vision_gennodejs)
add_dependencies(daho_vision_gennodejs daho_vision_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS daho_vision_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/daho_vision
)
_generate_msg_py(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/daho_vision
)
_generate_msg_py(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/daho_vision
)

### Generating Services
_generate_srv_py(daho_vision
  "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/daho_vision
)

### Generating Module File
_generate_module_py(daho_vision
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/daho_vision
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(daho_vision_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(daho_vision_generate_messages daho_vision_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/xGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_py _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/srv/ContourPMF.srv" NAME_WE)
add_dependencies(daho_vision_generate_messages_py _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/PosisiBola.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_py _daho_vision_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jonet/Documents/Project/ros_vision/src/daho_vision/msg/arrOfxGawang.msg" NAME_WE)
add_dependencies(daho_vision_generate_messages_py _daho_vision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(daho_vision_genpy)
add_dependencies(daho_vision_genpy daho_vision_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS daho_vision_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/daho_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/daho_vision
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(daho_vision_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(daho_vision_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/daho_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/daho_vision
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(daho_vision_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(daho_vision_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/daho_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/daho_vision
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(daho_vision_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(daho_vision_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/daho_vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/daho_vision
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(daho_vision_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(daho_vision_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/daho_vision)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/daho_vision\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/daho_vision
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(daho_vision_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(daho_vision_generate_messages_py sensor_msgs_generate_messages_py)
endif()
