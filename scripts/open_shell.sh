#!/bin/bash

usage() { echo "Usage: $0 -p <project directory> -s <serial interface> " 1>&2; exit 1; }

while getopts "p:s:" o; do
    case "${o}" in
		p)
			p=${OPTARG}
			;;
		s)
			s=${OPTARG}
			;;
		*)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if  [ -z "${j}" ] || [ -z "${s}" ] || [ -z "${p}" ]; then
    usage
fi

# check if podman or docker is installed
if [ -x "$(command -v podman)" ]; then
    echo 'Found podman installation' >&2
    CMD=podman
elif [ -x "$(command -v docker)" ]; then
    echo 'Found docker installation' >&2
    CMD=docker
else 
    echo 'Found neither docker nor podman installation' >&2
    exit 1
fi

$CMD run --rm -it --name iot-container -v ${s}:/dev/ttyUSB0 -v /dev/usb:/dev/usb -v /run/udev:/run/udev:ro \
	 --network host --privileged -v ${p}:/workingdir/  --workdir /workingdir --group-add keep-groups \
	docker.io/lehrchristoph/vu_internet_of_things_container:latest
