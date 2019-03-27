#!/bin/bash

usage()
{
    cat << EOF
Build Infonova Mesos Docker images
Usage : $(basename $0) -v <image-version>
      -h | --help         : Show this message
      -v | --version      : Version to use for the images
               exampl :
               $(basename $0) -v 1.7.2-docker-18.06.1-ce
EOF
}

# Options parsing
while (($#)); do
    case "$1" in
        -h | --help)   usage;   exit 0;;
        -v | --version) VERSION="${2}"; shift 2;;
        *)
            usage
            echo "ERROR : Unknown option"
            exit 3
        ;;
    esac
done

if [ -z ${VERSION} ]; then
    usage
    exit 3
fi

BASEIMAGE=infonova/mesos:${VERSION}
MASTERIMAGE=infonova/mesos-master:${VERSION}
AGENTIMAGE=infonova/mesos-agent:${VERSION}

echo "Building Docker images with version: ${VERSION}"
#for dockerfile in `find . -name Dockerfile | tac`; do
#    #echo ${dockerfile}
#    type="$(cut -d '/' -f2 <<<"${dockerfile}")"
#    #echo ${type}
#    dockerfile="$(dirname ${dockerfile})"
#    #echo ${dockerfile}
#    docker build -t infonova/mesos-${type}:${VERSION} ${dockerfile}
#done

docker build -t ${BASEIMAGE} .
docker build -t ${MASTERIMAGE} ./master
docker build -t ${AGENTIMAGE} ./agent

echo "Build went well. Do you want to push? (y/n)"

read do_push

if [ "y" = "${do_push}" ]; then
    docker push  ${BASEIMAGE}
    docker push  ${MASTERIMAGE}
    docker push  ${AGENTIMAGE}
fi
