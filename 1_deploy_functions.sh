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

# Enable required services
gcloud services enable cloudbuild.googleapis.com
gcloud services enable cloudfunctions.googleapis.com

# Deploy the first function
FUNCTION1=helloWorld
echo $FUNCTION1
gcloud functions deploy $FUNCTION1 --region $REGION \
  --runtime nodejs16 --trigger-http --allow-unauthenticated

# Deploy the second function
FUNCTION2=byeWorld
gcloud functions deploy $FUNCTION2 --region $REGION\
  --runtime nodejs16 --trigger-http --allow-unauthenticated