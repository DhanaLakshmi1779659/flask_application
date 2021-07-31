FROM artifactory.pfizer.com/vessel-core-docker-dev/vessel-core-image-centos-python:7
USER root
#RUN mkdir -p /opt/batchFileTranslation/CopyFilesAndTranslateSP
COPY . /flask
RUN chmod -R 777 /flask
RUN yum install -y \
    gcc-c++ \
    openssl-devel \
    bash
RUN yum install -y unixODBC-devel
RUN pip install flask
WORKDIR /flask/flask-rest-api-test
EXPOSE 5000

CMD [ "python", "flask-rest-api.py" ]
