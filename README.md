# Base Image

This project contains necesary files for building a basic Docker image.
Said image is used by the GIBD (_Grupo de Investigacion en Base de Datos_) at UTN FRCU, Argentina, as a parent image for derived Docker images.

This image is based on Linux Alpine (**alpine:3.4**) in order to be as lightweight as possible, thereby optimizing bandwidth usage.

## Software

Currently, this image includes various packages required in a so called normal linux development environment, such as:
- curl
- bash
- unzip
- wget
- glibc2.23-r3
- openssh
- many more...

## Programming languages

Regarding language support, it provides both  **Java** and **Python** binaries in *path*, in the following flavours (for now at least, more are planned):
- Java Development Kit 1.8.0_112-b15 
- Python 2.7.12
- Python Pip 8.1.2

# Tags
Our naming convention is as follows:
```sh
base/so_java_python
```
where:
- "so" represents the underlying operative system. Mainly **alpine**.
- "java" describes the shipped jdk version.
- "python" describes the shipped python version.

As of 12/13/2016, the following tags are available:
- ```alpine_jdk1.8.112_py2.7.12 ```

# Usage
```sh
docker run -it --rm gibdfrcu/base:alpine_jdk1.8.112_py2.7.12 java -version
docker run -it --rm gibdfrcu/base:alpine_jdk1.8.112_py2.7.12 python -c "print 'Hello World'"
docker run -it --rm gibdfrcu/base:alpine_jdk1.8.112_py2.7.12 echo Hello World
docker run -it --rm gibdfrcu/base:alpine_jdk1.8.112_py2.7.12 /bin/bash
```
