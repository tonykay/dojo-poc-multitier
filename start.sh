#!/usr/bin/env bash

detect_os () # For installs (via stack overflow...)
{
  _PLATFORM='unknown'
  _OS_STRING=$(uname)
  case "$_OS_STRING" in
    Darwin)
      echo platfrom is mac
      echo platform=mac
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


