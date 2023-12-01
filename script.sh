#!/bin/bash

# Check if the required arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <secret-name> <namespaces-file>"
    exit 1
fi

# Set the secret name
SECRET_NAME=$1

# Read namespaces from the specified file
NAMESPACES_FILE=$2
if [ ! -f "${NAMESPACES_FILE}" ]; then
    echo "Error: Namespaces file '${NAMESPACES_FILE}' not found."
    exit 1
fi

# Loop through each namespace from the file and apply the secret
while IFS= read -r NAMESPACE; do
    # Create the secret in the specified namespace
    kubectl delete secret "${SECRET_NAME}" --namespace="${NAMESPACE}"
    kubectl --namespace="${NAMESPACE}" create secret docker-registry "${SECRET_NAME}" --docker-server=ghcr.io --docker-username=redhat --docker-password=redhat --docker-email=test@nirmata.com

    # Print a message indicating the secret creation
    echo "Secret '${SECRET_NAME}' created in namespace '${NAMESPACE}'"
done < "${NAMESPACES_FILE}"

