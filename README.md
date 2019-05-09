# SciGraph-docker-monarch-data
Build scigraph Docker image with the monarch configs. Uses master HEAD from the SciGraph github repo.

Need to have docker installed in order to run the build.

**Generate the monarch config files locally:**

./conf/build-load-conf.sh
./conf/build-service-conf.sh

**Build the SciGraph Image:**

docker build -t scigraph .

**Load the graph:**

docker run \
  -v `pwd`/data:/data \
  -v `pwd`/conf:/scigraph/conf \
  scigraph load-scigraph monarchLoadConfiguration.yaml

**Run the services:**

docker run \
    -v `pwd`/data:/data \
    -v `pwd`/conf:/scigraph/conf \
    -d -p 9000:9000 \
    --name scigraph-services \
    scigraph start-scigraph-service monarchConfiguration.yaml

**Stop the services:**

docker stop scigraph-services

**Read logs of the services:**

docker logs scigraph-services

**Tips, remove all the local images**

docker rm $(docker ps -a -q)

docker rmi $(docker images -q)
