FROM centos:7

RUN yum update -y && \
        yum install python3 -y

COPY . /opt/student-exam2

WORKDIR /opt/student-exam2

ENV VIRTUAL_ENV=/opt/student-exam2/venv

RUN python3 -m venv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install -e /opt/student-exam2/

ENV FLASK_APP=/opt/student-exam2/js_example

ENTRYPOINT flask run --host=0.0.0.0
