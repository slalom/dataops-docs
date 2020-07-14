# [Docs](./README.md) > Spark "Getting Started" Guide

_This document will walk you through how to quickly get started with local development using Apache Spark._

## Prereqs

Before you proceed, you will need a few things, specifically: Git, Docker, Python, and VS Code. Please use our [Windows Dev Getting Started Guide](setup/windows.md) or using this script:

* [https://docs.dataops.tk/setup/choco_devops.bat](setup/choco_devops.bat)

## Launching Spark on your local machine

The `slalom.dataops` library makes it quick and easy to launch a new spark server:

1. Install the python library:

    ```bash
    pip install --upgrade slalom.dataops
    ```

2. Launch the spark server:

    ```bash
    s-spark start_server --with_jupyter
    ```

## Connect to the Spark server

After launching the server, you can connect spark applications using the following server endpoints:

* Spark Web GUI: [http://localhost:4040](http://localhost:4040)
* Jupyter Web GUI: [https://localhost:8888](https://localhost:8888)
* SQL queries (JDBC): `localhost:10000`
* Spark applications: `localhost:7077`

-------------------------

## Tutorials

### Tutorial 01: Running SparkSQL as a Virtual Database

_This quick tutorial shows you how to run Spark as a SQL database and connect and run queries using a GUI JDBC-compliant query tool._

1. Download the DBeaver SQL application from Chocolatey by clicking here: [choco://dbeaver](choco://dbeaver).
   * If you have not yet installed chocolatey, you can install it now from [https://docs.dataops.tk/setup/choco_min.bat](setup/choco_min.bat) or click [here](setup/windows.md) for more information.
2. After installing the DBeaver app, create a new "Spark" connection and connect to `localhost:10000` with a blank username and password.
3. Open a new query window and try executing the following SQL commands:

    ```sql
    CREATE DATABASE mydb;
    SHOW DATABASES;
    USE mydb;

    CREATE TABLE mytable AS
    SELECT 4 AS the_answer, CAST(null as string) AS the_question;

    SELECT * FROM mydb.mytable;

    DESCRIBE TABLE mytable;
    SHOW TABLES IN mydb;
    ```

### Tutorial 02: Play an ML-Based Dungeon Adventure Game, on Jupyter

_This fun tutorial introduces you to Jupyter notebooks by way of an ML-based text adventure game called [AIDungeon_2](https://www.theverge.com/tldr/2019/12/6/20998993/ai-dungeon-2-choose-your-own-adventure)._

1. Follow the instructions above to install the `slalom.dataops` Python library.
2. Open the Jupyter Notebook GUI at [https://localhost:8888?token=qwerty123](https://localhost:8888?token=qwerty123)
3. In the new browser window, navigate to the `Samples` directory and open `AIDungeon.ipynb`.
4. Select `Terminal` > `Run all cells...` from the menu options.
5. Wait for the application to initialize and then start your adventure!

-------------------------

## Additional Info and FAQ

<!-- markdownlint-disable MD026 - no-trailing-punctuation -->

-------------------------

### Q. Can I run Spark without the `slalom.dataops` python library?

A. Yes. If you do not have the python library installed, or if you want additional control over the local docker container, you can run the following command to manually launch the spark cluster using Docker:

```bash
docker run -it --rm \
    -p 4040:4040 \
    -p 7077:7077 \
    -p 8888:8888 \
    -p 10000:10000 \
    slalomggp/dataops:latest-dev \
    spark start_server --with_jupyter
```
