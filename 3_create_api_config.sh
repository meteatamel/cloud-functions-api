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

# Replace PROJECT_ID and REGION
sed -i -e "s/PROJECT_ID/$PROJECT_ID/" ./openapi2-functions.yaml
sed -i -e "s/REGION/$REGION/" ./openapi2-functions.yaml

# Create an API config
gcloud api-gateway api-configs create $CONFIG_ID \
  --api=$API_ID --openapi-spec=openapi2-functions.yaml \
  --backend-auth-service-account=$PROJECT_NUMBER-compute@developer.gserviceaccount.com

# Describe the API config to see the details
gcloud api-gateway api-configs describe $CONFIG_ID \
  --api=$API_ID
