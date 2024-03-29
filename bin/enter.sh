#!/usr/bin/env sh

DIR="$(
  cd "$(dirname "$0")"
  pwd -P
)"
MY_PWD=$(pwd)

localImage=$(${DIR}/../support/localImage.sh)

C=''
for i in "$@"; do
  i="${i//\\/\\\\}"
  C="$C \"${i//\"/\\\"}\""
done

pid=$$
containerName=${localImage//\//-}-${pid}

echo $containerName

cli='env docker run --rm -it'
cli+=" -v $DIR/../docker/entrypoint.sh:/entrypoint.sh"
cli+=" -v $DIR/../docker/bin:/usr/local//bin"
cli+=" -v $MY_PWD:$MY_PWD"
cli+=" -w $MY_PWD"
cli+=" --name ${containerName} ${localImage}"
cli+=" sh ${C}"

sh -c "$cli"
