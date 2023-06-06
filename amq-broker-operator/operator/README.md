# Red Hat Integration - AMQ Broker for RHEL 8 (Multiarch) Operator

Installs the Red Hat Integration - AMQ Broker for RHEL 8 (Multiarch) operator into all namespaces.

Current channel overlays include:
* [amq-streams-1.x](overlays/1.x)
* [amq-streams-1.8.x](overlays/1.8.x)
* [amq-streams-2.x](overlays/2.x)
* [amq-streams-2.0.x](overlays/2.x)
* [amq-streams-2.1.x](overlays/2.x)
* [stable](overlays/stable)

## Usage

If you have cloned the `mule-rtf-openshift` repository, you can install the Red Hat Integration - AMQ Broker for RHEL 8 (Multiarch) operator based on the overlay of your choice by running from the root `mule-rtf-openshift` directory

```
oc apply -k amq-broker-operator/operator/overlays/<channel>
```

Or, without cloning:

```
oc apply -k https://github.com/tosin2013/mule-rtf-openshift/amq-broker-operator/operator/overlays/<channel>
```

As part of a different overlay in your own GitOps repo:

```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - github.com/tosin2013/mule-rtf-openshift/amq-broker-operator/operator/overlays/<channel>?ref=main
```