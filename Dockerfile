FROM aplusplus/ubuntu:14.04
MAINTAINER Shengwei An (njuasw#gmail.com)

# Install something
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y python python-dev python-setuptools && \
    apt-get install -y nginx supervisor libmysqlclient-dev && \
    apt-get install -y libffi-dev libssl-dev && \
    easy_install pip && \
    pip install pyopenssl ndg-httpsclient pyasn1 && \
    apt-get install -y libjpeg-dev libfreetype6-dev zlib1g-dev libpng12-dev && \
    rm -rf /var/lib/apt/lists/*

# install our code
COPY configs/requirements /DjangoProject/
RUN pip install -r /DjangoProject/requirements
COPY configs/ /DjangoProject/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm -f /etc/nginx/sites-enabled/default && \
    rm -f /DjangoProject/run/gunicorn.sock && \
    chmod u+x /DjangoProject/bin/gunicorn_start  && \
    chmod u+x /DjangoProject/bin/run.sh && \
    ln -s /DjangoProject/supervisor-hello.conf /etc/supervisor/conf.d/ && \
    ln -s /DjangoProject/nginx-hello.conf /etc/nginx/sites-enabled/ && \
    cd /DjangoProject/duoshuo-python-sdk/ && python setup.py install && \
    rm -rf /DjangoProject/duoshuo-python-sdk/

EXPOSE 80
CMD ["/DjangoProject/bin/run.sh"]
