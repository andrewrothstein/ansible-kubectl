andrewrothstein.kubectl
=======================
[![CircleCI](https://circleci.com/gh/andrewrothstein/ansible-kubectl.svg?style=svg)](https://circleci.com/gh/andrewrothstein/ansible-kubectl)

A role for installing [kubectl](http://kubernetes.io/docs/user-guide/prereqs/)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------
```yml
- hosts: servers
  roles:
    - andrewrothstein.kubectl
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
