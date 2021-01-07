#!/usr/bin/env bash

# Determine script directory even from sym link directories for correct paths

_FULL_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P) && SELF_PATH=$SELF_PATH/$(basename -- "$0" | awk '{ print $NF }')
_DOJO_HOME=$(echo $_FULL_PATH | awk '{ print $1 }') # weirdness with paths, should be able to combine with above

validate_runtime_by_os () # For container run-time and installers
{
  _PLATFORM=unknown
  _OS_STRING=$(uname)

  case "$_OS_STRING" in
    Darwin)
      _PLATFORM=mac
      ensure_mac_container_runtime
      ;;
    Linux)
      _PLATFORM=Linux
      echo Linux Support via podman coming
      ;;
    *)
      echo Platform is unknown
      echo Assuming run-time is docker
      ;;
  esac
}

#ensure_mac_software_installed ()
#{
#  _MACOS_VERSION=$(defaults read loginwindow SystemVersionStampAsString)
#  echo Mac version "$_MACOS_VERSION"
#}  

ensure_mac_container_runtime ()
{
  # deal with Mac && Docker
  echo checking container runtime
  if [ -f /usr/local/bin/docker-compose ]
  then
    echo docker-compose is already installed
    echo
  else
    # mac_version_installer
    _DOCKER_DESKTOP_MINIMUM="10.14"
    _MACOS_VERSION=$(defaults read loginwindow SystemVersionStampAsString)
    echo docker-compose not installed
    echo You can install this manualy with:
    echo
     if [ "$(printf '%s\n' "$_DOCKER_DESKTOP_MINIMUM" "$_MACOS_VERSION" | sort -V | head -n1)" = "$_DOCKER_DESKTOP_MINIMUM" ]; then 
            echo brew cask install docker
     else
            echo brew cask install docker-toolbox
     fi
     exit 1
  fi
}


run_docker_compose_deployment ()
{
  docker-compose -f ${_DOJO_HOME}/resources/orchestration/docker-compose.yml up -d
}

access_message ()
{
  echo
  echo "You can access your lab at http://localhost"
  echo
}

validate_runtime_by_os 
run_docker_compose_deployment 
access_message
		 

