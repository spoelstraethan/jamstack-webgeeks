#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e1d071e32c065001b14ca62/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e1d071e32c065001b14ca62
curl -s -X POST https://api.stackbit.com/project/5e1d071e32c065001b14ca62/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e1d071e32c065001b14ca62/webhook/build/publish > /dev/null
