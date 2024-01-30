#!/bin/bash
docker build -t openrewritedemossh . -f dockerfilessh

#docker tag concourse-kubectl:180121 harbor.ragazzilab.com/library/concourse-kubectl:180121
#docker push harbor.ragazzilab.com/library/concourse-kubectl:180121

docker run -it --rm \
  --name openrewrite-demo-ssh \
  -v "$(pwd):/data" \
  -v openrewrite-root-m2:/root/.m2 \
  -v openrewrite-root-sdkman-candidates:/root/.sdkman/candidates \
  -w /data \
  -p 8022:22 \
  openrewritedemossh /bin/bash
  #./demo.sh
