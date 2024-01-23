#!/bin/bash
docker build -t openrewritedemo .

#docker tag concourse-kubectl:180121 harbor.ragazzilab.com/library/concourse-kubectl:180121
#docker push harbor.ragazzilab.com/library/concourse-kubectl:180121

docker run -it --rm \
  --name openrewrite-demo \
  -v "$(pwd):/data" \
  -v openrewrite-root-m2:/root/.m2 \
  -v openrewrite-root-sdkman-candidates:/root/.sdkman/candidates \
  -w /data \
  openrewritedemo /bin/bash 
  #./demo.sh