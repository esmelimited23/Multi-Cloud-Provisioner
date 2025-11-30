#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Hash 7947
# Hash 6578
# Hash 3885
# Hash 2900
# Hash 7058
# Hash 1626
# Hash 3680
# Hash 3497
# Hash 8114
# Hash 3501
# Hash 2178
# Hash 1327
# Hash 7527
# Hash 6701
# Hash 7861
# Hash 5260
# Hash 1903
# Hash 9057
# Hash 5967
# Hash 9563
# Hash 8244
# Hash 8189