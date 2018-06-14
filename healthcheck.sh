#!/usr/bin/env bash
# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA

# The mysql-init-complete file is touched by the entrypoint file before the
# main server process is started
if [ -f /mysql-init-complete ]; # The entrypoint script touches this file
then # Ping server to see if it is ready
  mysqladmin --defaults-extra-file=/healthcheck.cnf ping
else # Initialization still in progress
  exit 1
fi