============
bash-formula
============

Salt Stack Formula to set up and configure Bash, the Bourne Again SHell

NOTICE BEFORE YOU USE
=====================

* This formula aims to follow the conventions and recommendations described at http://docs.saltstack.com/topics/conventions/formulas.html

TODO
====

* make setup and configuration of features like aliases, prompts, etc. compatible to other formulas and shells as well
* configure shell aliases
* configure skeleton
* configure login/logout scripts
* configure shell history

Instructions
============

1. Add this repository as a `GitFS <http://docs.saltstack.com/topics/tutorials/gitfs.html>`_ backend in your Salt master config.

2. Configure your Pillar top file (``/srv/pillar/top.sls``), see pillar.example

3. Include this Formula within another Formula or simply define your needed states within the Salt top file (``/srv/salt/top.sls``).

Available states
================

.. contents::
    :local:

``bash``
--------

Do basic setup of bash and additional features like bash-completion

Additional resources
====================

None

Formula Dependencies
====================

None

Contributions
=============

Contributions are always welcome. All development guidelines you have to know are

* write clean code (proper YAML+Jinja syntax, no trailing whitespaces, no empty lines with whitespaces, LF only)
* set sane default settings
* test your code
* update README.rst doc

Salt Compatibility
==================

Tested with:

* 2014.1.3

OS Compatibility
================

Tested with:

* GNU/ Linux Debian Wheezy 7.5
* CentOS 6.5
