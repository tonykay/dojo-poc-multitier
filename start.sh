#!/usr/bin/env bash

# Determine script directory even from sym link directories for correct paths

_DOJO_HOME=$(cd -P -- "$(dirname -- "$0")" && pwd -P) && SELF_PATH=$SELF_PATH/$(basename -- "$0")

detect_os () # For container run-time and installers
{
  _PLATFORM=unknown
  _OS_STRING=$(uname)

  case "$_OS_STRING" in
    Darwin)
      _PLATFORM=mac
      ;;
    Linux)
      _PLATFORM=Linux
      ;;
    *)
      echo Platform is unknown
      echo Assuming run-time is docker
      ;;
  esac
}

ensure_container_runtime ()
{
  # deal with Mac && Docker
  echo mac
  # deal with Linux && Podman
  # deal with Linux && Docker
}


run_docker_compose_deployment ()
{
  docker-compose -f ${_DOJO_HOME}/resources/orchestration/docker-compose.yml up -d
}


detect_os
run_docker_compose_deployment 


