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
# Another way to do it with sed command with the GNU extension enabled
sed -nr 's/^(.*)$/echo "\1"/ep' < technical.properties.template > technical.properties
source technical.properties
if [ "${TARGET_HOST}" = "${HOST_NAME}" ]; then
  echo "Variable substitution is ok."
else
  echo "TARGET_HOST=${TARGET_HOST} and HOST_NAME=${HOST_NAME}: different value"
  exit 1
fi

exit 0

