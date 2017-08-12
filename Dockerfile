# Updated as of July 17, 2017
# Install FROM UBUNTU IMAGE with nano, curl and java 8
FROM akshathkumar/ubuntu1604-java8

# Author
MAINTAINER Akshathkumar Shetty

ENV QUICKCACHED_VERSION 2.0.2

RUN apt-get -y install unzip

# Get QuickCached
RUN wget --quiet --no-cookies https://github.com/QuickServerLab/QuickCached/releases/download/v${QUICKCACHED_VERSION}/QuickCachedv${QUICKCACHED_VERSION}.zip -O /tmp/quickcached.zip && \
unzip /tmp/quickcached.zip -d /opt/quickcached && \
rm /tmp/quickcached.zip

# cleanup
RUN rm -rf /opt/quickcached/nbproject && \
rm -rf /opt/quickcached/src && \
rm -rf /opt/quickcached/yajsw && \
rm -rf /opt/quickcached/__MACOSX && \
rm -rf /opt/quickcached/libtest && \
rm /opt/quickcached/build.xml

#ENV QUICKCACHED_OPTS="-Xms1024m -Xmx1024m"
ENV QUICKCACHED_HOME /opt/quickcached
ENV PATH $PATH:$QUICKCACHED_HOME

RUN chmod +x /opt/quickcached/QuickCached-d.sh
RUN chmod +x /opt/quickcached/QuickCached.sh

#Expose this a port to the host machine.
EXPOSE 11211

WORKDIR /opt/quickcached

# Launch QuickCached
CMD ["/opt/quickcached/QuickCached.sh", "run"]
