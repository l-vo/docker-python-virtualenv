# Multiple Python environments container

This container provides several versions of Python for creating separated Python environments via `virtualenv`. This container is particularly well suited to use `tox` with multiple Python versions.

## Installed Python versions
The following Python versions are installed:
- Python 2.7
- Python 3.4
- Python 3.5
- Python 3.6
- Python 3.7

## Linux distribution
This container uses Fedora since this distribution allows to install multiple Python versions in a very simple way.

## Log into the container
In most cases, you want to run a project with differents Python versions. Your project should be mapped to the `/var/project` directory of the container:
```bash
$ docker run -it --rm -v /path/to/your/project:/var/project lvo9/python-virtualenv bash
```

## Use virtual Python environments
The following environments are generated by default:
- `/var/environments/py27`
- `/var/environments/py34`
- `/var/environments/py35`
- `/var/environments/py36`
- `/var/environments/py37`

For instance, let's use Python 3.5 environment; according to the [virtualenv](https://virtualenv.pypa.io/en/latest/) documentation:
```bash
[root@0800a40e232f project]# source /var/environments/py35/bin/activate
(py35) [root@0800a40e232f project]# python --version  # will display Python 3.5.6
```
You can now test your project with Python 3.5. To quit current virtual environment:
```bash
(py35) [root@0800a40e232f project]# deactivate
```

Of course, you can create as many environments as you need (to work with many versions of a library for instance). For creating another Python 3.5 virtual environment:

```bash
[root@0800a40e232f project]# virtualenv -p /usr/bin/python3.5 /var/environments/py35_custom
```

When creating extra virtual environments (or if you modify the existing ones), you should create a docker volume. If you don't do so, your new and/or customized environments will be lost when you close the container. Let's bind the environments folder to a directory of your host machine:

```bash
$ docker run -it --rm -v /path/to/your/project:/var/project -v /path/to/backup/environments:/var/environments lvo9/python-virtualenv bash
```

## Use Tox
[Tox](https://tox.readthedocs.io/) is preinstalled in the container. According to the Python versions installed, you can have the following environment list in your tox.ini:
```ini
[tox]
envlist = py27,py34,py35,py36,py37
```