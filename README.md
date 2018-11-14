# JDK Provider for Java Applications Under the OpenShift - S2I Builder Image
  

`Source-To-Image` (S2I) is a standalone tool for creating builder images. It's also the major strategy used for building applications in `OpenShift 3`. This repository contains the source code for building _Java applications_ with various JDK versions as a reproducible image using `source-to-image`. The image to be built expects a regular executable jar file that comes from a repository as input. The input can be a `maven` project.


## To Build Image
```bash
oc new-build https://github.com/hakdogan/handy-environment.git --name kodcu-jdk
```


## Available Environment Variables

You can use some environment variable with this builder for your needs.


### JDK Variable

You can use the `JDK` environment variable for JDK version you want. For example, if you want to use Open JDK 7, you should be used following command.

```bash
oc new-build https://github.com/hakdogan/handy-environment.git --env JDK=openjdk7 --name kodcu-jdk
```

You don't have to use the `JDK` variable. When you don't use the `JDK` variable or use a different value than the following, Oracle JDK 8 will install by default.

ENV | MEANING | 
--- | --- | 
`--env jdk=openjdk6` | 6 version of OpenJDK will be installed | 
`--env jdk=openjdk7` | 7 version of OpenJDK will be installed | 
`--env jdk=oraclejdk6` | 6 version of Oracle JDK will be installed |
`--env jdk=oraclejdk7` | 7 version of Oracle JDK will be installed |
`--env jdk=oraclejdk8` | 8 version of Oracle JDK will be installed |


### SFPATH Variable

When you have `multiple jar` or your jar is not in the `target` directory you can specify the full path of the jar. In addition, you can define `arguments` to passing the jar. For all of these, you must provide the `setting.yml` file in your `input project` and pass the full path of that file to the `sfpath` variable. For example:

```bash
oc new-build https://github.com/hakdogan/handy-environment.git --name kodcu-jdk8 \
--env sfpath="SharedDataProvider/src/main/resources"
```

The `setting.yml` can contain the `full path` of jar or `arguments` of jar or both.

```yaml
jar:
  name: SharedDataProvider/target/asyncPutVerticle.jar
  arguments: -cluster
```

Also, you can define `multiple arguments`.

```yaml
jar:
  name: SharedDataProvider/target/asyncPutVerticle.jar
  arguments: ["-cp\ 'classes:lib/myjar.jar'",  "-instances\ 10"]
```


## To deployment
```
oc new-app kodcu-jdk~$REPO_URL
```


