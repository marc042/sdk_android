

# sdk android
Docker for run Android simulator


Introduction
============

The Docker sdk_android is based on bookworm debian.
the commandlinetools-linux is installed with platform android-33.
It has a capability to generate :
  - run VM android

Required
========

For Linux with docker installed and kvm operationnal (can run on the
host or with cascading VM (option nesting for KVM)).


Build Docker
============

  `
    cd docker
    ./build.sh
  `

Run Docker
==========

See https://github.com/marc042/sdk_android


    cd docker
    ./run.sh


Docker Registry
===============

The Docker is in https://hub.docker.com/repository/docker/mgn42/sdk_android

For push new image :
--------------------
  `
    docker tag <SHA1> mgn42/sdk_android:tagname
    
    docker push mgn42/sdk_android:tagname
  `
  exemple :
    docker tag <SHA1> mgn42/sdk_android:1.1
    docker push mgn42/sdk_android:1.1
