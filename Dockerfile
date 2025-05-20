FROM stain/jena-fuseki:4.8.0
WORKDIR /jena-fuseki

COPY run/databases/Juegos    /jena-fuseki/databases/Juegos
COPY dataset/config.ttl      /jena-fuseki/config.ttl
COPY dataset/shiro.ini       /jena-fuseki/shiro.ini

EXPOSE 3030
