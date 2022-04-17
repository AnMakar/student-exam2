FROM centos:7

RUN yum update -y && \
        yum install python3 -y && \
        yum install git -y && \
        git clone https://github.com/AnMakar/student-exam2 /opt/student-exam2

WORKDIR /opt/student-exam2
ENV PATH="/opt/student-exam2/venv/bin:$PATH"

RUN python3 -m venv /opt/student-exam2/venv && \
        /opt/student-exam2/venv/bin/pip install --upgrade pip && \
        /opt/student-exam2/venv/bin/pip install -e /opt/student-exam2/

ENV FLASK_APP=/opt/student-exam2/js_example
ENV LC_ALL=en_US.utf-8

ENTRYPOINT flask run --host=0.0.0.0
