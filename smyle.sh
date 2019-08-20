#!/usr/bin/env bash
# -*- tab-width: 4; encoding: utf-8 -*-

SMYLE_HOME=$(dirname $0)
source $SMYLE_HOME/docker.sh

# update myself
(git pull -q origin master > /dev/null 2>&1 &)
