# Spark "Getting Started" Guide

_This document will walk you through how to quickly get started with local development using Apache Spark._

## Prereqs

Before you proceed, you will need a few things, specifically: Git, Docker, Python, and VS Code. Please use our [Windows Dev Getting Started Guide](windows_development.md) or using this script:

* [https://docs.dataops.tk/choco_devops.bat](choco_devops.bat)

## Launching Spark on your local machine

_There a several options to launching the Spark clusters. If you aren't sure which to use, we recommend starting with the first option._

```bash
pip install --upgrade slalom.dataops
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

### Tutorial 01: Running SparkSQL as a Virtual DB

_This quick tutorial shows you how to run Spark as a SQL database and connect and run queries using a GUI JDBC-compliant query tool._

1. Download the DBeaver SQL application from Chocolatey by clicking here: [choco://dbeaver](choco://dbeaver).
   * If you have not yet installed chocolatey, you can install it now from [https://docs.dataops.tk/choco_min.bat](choco_min.bat) or click [here](windows_development.md) for more information.
2. After installing the DBeaver app, create a new "Spark" connection and connect to `localhost:10000` with a blank username and password.
3. Open a new query window and try executing the following SQL commands:
    * ```SHOW DATABASES```
    * ```CREATE DATABASE mydb```
    * ```USE DATABASE mydb```
    * ```CREATE TABLE mytable as SELECT 42 AS the_answer, null as the_question```
    * ```SELECT * FROM mydb.mytable```
    * ```DESCRIBE TABLE mytable```
    * ```SHOW TABLES IN mydb```

### Tutorial 02: A Dungeon Adventure in AI, on Jupyter

_This fun tutorial introduces you to Jupyter notebooks by way of an ML-based text adventure game called [AIDungeon_2](https://www.theverge.com/tldr/2019/12/6/20998993/ai-dungeon-2-choose-your-own-adventure)._

1. Follow the instructions above to install the `slalom.dataops` Python library.
2. Open the Jupyter Notebook GUI at [https://localhost:8888?token=qwerty123](https://localhost:8888?token=qwerty123)
3. In the new browser window, navigate to the `Samples` directory and open `AIDungeon.ipynb`.
4. Select `Terminal` > `Run all cells...` from the menu options.
5. Wait for the application to initialize and then start your adventure!

-------------------------

## Appendix

-------------------------

### Appendix A. Running Spark without the `slalom.dataops` python library

If you do not have the python library installed, or if you want additional control over the local docker container, you can run the following command to manually launch the spark cluster using Docker:

```bash
docker run -it --rm -p 4040:4040 -p 10000:10000 -p 7077:7077 -p 8888:8888 slalomggp/dataops:latest-dev spark start_server --with_jupyter
```
