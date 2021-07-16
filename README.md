andrewrothstein.kubectl
=======================
![Build Status](https://github.com/andrewrothstein/ansible-kubectl/actions/workflows/build.yml/badge.svg)

Installs [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)

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
