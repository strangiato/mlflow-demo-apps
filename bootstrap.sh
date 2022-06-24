#!/bin/bash
set -e

ARGO_NS="mlflow-demo-gitops"

echo "Validating cluster login"
oc whoami

echo ""
echo "Installing tenant components."

kustomize build bootstrap/overlays/default | oc apply -f -

echo ""
echo "View the status of the sync in the ArgoCD Instance:"

route=$(oc get route argocd-server -o=jsonpath='{.spec.host}' -n ${ARGO_NS})

echo "https://${route}"
