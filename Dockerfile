FROM stain/jena-fuseki:4.8.0

ENV FUSEKI_HOME=/fuseki
WORKDIR /fuseki

COPY run/databases/Juegos  /fuseki/databases/Juegos
COPY dataset/config.ttl   /fuseki/config.ttl
COPY dataset/shiro.ini     /fuseki/shiro.ini

EXPOSE 3030

# Aquí indicamos explícitamente el comando fuseki-server
CMD ["fuseki-server", "--config=/fuseki/config.ttl", "--host=0.0.0.0", "--port=3030"]
