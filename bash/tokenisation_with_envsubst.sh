#!/bin/bash
TARGET_ENV=$1
if [ -z "${TARGET_ENV}" ]; then
  echo "The TARGET_ENV variable is empty."
  exit 1
fi
if [ ! -f ${TARGET_ENV}.properties ]; then
  echo "The ${TARGET_ENV}.properties file does not exist."
  exit 1
fi
# We have to export variables to be used with envsubst command
set -a
source ${TARGET_ENV}.properties
# The following lines calls the envsubst command to write the final properties file
envsubst < technical.properties.template > technical.properties
source technical.properties
if [ "${TARGET_HOST}" = "${HOST_NAME}" ]; then
  echo "Variable substitution is ok."
else
  echo "TARGET_HOST=${TARGET_HOST} and HOST_NAME=${HOST_NAME}: different value"
  exit 1
fi

exit 0

