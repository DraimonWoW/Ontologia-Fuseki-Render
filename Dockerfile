FROM stain/jena-fuseki:4.8.0
WORKDIR /jena-fuseki

# Copiamos la BD y configs
COPY run/databases/Juegos    /jena-fuseki/databases/Juegos
COPY dataset/config.ttl      /jena-fuseki/config.ttl
COPY dataset/shiro.ini       /jena-fuseki/shiro.ini

# Copiamos el wrapper y ya le damos permisos de
# ejecución en un sólo paso con --chmod
COPY --chmod=0755 run-start.sh /jena-fuseki/run-start.sh

EXPOSE 3030

# Usamos directamente el wrapper (no chmod adicional)
ENTRYPOINT ["/jena-fuseki/run-start.sh"]
