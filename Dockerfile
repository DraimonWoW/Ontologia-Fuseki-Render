FROM stain/jena-fuseki:4.8.0
WORKDIR /jena-fuseki

COPY run/databases/Juegos  /jena-fuseki/databases/Juegos
COPY dataset/config.ttl    /jena-fuseki/config.ttl
COPY dataset/shiro.ini     /jena-fuseki/shiro.ini

# Copiamos y damos permisos al script
COPY run-start.sh /jena-fuseki/run-start.sh
RUN chmod +x /jena-fuseki/run-start.sh

EXPOSE 3030

# Usamos el wrapper como entrypoint
ENTRYPOINT ["/jena-fuseki/run-start.sh"]