az aks nodepool add --resource-group devrelasaservice \
--cluster-name aksenvironment01 \
--name mywasipool \
--node-count 1 \
--workload-runtime WasmWasi

^ OLD WAY: Come May, 2025, implementing a new node pool with a Wasi will be deprecated. The new way is with SpinKube.

```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.3/cert-manager.crds.yaml
```

```
helm repo add jetstack https://charts.jetstack.io
helm repo update
```

```
helm install \
  cert-manager jetstack/cert-manager --version v1.14.3 \
  --namespace cert-manager --create-namespace \
  --wait
```

Kwasm is responsible for implementing a containerd shim on the nodes. This way, Wasm doesn't need a
separate runtime on the k8s worker nodes.
```
helm repo add kwasm http://kwasm.sh/kwasm-operator/

helm install \
  kwasm-operator kwasm/kwasm-operator \
  --namespace kwasm --create-namespace \
  --version 0.2.3 \
  --set kwasmOperator.installerImage=ghcr.io/spinkube/containerd-shim-spin/node-installer:v0.15.1
```

Annotate nodes that should be able to run Spin Apps with `kwasm.sh/kwasm-node=true`
```
kubectl annotate node --all kwasm.sh/kwasm-node=true
```

Deploy Spin:
# Two spin CRDs
```
kubectl apply -f https://github.com/spinkube/spin-operator/releases/download/v0.2.0/spin-operator.crds.yaml
kubectl apply -f https://github.com/spinkube/spin-operator/releases/download/v0.2.0/spin-operator.runtime-class.yaml

# Spin operator
helm install spin-operator --version 0.2.0 \
  --namespace spin-operator --create-namespace \
  --wait oci://ghcr.io/spinkube/charts/spin-operator

# spin app executor
kubectl apply -f https://github.com/spinkube/spin-operator/releases/download/v0.2.0/spin-operator.shim-executor.yaml
```