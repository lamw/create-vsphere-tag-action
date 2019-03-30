#!/bin/bash

export GOVC_URL=${GOVC_URL}
export GOVC_USERNAME=${GOVC_USERNAME}
export GOVC_PASSWORD=${GOVC_PASSWORD}

export TAG_NAME=${TAG_NAME}
export TAG_CATEGORY=${TAG_CATEGORY}

govc about > /dev/null 2>&1
if [ $? -eq 1 ]; then
    echo "Unable to login to vCenter Server ..."
    exit 1
fi

echo "Creating vSphere Tag: ${TAG_NAME} ..."
govc tags.create -c "${TAG_CATEGORY}" "${TAG_NAME}"
