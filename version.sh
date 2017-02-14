#!/bin/bash

PKGVERSION=$(/bin/ls splunkforwarder*.tgz | awk -F'-' '{print $2}')

echo "$PKGVERSION"
