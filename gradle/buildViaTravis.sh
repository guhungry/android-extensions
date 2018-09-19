#!/bin/bash
# This script will build the project.

echo -e 'bintrayUser ['$bintrayUser']'
if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
  echo -e "Build Pull Request #$TRAVIS_PULL_REQUEST => Branch [$TRAVIS_BRANCH]"
  ./gradlew :extensions:build :extensions:jacocoTestReport
elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "" ]; then
  echo -e 'Build Branch with Snapshot => Branch ['$TRAVIS_BRANCH']'
  ./gradlew :extensions:build :extensions:jacocoTestReport --stacktrace --info
elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" != "" ]; then
  echo -e 'Build Branch for Release => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']'
  ./gradlew -PbintrayUser="${bintrayUser}" -PbintrayKey="${bintrayKey}" :extensions:build :extensions:jacocoTestReport :extensions:bintrayUpload --stacktrace --info
else
  echo -e 'WARN: Should not be here => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']  Pull Request ['$TRAVIS_PULL_REQUEST']'
  ./gradlew :extensions:build :extensions:jacocoTestReport
fi

./gradlew sonarqube \
  -Dsonar.projectKey=guhungry_android-extensions \
  -Dsonar.organization=guhungry-github \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=$sonarqubeKey