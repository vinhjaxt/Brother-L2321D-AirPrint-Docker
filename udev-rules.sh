#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

cat > /etc/udev/rules.d/99-usb-printer.rules <<EOF
ACTION=="add", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="04f9", ENV{ID_MODEL_ID}=="0062", RUN+="/bin/bash ${DIR}/restart.sh"
EOF

udevadm control --reload

