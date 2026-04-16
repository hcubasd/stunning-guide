#!/bin/sh

set -eu

xargs -r tlmgr install < dependencies.txt
tlmgr path add
