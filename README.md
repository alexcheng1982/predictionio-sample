PredictionIO Sample
===================

This is a quick start sample for using [PredictionIO](http://predictionio.incubator.apache.org/). The template used is [template-java-parallel-ecommercerecommendation](https://github.com/PredictionIO/template-java-parallel-ecommercerecommendation). PredictionIO runs in a Docker container.

### Run the sample

#### Start container

Start Docker container using [Docker Compose](https://docs.docker.com/compose/).

~~~
$ docker-compose build
$ docker-compose -p pio up -d
~~~

The container will create the app and build the engine. It may take some time to finish. Use `docker logs` to watch the container logs to check when it's finished.

~~~
$ docker logs pio_pio_1
~~~

#### Load sample data

Use Python script to load sample data. Access key can be found in container logs. `pio_pio_1` is conatiner's name.

~~~
$ docker exec pio_pio_1 python data/import_eventserver.py --access_key <access key>
~~~

#### Train

Train the data.

~~~
$ docker exec pio_pio_1 pio train
~~~

#### Deploy the engine

Deploy the engine. The engine runs in container port `8000`, which is mapped to host port `10080`.

~~~
$ docker exec pio_pio_1 pio deploy
~~~

#### Run the query

Run the query on host machine using `curl`. `https` is required.

```
$ curl -k -H "Content-Type: application/json" \
-d '{
  "userEntityId" : "u1",
  "number" : 10 }' \
https://localhost:10800/queries.json
```
