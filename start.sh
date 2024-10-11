#!/bin/bash

chmod +x gradlew
./gradlew clean build

# wait for gradle to finish
# shellcheck disable=SC2144
while [ ! -f build/libs/*.jar ]
do
  sleep 10
done

cp build/libs/*.jar app.jar && \
chown stirlingpdfuser:stirlingpdfgroup app.jar && \
java -Dfile.encoding=UTF-8 -jar app.jar
