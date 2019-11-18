# Spark "Getting Started" Guide

_This document will walk you through how to quickly get started with local development using Apache Spark._

## Prereqs

Before you proceed, you will need a few things, specifically: Git, Docker, Python, and VS Code. Please use the quick installer in our [Windows Dev Getting Started Guide](windows_development.md) to get everything setup in just one step using the Chocolatey package manager.

## Launching Spark on your local machine

_There are three options. Pick your favorite, or choose the first and recommended option.

### Option 1: Use `slalom.dataops` python library (recommended)

```bash
pip install --upgrade slalom.dataops
python -m slalom.dataops.sparkutils start_server --dockerized=True
```

### Option 2: Use `docker run` on `slalomgg/dataops`

```bash
docker run -it --rm -p 4040:4040 -p 10000:10000 -p 7077:7077 slalomggp/dataops:latest-dev spark start_server
```

## Connect to the Spark server

After launching the server, you can connect spark applications using the following server endpoints:

* Spark applications: `localhost:7077`
* SQL queries via JDBC: `localhost:10000`

Note: To quickly run SQL queries, you can download the DBeaver SQL application via `choco install dbeaver` and then connect with either the `Hive` or `Spark` jdbc drivers.
