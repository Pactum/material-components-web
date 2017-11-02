#!/usr/bin/env bash

##
# Copyright 2017 Google Inc. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

set -e

cd "`dirname ${BASH_SOURCE[0]}`"

[[ -z "${MCW_ENV}" ]] && MCW_ENV='dev'

gcloud container builds submit --config "cloudbuild.${MCW_ENV}.yaml" .

# Alternatively, you can build locally and upload the image to GCloud:
#docker build -t "${MCW_ENV}-boss-server:latest" .
#docker tag "${MCW_ENV}-boss-server:latest" "us.gcr.io/material-components-web/${MCW_ENV}-boss-server:latest"
#gcloud docker -- push "us.gcr.io/material-components-web/${MCW_ENV}-boss-server:latest"
