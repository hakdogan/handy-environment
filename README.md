# JDK Provider for Java Applications Under the OpenShift - S2I Builder Image
  

`Source-To-Image` (S2I) is a standalone tool for creating builder images. It's also the major strategy used for building applications in `OpenShift 3`. This repository contains sample builder image for _Java applications_ to be used with `source-to-image` in `OpenShift`. The image to be built expects a regular executable jar file that comes from a repository as input. The input can be a `maven` project.

# To build image
```
oc new-build https://github.com/hakdogan/handy-environment.git --name kodcu-jdk
```

You can use the environment variable for JDK version you want. For example, if you want to use Open JDK 7, you should be used following command.

```
oc new-build https://github.com/hakdogan/handy-environment.git --env JDK=openjdk7 --name kodcu-jdk
```

Supported JDK versions as follows.

JDK | ENV | 
--- | --- | 
OpenJDK 6 | --env JDK=openjdk6 | 
OpenJDK 7 | --env JDK=openjdk7 | 
Oracle JDK 6 | --env JDK=oraclejdk6 |
Oracle JDK 7 | --env JDK=oraclejdk7 |
Oracle JDK 8 | --env JDK=oraclejdk8 |


## To deployment
```
oc new-app kodcu-jdk~$REPO_URL
```


