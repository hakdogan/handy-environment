# JDK Provider for Java Applications Under the OpenShift - S2I Builder Image
  

`Source-To-Image` (S2I) is a standalone tool for creating builder images. It's also the major strategy used for building applications in `OpenShift 3`. This repository contains the source code for building _Java applications_ with various JDK versions as a reproducible image using `source-to-image`. The image to be built expects a regular executable jar file that comes from a repository as input. The input can be a `maven` project.


## To build image
```
oc new-build https://github.com/hakdogan/handy-environment.git --name kodcu-jdk
```


## Available environment variables.
You can use the `JDK` environment variable for JDK version you want. For example, if you want to use Open JDK 7, you should be used following command.

```
oc new-build https://github.com/hakdogan/handy-environment.git --env JDK=openjdk7 --name kodcu-jdk
```

You don't have to use the `JDK` variable. When you don't use the `JDK` variable or use a different value than the following, Oracle JDK 8 will install by default.

ENV | MEANING | 
--- | --- | 
`--env JDK=openjdk6` |  | 
`--env JDK=openjdk7` | 7 version of OpenJDK will be installed | 
`--env JDK=oraclejdk6` | 6 version of Oracle JDK will be installed |
`--env JDK=oraclejdk7` | 7 version of Oracle JDK will be installed |
`--env JDK=oraclejdk8` | 8 version of Oracle JDK will be installed |


## To deployment
```
oc new-app kodcu-jdk~$REPO_URL
```


