# quickcached-docker
quickcached docker image


<code>docker pull quickserverlab/quick-cached:latest

docker run -itd --name my-cache-1 -p 11211:11211 quickserverlab/quick-cached:latest

docker run -itd --name my-cache-1 -p 11211:11211 -e QUICKCACHED_OPTS='-Xms512m -Xmx512m' quickserverlab/quick-cached:latest
</code>
