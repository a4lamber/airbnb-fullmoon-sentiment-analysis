<img align="left" width="100" height="100" src="./drawings/5_fullmoon_airbnb.excalidraw.png">


# Full Moon 
Airbnb customer sentiment analysis and study the effect of the full moon on customers' mood! (Hopefully our customers don't turn on wolverine mode and leave a bad review!)

# Motivation

The motivation of the project is to perform a sentiment ananlysis on airbnb public dataset. The goal of this project is to:
- investigate the effect of fullmoon on the customered mood, characterized by the reviews they left for the airbnb listings.
- get some practice in for [dbt](https://docs.getdbt.com/)


# Project Architecture

The data pipeline has been done in a ELT process that involves:
- `extraction`: get data from s3 bucket
- `load`: load into the snowflake first
- `transformation`: apply necessary transformation with `dbt`.

The overall architecture is illustrated in the figure below

![](drawings/4_dbt_transformation.excalidraw.png)
*overall architecture for the airbnb project*


# Installation

In this section, i will cover how to set up the `dbt` and `snowflake`
## Snowflake set-up

General steps are here
1. register for 30-days free trial on website
2. connect snowflake account with dbt
3. run a snowflake SQL datasheet to create databse user, [click here](./setup/2_create_users.sql).
4. run a snowflake SQL datasheet to import data from s3, [click here](./setup/1_import_airbnb_data_to_snowflake.sql). 


## dbt setup

Let's install `dbt` and dbt-snowflake adapeter via `pip`

```bash
# create project dir
mkdir project && cd project
# install python 3.11
python3.11 -m venv .venv

# depends on whether you use bash, zsh or fish
source .venv/bin/activate

# now you are in the python environment, let's install package
# dbt-snowflake==1.5.0
# dbt-core==1.5.1
pip install -r requirements.txt
```

Now, you have dbt up and running locally 
```bash
# check if dbt is installed and version
dbt --version
```
The output should be 

```plaintext
Core:
  - installed: 1.5.1
  - latest:    1.5.1 - Up to date!

Plugins:
  - snowflake: 1.5.0 - Update available!

  At least one plugin is out of date or incompatible with dbt-core.
  You can find instructions for upgrading here:
  https://docs.getdbt.com/docs/installation
```

```bash
# create a project directory for the dbt project
dbt init <ProjectName>
```

Now you should have a dbt project directories like `tree -L 1`, 
```bash
.
├── README.md
├── analyses
├── dbt_packages
├── dbt_project.yml
├── logs
├── macros
├── models
├── seeds
├── snapshots
├── target
└── tests
10 directories, 2 files
```

Now you are good to do!



# Reference
- [dbtlearn github, provide resources for the project](https://github.com/nordquant/complete-dbt-bootcamp-zero-to-hero)