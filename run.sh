#!/usr/bin/env bash



run_docker_compose_deployment ()
{
  echo docker deployment
  docker-compose up -d -f resources/container_definitions/docker-compose.yml
}

run_docker_compose_deployment 


