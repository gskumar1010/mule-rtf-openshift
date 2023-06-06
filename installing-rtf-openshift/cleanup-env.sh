#!/bin/bash
oc delete RuntimeFabric runtime-fabric
oc delete crd persistencegateways.rtf.mulesoft.com
oc delete PriorityClass rtf-components-high-priority
