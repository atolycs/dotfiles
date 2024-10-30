#!/usr/bin/env bash

# Install systemd user mount point folder

function install_unit() {

  local regexp="s/@@BIND_MOUNT@@/\/mnt\/DATA\/github/g"
  local where_mount="${HOME}/github"
  local unit_file=$(systemd-escape -p --suffix=mount ${where_mount})
  local DEST_PATH="${HOME}/.config/systemd/user"
  local _templateFile="./github-projects.mount.template"

  sed -e ${regexp} ${_templateFile} | tee -a "${unit_file}"
  install -vdm755 "$DEST_PATH"
  install -vm644 ./${unit_file} -t "${DEST_PATH}"
}

install_unit
