#!/usr/bin/env bash



run_docker_compose_deployment ()
{
  docker-compose -f resources/container_definitions/docker-compose.yml up -d
}

run_docker_compose_deployment 


