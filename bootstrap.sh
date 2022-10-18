#!/bin/bash
set -e

ARGO_NS="mlflow-demo-gitops"

echo "Validating cluster login"
oc whoami

echo ""
echo "Installing tenant components."

oc apply -k bootstrap/overlays/default

echo ""
echo "View the status of the sync in the ArgoCD Instance:"

route=$(oc get route argocd-server -o=jsonpath='{.spec.host}' -n ${ARGO_NS})

echo "https://${route}"
