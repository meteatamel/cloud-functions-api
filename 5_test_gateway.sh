#!/bin/bash

# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -v

DIR="$(dirname "$0")"
. "${DIR}/config"

# Default gateway default host
DEFAULT_HOST="$(gcloud api-gateway gateways describe $GATEWAY_ID --location=$REGION --format='value(defaultHostname)')"

# Test hello
curl https://$DEFAULT_HOST/greeter/hello

# Test bye
curl https://$DEFAULT_HOST/greeter/bye
