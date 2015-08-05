# Puppet 4.x Server Container

## Overview

This is a simple container to get PuppetServer up and running in a few minutes. It will help you to
accelerate your deployment of Puppet for configuration management

## How to get it

```bash
docker pull infosec812/puppetserver
```

## How to run it

```bash
docker-compose up -d
```

## How to configure it

Wherever you check out the source (or download the docker-compose.yml file), create a subdirectory called "conf".
This is where the puppet configurations and manifests will reside for the container.
