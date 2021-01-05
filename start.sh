#!/usr/bin/env bash

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
  docker-compose -f resources/container_definitions/docker-compose.yml up -d
}


detect_os
run_docker_compose_deployment 


