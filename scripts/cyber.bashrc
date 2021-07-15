#!/usr/bin/env bash

###############################################################################
# Copyright 2020 The Apollo Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

CYBER_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
CYBER_IN_DOCKER=false

# If inside docker container
if [ -f /.dockerenv ]; then
  CYBER_IN_DOCKER=true
  CYBER_ROOT_DIR="/cyber"
fi

export CYBER_ROOT_DIR="${CYBER_ROOT_DIR}"
export CYBER_IN_DOCKER="${CYBER_IN_DOCKER}"

export TAB="    " # 4 spaces

source ${CYBER_ROOT_DIR}/scripts/common.bashrc

: ${VERBOSE:=yes}

BOLD='\033[1m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[32m'
WHITE='\033[34m'
YELLOW='\033[33m'
NO_COLOR='\033[0m'

function info() {
  (echo >&2 -e "[${WHITE}${BOLD}INFO${NO_COLOR}] $*")
}

function error() {
  (echo >&2 -e "[${RED}ERROR${NO_COLOR}] $*")
}

function warning() {
  (echo >&2 -e "${YELLOW}[WARNING] $*${NO_COLOR}")
}

function ok() {
  (echo >&2 -e "[${GREEN}${BOLD} OK ${NO_COLOR}] $*")
}

function print_delim() {
  echo "=============================================="
}

function get_now() {
  date +%s
}

function time_elapsed_s() {
  local start="${1:-$(get_now)}"
  local end="$(get_now)"
  echo "$end - $start" | bc -l
}

function success() {
  print_delim
  ok "$1"
  print_delim
}

function fail() {
  print_delim
  error "$1"
  print_delim
  exit 1
}

function determine_gpu_use_target() {
  local arch="$(uname -m)"
  local use_gpu=0

  if [[ "${arch}" == "aarch64" ]]; then
    if lsmod | grep -q nvgpu; then
      if ldconfig -p | grep -q cudart; then
        use_gpu=1
      fi
    fi
  else ## x86_64 mode
    # Check the existence of nvidia-smi
    if [[ ! -x "$(command -v nvidia-smi)" ]]; then
      warning "nvidia-smi not found. CPU will be used."
    elif [[ -z "$(nvidia-smi)" ]]; then
      warning "No GPU device found. CPU will be used."
    else
      use_gpu=1
    fi
  fi
  export USE_GPU_TARGET="${use_gpu}"
}

function file_ext() {
  local filename="$(basename $1)"
  local actual_ext="${filename##*.}"
  if [[ "${actual_ext}" == "${filename}" ]]; then
    actual_ext=""
  fi
  echo "${actual_ext}"
}

function c_family_ext() {
  local actual_ext
  actual_ext="$(file_ext $1)"
  for ext in "h" "hh" "hxx" "hpp" "cxx" "cc" "cpp" "cu"; do
    if [[ "${ext}" == "${actual_ext}" ]]; then
      return 0
    fi
  done
  return 1
}

function find_c_cpp_srcs() {
  find "$@" -type f -name "*.h" \
    -o -name "*.c" \
    -o -name "*.hpp" \
    -o -name "*.cpp" \
    -o -name "*.hh" \
    -o -name "*.cc" \
    -o -name "*.hxx" \
    -o -name "*.cxx" \
    -o -name "*.cu"
}

function proto_ext() {
  if [[ "$(file_ext $1)" == "proto" ]]; then
    return 0
  else
    return 1
  fi
}

function find_proto_srcs() {
  find "$@" -type f -name "*.proto"
}

function py_ext() {
  if [[ "$(file_ext $1)" == "py" ]]; then
    return 0
  else
    return 1
  fi
}

function find_py_srcs() {
  find "$@" -type f -name "*.py"
}

function bash_ext() {
  local actual_ext
  actual_ext="$(file_ext $1)"
  for ext in "sh" "bash" "bashrc"; do
    if [[ "${ext}" == "${actual_ext}" ]]; then
      return 0
    fi
  done
  return 1
}

function bazel_extended() {
  local actual_ext="$(file_ext $1)"
  if [[ -z "${actual_ext}" ]]; then
    if [[ "${arg}" == "BUILD" || "${arg}" == "WORKSPACE" ]]; then
      return 0
    else
      return 1
    fi
  else
    for ext in "BUILD" "bazel" "bzl"; do
      if [[ "${ext}" == "${actual_ext}" ]]; then
        return 0
      fi
    done
    return 1
  fi
}

function prettier_ext() {
  local actual_ext
  actual_ext="$(file_ext $1)"
  for ext in "md" "json" "yml"; do
    if [[ "${ext}" == "${actual_ext}" ]]; then
      return 0
    fi
  done
  return 1
}

function find_prettier_srcs() {
  find "$@" -type f -name "*.md" \
    -or -name "*.json" \
    -or -name "*.yml"
}

# Exits the script if the command fails.
function run() {
  if [ "${VERBOSE}" = yes ]; then
    echo "${@}"
    "${@}" || exit $?
  else
    local errfile="${CYBER_ROOT_DIR}/.errors.log"
    echo "${@}" >"${errfile}"
    if ! "${@}" >>"${errfile}" 2>&1; then
      local exitcode=$?
      cat "${errfile}" 1>&2
      exit $exitcode
    fi
  fi
}

#commit_id=$(git log -1 --pretty=%H)
function git_sha1() {
  if [ -x "$(which git 2>/dev/null)" ] &&
    [ -d "${CYBER_ROOT_DIR}/.git" ]; then
    git rev-parse --short HEAD 2>/dev/null || true
  fi
}

function git_date() {
  if [ -x "$(which git 2>/dev/null)" ] &&
    [ -d "${CYBER_ROOT_DIR}/.git" ]; then
    git log -1 --pretty=%ai | cut -d " " -f 1 || true
  fi
}

function git_branch() {
  if [ -x "$(which git 2>/dev/null)" ] &&
    [ -d "${CYBER_ROOT_DIR}/.git" ]; then
    git rev-parse --abbrev-ref HEAD
  else
    echo "@non-git"
  fi
}

function read_one_char_from_stdin() {
  local answer
  read -r -n1 answer
  # Bash 4.x+: ${answer,,} to lowercase, ${answer^^} to uppercase
  echo "${answer}" | tr '[:upper:]' '[:lower:]'
}

function optarg_check_for_opt() {
  local opt="$1"
  local optarg="$2"
  if [[ -z "${optarg}" || "${optarg}" =~ ^-.* ]]; then
      error "Missing parameter for ${opt}. Exiting..."
      exit 3
  fi
}

function create_data_dir() {
  local DATA_DIR="${CYBER_ROOT_DIR}/data"
  mkdir -p "${DATA_DIR}/log"
  mkdir -p "${DATA_DIR}/bag"
  mkdir -p "${DATA_DIR}/core"
}

function setup_device_for_amd64() {
  # setup CAN device
  local NUM_PORTS=8
  for i in $(seq 0 $((${NUM_PORTS} - 1))); do
    if [[ -e /dev/can${i} ]]; then
      continue
    elif [[ -e /dev/zynq_can${i} ]]; then
      # soft link if sensorbox exist
      sudo ln -s /dev/zynq_can${i} /dev/can${i}
    else
      break
      # sudo mknod --mode=a+rw /dev/can${i} c 52 ${i}
    fi
  done

  # Check Nvidia device
  if [[ ! -e /dev/nvidia0 ]]; then
    warning "No device named /dev/nvidia0"
  fi
  if [[ ! -e /dev/nvidiactl ]]; then
    warning "No device named /dev/nvidiactl"
  fi
  if [[ ! -e /dev/nvidia-uvm ]]; then
    warning "No device named /dev/nvidia-uvm"
  fi
  if [[ ! -e /dev/nvidia-uvm-tools ]]; then
    warning "No device named /dev/nvidia-uvm-tools"
  fi
  if [[ ! -e /dev/nvidia-modeset ]]; then
    warning "No device named /dev/nvidia-modeset"
  fi
}

function setup_device() {
  if [ "$(uname -s)" != "Linux" ]; then
    info "Not on Linux, skip mapping devices."
    return
  fi
  if [[ "${HOST_ARCH}" == "x86_64" ]]; then
    setup_device_for_amd64
  else
    setup_device_for_aarch64
  fi
}

if ${CYBER_IN_DOCKER} ; then
  create_data_dir
fi
