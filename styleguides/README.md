# DataOps Project Style Guides

_This resource can be used as a starting point for deciding on a style guide for your team,
covering topics such as naming conventions, code formatting rules, and other coding
standards._

## Python Style Guide

_Save time, write better code, use [Black](https://black.readthedocs.io/en/stable/). For Python code, the auto-formatter [Black](https://black.readthedocs.io/en/stable/) is recommended for all new projects._

From the docs:

> By using Black, you agree to cede control over minutiae of hand-formatting. In return, Black gives you speed, determinism, and freedom from pycodestyle nagging about formatting. You will save time and mental energy for more important matters.
>
> Black makes code review faster by producing the smallest diffs possible. Blackened code looks the same regardless of the project you’re reading. Formatting becomes transparent after a while and you can focus on the content instead.

## SQL Style Guide

SQL code is beautiful when it is Pythonic. That is to say, SQL code should try to meet the following objectives:

- readability of the code is prioritized highly
- it is obvious where the start of each new expression lies
- line lengths are limited so as to eliminate horizontal scrolling (width of 90 or 100 characters, max)
- caps are used sparingly and capitalization rules applied consistently
- columns are named succinctly but clearly

Additionally:

- Column names should match to a global glossary - having the same definition and data type regardless of table, with 2 exceptions:
  1. When a column is appended to another table as a foreign lookup, it's context should be provided.
       - _For example, the columns `user_name` and `cost_center` when provided through a `manager_id` join should be aliased as `manager_name` and `manager_cost_center`, respectively._
  2. Columns should _not_ be globally prefixed with the name of the entity unless that additional context provides some clear value.
       - _Example A: the `dim_users`.`manager_id` column does not need to be prefixed with `user_`.
- Columns should be named in a way that their use is obvious, without trial and error.
  - ...

### Available Auto-Formatters:
-
