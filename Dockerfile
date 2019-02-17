FROM fedora:29

# Multiple Python versions installation
RUN dnf install -y python27 python34 python35 python36 python37

# Install virtualenv and base virtual environments creation
RUN pip install tox virtualenv
RUN mkdir /var/environments
RUN virtualenv -p /usr/bin/python2.7 /var/environments/py27
RUN virtualenv -p /usr/bin/python3.4 /var/environments/py34
RUN virtualenv -p /usr/bin/python3.5 /var/environments/py35
RUN virtualenv -p /usr/bin/python3.6 /var/environments/py36
RUN virtualenv -p /usr/bin/python3.7 /var/environments/py37

# Project dir creation
RUN mkdir /var/project
VOLUME ["/var/project"]
WORKDIR /var/project
